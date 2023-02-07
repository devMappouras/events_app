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

  //recommended events list
  final RxList<Event> _recommendedEvents = <Event>[
    new Event(eventId: 0, eventTitle: '', venueName: '', eventDateTime: '')
  ].obs;
  List<Event> get recommendedEventsList => _recommendedEvents.value;
  set appendToRecommendedEvents(Event value) => _recommendedEvents.add(value);

  //all events list
  final RxList<Event> _allEvents = <Event>[
    new Event(eventId: 0, eventTitle: '', venueName: '', eventDateTime: '')
  ].obs;
  List<Event> get allEventsList => _allEvents.value;
  set appendToAllEvents(Event value) => _allEvents.add(value);

  //all events list - filtered
  final RxList<Event> _filteredEvents = <Event>[
    new Event(eventId: 0, eventTitle: '', venueName: '', eventDateTime: '')
  ].obs;
  List<Event> get filteredEventsList => _filteredEvents.value;
  set appendToFilteredEvents(Event value) => _filteredEvents.add(value);

  //api calls
  Future<void> getHomeEvents() async {
    //_dio.options.headers['authorization'] = 'Bearer $token';
    var customerId = 1;
    try {
      final response = await dio.get(
          '$apiUrl/$controllerOffset/CustomerEvents/GetHomeScreenEvents?customerId=$customerId');

      if (response.statusCode == 200) {
        var responseValue = HttpResponse.fromJson(response.data).value;

        _recommendedEvents.value = [];

        _recommendedEvents.value = Event.ListFromJson(responseValue);
      } else {
        print('${response.statusCode} : ${response.data.toString()}');
        throw response.statusCode ?? 0;
      }
    } on DioError catch (e) {
      debugPrint("Status code: ${e.response?.statusCode.toString()}");
      throw Exception(e.message);
    }
  }

  //api calls
  Future<void> getExploreEvents() async {
    //_dio.options.headers['authorization'] = 'Bearer $token';
    var customerId = 1;
    try {
      final response = await dio.get(
          '$apiUrl/$controllerOffset/CustomerEvents/GetExploreEvents?customerId=$customerId');

      if (response.statusCode == 200) {
        var responseValue = HttpResponse.fromJson(response.data).value;

        _allEvents.value = [];
        _filteredEvents.value = [];

        _allEvents.value = Event.ListFromJson(responseValue);
        _filteredEvents.value = Event.ListFromJson(responseValue);
      } else {
        print('${response.statusCode} : ${response.data.toString()}');
        throw response.statusCode ?? 0;
      }
    } on DioError catch (e) {
      debugPrint("Status code: ${e.response?.statusCode.toString()}");
      throw Exception(e.message);
    }
  }

  void resetFilteredList() {
    _filteredEvents.value = [];
    _filteredEvents.value = _allEvents.value;
  }

  void filterEventsList(String categoryName) {
    if (categoryName == 'All') {
      resetFilteredList();
    } else {
      _filteredEvents.value = _filteredEvents.value
          .where((event) => event.categoryName!
              .toLowerCase()
              .contains(categoryName.toLowerCase()))
          .toList();
    }
  }
}
