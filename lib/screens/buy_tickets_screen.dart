import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/events_controller.dart';
import '../core/models/event.dart';
import '../widgets/event_products_list_widget.dart';
import '../widgets/loading_spinner.dart';
import '../widgets/payment_screen.dart';

class BuyTicketsScreen extends StatelessWidget {
  EventsController eventsController = Get.find();
  Event event;

  BuyTicketsScreen({
    super.key,
    required this.event,
  });

  void onInit() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: background(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              topTitle(event: event),
              productsListContainer(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: customBottomNavBar(context),
    );
  }

  GetBuilder<EventsController> productsListContainer() {
    return GetBuilder<EventsController>(
        init: eventsController,
        builder: ((controller) => FutureBuilder(
            future: controller.getEventProducts(event.eventId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return SizedBox(
                  height: 645,
                  width: 410,
                  child: Obx(
                    () => EventProductsListWidget(
                      eventProducts: eventsController.eventProductsList,
                    ),
                  ),
                );
              } else {
                return const Padding(
                  padding: EdgeInsets.only(left: 25, right: 25),
                  child: loadingSpinner(),
                );
              }
            })));
  }

  BottomAppBar customBottomNavBar(BuildContext context) {
    return BottomAppBar(
      child: Container(
        color: Color.fromARGB(255, 169, 216, 255),
        height: 50.0,
        child: Stack(
          children: [
            Obx(
              () => totalPrice(),
            ),
            checkoutButton(context),
            Obx(
              () => ticketCounter(),
            ),
          ],
        ),
      ),
    );
  }

  Align checkoutButton(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateColor.resolveWith(
              (states) => const Color.fromARGB(255, 169, 216, 255)),
          padding: MaterialStateProperty.resolveWith((states) =>
              const EdgeInsets.only(bottom: 5, top: 5, left: 40, right: 40)),
        ),
        onPressed: () {
          eventsController.selectedProductsLength > 0
              ? Get.to(() => Payment())
              : ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.redAccent,
                    content: Container(
                      padding: EdgeInsets.all(2.0),
                      child: const Text(
                        'No tickets found in the cart',
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
        },
        child: Text(
          'Checkout',
          style: TextStyle(
            color: Colors.orange[800],
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }

  BoxDecoration background() {
    return const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.orange, Colors.purple]));
  }

  Widget ticketCounter() {
    return eventsController.selectedProductsLengthRx.value > 0
        ? Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: EdgeInsets.all(5.0),
              padding: EdgeInsets.only(bottom: 5, top: 5, left: 8, right: 8),
              decoration: BoxDecoration(
                color: Colors.orange[700],
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Text(
                eventsController.selectedProductsLengthRx.value.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 23.0,
                ),
              ),
            ),
          )
        : Container();
  }

  totalPrice() {
    return eventsController.selectedProductsLengthRx.value > 0
        ? Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.all(5.0),
              padding: EdgeInsets.only(bottom: 5, top: 5, left: 8, right: 8),
              decoration: BoxDecoration(
                color: Colors.orange[700],
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Text(
                '€' + eventsController.getSaleTotal.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 23.0,
                ),
              ),
            ),
          )
        : Container();
  }
}

class topTitle extends StatelessWidget {
  const topTitle({
    super.key,
    required this.event,
  });

  final Event event;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        color: Color.fromARGB(255, 180, 221, 255),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                event.eventTitle,
                style: const TextStyle(
                  fontSize: 22,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
