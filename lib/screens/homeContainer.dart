import 'package:events_app/controllers/events_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../controllers/auth_controller.dart';
import '../core/models/event.dart';
import '../widgets/event_list_widget.dart';
import '../widgets/loading_spinner.dart';

class HomeContainer extends StatelessWidget {
  AuthController authController = Get.find();
  EventsController eventsController = Get.find();
  final String firstname;

  final List<Event> bookedEvents = <Event>[
    new Event(
        eventId: 1,
        eventTitle: "eventTitle",
        eventDateTime: "eventDateTime",
        venueName: "venueName")
  ];

  HomeContainer({super.key, required this.firstname});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EventsController>(
        init: eventsController,
        builder: ((controller) => FutureBuilder(
            future: controller.getHomeEvents(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Center(
                  child: ListView(children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Welcome ${firstname},',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    EventsListWidget(
                      events: eventsController.recommendedEventsList,
                      title: 'Upcoming events near you:',
                      cameFromHomeScreen: true,
                    ),
                    EventsListWidget(
                      events: bookedEvents,
                      title: 'Booked Events:',
                      cameFromHomeScreen: true,
                    ),
                  ]),
                );
              } else {
                return const loadingSpinner();
              }
            })));
  }
}
