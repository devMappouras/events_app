import 'package:dio/dio.dart';
import 'package:events_app/core/models/country.dart';
import 'package:events_app/core/models/http-response.dart';
import 'package:events_app/core/models/login_request.dart';
import 'package:events_app/screens/home.dart';
import 'package:events_app/utils/user_simple_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/models/customer.dart';
import '../core/models/login_response.dart';

class AuthController extends GetxController {
  static const controllerOffset = 'EventsApi';
  static const apiUrl = 'https://10.0.2.2:7097';
  var dio = Dio();

  @override
  void onInit() async {
    super.onInit();
    getCountries();
  }

  //Variables, Setters, Getters
  final RxList<Country> _countries = <Country>[].obs;
  List<Country> get countriesList => _countries.value;
  set appendToCountriesList(Country value) => _countries.add(value);

  final RxList<String> _countriesToDisplay = <String>[''].obs;
  List<String> get countriesNamesList => _countriesToDisplay.value;

  //shared preferences variables
  dynamic prefs;
  RxString token = ''.obs;
  RxInt customerId = 0.obs;
  RxInt countryId = 0.obs;
  RxString firstName = ''.obs;
  RxString email = ''.obs;

  //api calls
  Future<void> getCountries() async {
    try {
      final response =
          await dio.get('$apiUrl/$controllerOffset/Countries/GetCountries');

      if (response.statusCode == 200) {
        var responseValue = HttpResponse.fromJson(response.data).value;
        _countries.value = Country.ListFromJson(responseValue);

        _countriesToDisplay.value = [];

        for (var country in countriesList) {
          _countriesToDisplay.add(country.name);
        }
      } else {
        print('${response.statusCode} : ${response.data.toString()}');
        throw response.statusCode ?? 0;
      }
    } on DioError catch (e) {
      debugPrint("Status code: ${e.response?.statusCode.toString()}");
      throw Exception(e.message);
    }
  }

  Future<void> registerCustomer(Customer customer) async {
    try {
      //_dio.options.headers['authorization'] = 'Bearer $token';

      int selectedCountryId =
          await findSelectedCountryId(customer.countryName!);

      customer.countryId = selectedCountryId;

      final response = await dio.post(
          '$apiUrl/$controllerOffset/Customers/Register',
          data: customer.toJson());

      if (response.statusCode != null && response.statusCode == 200) {
        var responseValue = HttpResponse.fromJson(response.data).value;

        print(responseValue);
      } else {
        print('${response.statusCode} : ${response.data.toString()}');
        throw response.statusCode ?? 0;
      }
    } on DioError catch (e) {
      debugPrint("Status code: ${e.response?.statusCode.toString()}");
      throw Exception(e.message);
    }
  }

  Future<void> loginCustomer(
      LoginRequest loginRequest, BuildContext context) async {
    try {
      //_dio.options.headers['authorization'] = 'Bearer $token';

      final response = await dio.post(
          '$apiUrl/$controllerOffset/Customers/Login',
          data: loginRequest.toJson());

      var responseJson = HttpResponse.fromJson(response.data);

      if (responseJson.statusCode != null && responseJson.statusCode == 200) {
        var loginResponse = LoginResponse.fromJson(responseJson.value);

        // set useful information about user in shared preferences
        await UserSimplePreferences.setToken(loginResponse.token);
        await UserSimplePreferences.setCustomerId(
            loginResponse.customerInfo['customerId']);
        await UserSimplePreferences.setFirstName(
            loginResponse.customerInfo['firstName']);
        await UserSimplePreferences.setEmail(
            loginResponse.customerInfo['email']);
        await UserSimplePreferences.setCountryId(
            loginResponse.customerInfo['countryId']);

        Get.to(() => HomeScreen());

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.greenAccent,
            content: Container(
              padding: EdgeInsets.all(2.0),
              child: const Text(
                'Successfully Logged In',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.redAccent,
            content: Container(
              padding: EdgeInsets.all(2.0),
              child: const Text(
                'User was not Found',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } on DioError catch (e) {
      debugPrint("Status code: ${e.response?.statusCode.toString()}");
      throw Exception(e.message);
    }
  }

  String getUserFirstName() {
    final String? action = prefs.getString('action');
    return action ?? '';
  }

  //helper functions
  findSelectedCountryId(String countryName) =>
      countriesList.firstWhere((country) => country.name == countryName).id;
}
