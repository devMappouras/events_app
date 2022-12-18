import 'package:flutter/material.dart';

import '../widgets/event_list_widget.dart';

class exploreContainer extends StatelessWidget {
  final List<String> upcomingEvents = <String>['A', 'B', 'C'];

  exploreContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(children: <Widget>[
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            'Explore Events',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        EventsListWidget(
          events: upcomingEvents,
          title: 'Music',
          cameFromHomeScreen: false,
        ),
        const Padding(
          padding: EdgeInsets.only(top: 20, bottom: 0),
        ),
        EventsListWidget(
          events: upcomingEvents,
          title: 'Tournaments',
          cameFromHomeScreen: false,
        ),
        const Padding(
          padding: EdgeInsets.only(top: 20, bottom: 0),
        ),
        EventsListWidget(
          events: upcomingEvents,
          title: 'Speeches',
          cameFromHomeScreen: false,
        ),
      ]),
    );
  }
}
