import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:events_app/core/models/customer_ticket.dart';
import 'package:events_app/core/models/event-product.dart';
import 'package:events_app/core/models/http-response.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../core/models/event.dart';
import '../core/models/purchase-id-response.dart';
import '../core/models/ticket.dart';

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

  //all events list
  final RxList<Event> _allEvents = <Event>[
    new Event(eventId: 0, eventTitle: '', venueName: '', eventDateTime: '')
  ].obs;
  List<Event> get allEventsList => _allEvents.value;

  //all events list - filtered
  final RxList<Event> _filteredEvents = <Event>[
    new Event(eventId: 0, eventTitle: '', venueName: '', eventDateTime: '')
  ].obs;
  List<Event> get filteredEventsList => _filteredEvents.value;

  //event products list
  final RxList<EventProduct> _eventProducts = <EventProduct>[].obs;
  List<EventProduct> get eventProductsList => _eventProducts.value;

  //selected products list
  final RxList<EventProduct> _selectedProducts = <EventProduct>[].obs;
  List<EventProduct> get selectedProductsList => _selectedProducts.value;
  int get selectedProductsLength => _selectedProducts.value.length;
  RxInt get selectedProductsLengthRx => _selectedProducts.value.length.obs;

  //customer tickets list
  final RxList<CustomerTicket> _customerTickets = <CustomerTicket>[].obs;
  List<CustomerTicket> get customerTicketsList => _customerTickets.value;
  int get customerTicketsLength => _customerTickets.value.length;
  RxInt get customerTicketsLengthRx => _customerTickets.value.length.obs;

  //sale total
  final RxDouble _saleTotal = 0.00.obs;
  double get getSaleTotal => _saleTotal.value;

  //purchase id
  final RxInt _purchaseId = 0.obs;
  int get purchaseIdValue => _purchaseId.value;
  set setPurchaseId(int value) => _purchaseId.value = value;

  /// *api calls*
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

  Future<void> getEventProducts(int eventId) async {
    //_dio.options.headers['authorization'] = 'Bearer $token';
    try {
      final response = await dio.get(
          '$apiUrl/$controllerOffset/CustomerEvents/GetEventProductsForCustomer?eventId=$eventId');

      if (response.statusCode == 200) {
        var responseValue = HttpResponse.fromJson(response.data).value;

        _eventProducts.value = [];

        _eventProducts.value = EventProduct.ListFromJson(responseValue);
      } else {
        print('${response.statusCode} : ${response.data.toString()}');
        throw response.statusCode ?? 0;
      }
    } on DioError catch (e) {
      debugPrint("Status code: ${e.response?.statusCode.toString()}");
      throw Exception(e.message);
    }
  }

  Future<void> initializePurchase() async {
    //_dio.options.headers['authorization'] = 'Bearer $token';
    var customerId = 1;
    try {
      final response = await dio.post(
          '$apiUrl/$controllerOffset/CustomerPurchases/InitializePurchase?customerId=$customerId');

      if (response.statusCode == 200) {
        var responseValue = HttpResponse.fromJson(response.data).value;

        _purchaseId.value = 0;

        _purchaseId.value =
            PurchaseIdResponse.fromJson(responseValue).purchaseId;

        print(PurchaseIdResponse.fromJson(responseValue).purchaseId);
      } else {
        print('${response.statusCode} : ${response.data.toString()}');
        throw response.statusCode ?? 0;
      }
    } on DioError catch (e) {
      debugPrint("Status code: ${e.response?.statusCode.toString()}");
      throw Exception(e.message);
    }
  }

  Future<void> completePurchase() async {
    //_dio.options.headers['authorization'] = 'Bearer $token';
    try {
      print(purchaseIdValue);
      final response = await dio.post(
          '$apiUrl/$controllerOffset/CustomerPurchases/CompletePurchase?purchaseId=$purchaseIdValue');

      if (response.statusCode == 200) {
      } else {
        print('${response.statusCode} : ${response.data.toString()}');
        throw response.statusCode ?? 0;
      }
    } on DioError catch (e) {
      debugPrint("Status code: ${e.response?.statusCode.toString()}");
      throw Exception(e.message);
    }
  }

  Future<void> addPurchasedTickets() async {
    //_dio.options.headers['authorization'] = 'Bearer $token';
    var customerId = 1;

    try {
      List<Ticket> tickets = <Ticket>[];

      _selectedProducts.value.forEach((product) => tickets.add(Ticket(
          customerId: customerId,
          purchaseId: purchaseIdValue,
          eventProductId: product.eventProductId,
          sectionId: product.sectionId)));

      print(tickets);

      final response = await dio.post(
          '$apiUrl/$controllerOffset/CustomerPurchases/AddPurchasedTickets',
          data: json.encode(tickets));

      if (response.statusCode == 200) {
        var responseValue = HttpResponse.fromJson(response.data).value;
        _selectedProducts.value = [];
      } else {
        print('${response.statusCode} : ${response.data.toString()}');
        throw response.statusCode ?? 0;
      }
    } on DioError catch (e) {
      debugPrint("Status code: ${e.response?.statusCode.toString()}");
      throw Exception(e.message);
    }
  }

  Future<void> getCustomerTickets() async {
    //_dio.options.headers['authorization'] = 'Bearer $token';
    var customerId = 1;
    try {
      final response = await dio.get(
          '$apiUrl/$controllerOffset/CustomerPurchases/GetCustomerTickets?customerId=$customerId');

      if (response.statusCode == 200) {
        var responseValue = HttpResponse.fromJson(response.data).value;

        _customerTickets.value = [];

        _customerTickets.value = CustomerTicket.ListFromJson(responseValue);
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

  void addProductToSelectedProductsList(EventProduct product) {
    _selectedProducts.value.add(product);
    _selectedProducts.refresh();
    calculateSaleTotal();
  }

  void removeProductFromSelectedProductsList(EventProduct product) {
    _selectedProducts.value.remove(product);
    _selectedProducts.refresh();
    calculateSaleTotal();
  }

  void calculateSaleTotal() {
    _saleTotal.value = 0.0;

    if (_selectedProducts.value.length == 0) return;

    _selectedProducts.value
        .forEach((product) => _saleTotal.value += product.price);
    _saleTotal.refresh();
  }
}
