import 'package:dio/dio.dart';
import 'package:events_app/core/models/country.dart';
import 'package:events_app/core/models/http-response.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../core/models/customer.dart';

class AuthController extends GetxController {
  static const controllerOffset = 'EventsApi';
  static const apiUrl = 'https://10.0.2.2:7097';

  @override
  void onInit() async {
    super.onInit();
    getCountries();
  }

  //Variables, Setters, Getters
  final RxList<Country> _countries = <Country>[].obs;
  List<Country> get countriesList => _countries.value;
  set appendToCountriesList(Country value) => _countries.add(value);

  //methods
  final RxList<String> _countriesToDisplay = <String>[''].obs;
  List<String> get countriesNamesList => _countriesToDisplay.value;

  Future<void> getCountries() async {
    try {
      var dio = Dio();
      final response =
          await dio.get('$apiUrl/$controllerOffset/Countries/GetCountries');

      if (response.statusCode == 200) {
        var responseValue = HttpResponse.fromJson(response.data).value;
        _countries.value = Country.ListFromJson(responseValue);

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

      var dio = Dio();
      final response = await dio.post(
          '$apiUrl/$controllerOffset/Countries/GetCountries',
          data: {'customer': customer});

      if (response.statusCode == 200) {
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
}
