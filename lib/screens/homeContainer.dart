import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/auth_controller.dart';
import '../core/models/event.dart';
import '../widgets/event_list_widget.dart';

class HomeContainer extends StatelessWidget {
  final List<Event> upcomingEvents = <Event>[
    new Event(
        eventId: 1,
        eventTitle: "eventTitle",
        eventDateTime: "eventDateTime",
        venue: "venue")
  ];

  final List<Event> bookedEvents = <Event>[
    new Event(
        eventId: 1,
        eventTitle: "eventTitle",
        eventDateTime: "eventDateTime",
        venue: "venue")
  ];
  AuthController authController = Get.find();
  final String firstname;

  HomeContainer({super.key, required this.firstname});

  @override
  Widget build(BuildContext context) {
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
          events: upcomingEvents,
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
  }
}
