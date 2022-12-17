import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/auth_controller.dart';
import '../widgets/event_list_widget.dart';

class HomeContainer extends StatelessWidget {
  final List<String> upcomingEvents = <String>['A', 'B', 'C'];
  final List<String> bookedEvents = <String>['C'];
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
        ),
        EventsListWidget(events: bookedEvents, title: 'Booked Events:'),
      ]),
    );
  }
}
