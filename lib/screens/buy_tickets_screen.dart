import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/events_controller.dart';
import '../core/models/event.dart';
import '../widgets/event_products_list_widget.dart';
import '../widgets/loading_spinner.dart';

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
              GetBuilder<EventsController>(
                  init: eventsController,
                  builder: ((controller) => FutureBuilder(
                      future: controller.getEventProducts(event.eventId),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return SizedBox(
                            height: 590,
                            width: 410,
                            child: Obx(
                              () => EventProductsListWidget(
                                eventProducts:
                                    eventsController.eventProductsList,
                              ),
                            ),
                          );
                        } else {
                          return const Padding(
                            padding: EdgeInsets.only(left: 25, right: 25),
                            child: loadingSpinner(),
                          );
                        }
                      }))),
              // Container(
              //   alignment: Alignment.bottomCenter,
              //   child: Padding(
              //     padding: const EdgeInsets.all(25),
              //     child: ElevatedButton(
              //       onPressed: () {},
              //       style:
              //           ElevatedButton.styleFrom(shape: const StadiumBorder()),
              //       child: const Padding(
              //         padding: EdgeInsets.all(8.0),
              //         child: Text(
              //           'Checkout',
              //           style: TextStyle(fontSize: 24),
              //         ),
              //       ),
              //     ),
              //   ),
              // )
            ],
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
        color: Colors.white,
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
