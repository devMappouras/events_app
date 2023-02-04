import 'package:dio/dio.dart';
import 'package:events_app/core/models/http-response.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../core/models/event.dart';

class EventsController extends GetxController {
  static const controllerOffset = 'EventsApi';
  static const apiUrl = 'https://10.0.2.2:7097';
  var dio = Dio();

  @override
  void onInit() async {
    super.onInit();
  }

  //Variables, Setters, Getters
  final RxList<Event> _recommendedEvents = <Event>[
    new Event(eventId: 0, eventTitle: '', venueName: '', eventDateTime: '')
  ].obs;
  List<Event> get recommendedEventsList => _recommendedEvents.value;
  set appendToRecommendedEvents(Event value) => _recommendedEvents.add(value);

  final RxList<Event> _bookedEvents = <Event>[
    new Event(eventId: 0, eventTitle: '', venueName: '', eventDateTime: '')
  ].obs;
  List<Event> get bookedEventsList => _bookedEvents.value;
  set appendToBookedEvents(Event value) => _bookedEvents.add(value);

  //api calls
  Future<void> getHomeEvents() async {
    //_dio.options.headers['authorization'] = 'Bearer $token';
    var customerId = 1;
    try {
      final response = await dio.get(
          '$apiUrl/$controllerOffset/CustomerEvents/GetHomeScreenEvents?customerId=$customerId');

      if (response.statusCode == 200) {
        var responseValue = HttpResponse.fromJson(response.data).value;
        print(responseValue);

        _recommendedEvents.value = [];
        //_bookedEvents.value = [];

        _recommendedEvents.value = Event.ListFromJson(responseValue);
        //_bookedEvents.value = Event.ListFromJson(responseValue);

        print(_recommendedEvents.value);
        //print(_bookedEvents.value);
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
