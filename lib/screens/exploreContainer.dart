import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:events_app/widgets/category_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/models/event.dart';
import '../widgets/event_list_widget.dart';

class exploreContainer extends StatelessWidget {
  final List<Event> upcomingEvents = <Event>[
    new Event(
        eventId: 1,
        eventTitle: "eventTitle",
        eventDateTime: "eventDateTime",
        venue: "venue")
  ];
  final List<String> categories = ['All', 'Music', 'Tournaments', 'Speeches'];
  TextEditingController categoryController = TextEditingController(text: 'All');

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
            'Find Awesome Events',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 12.0, left: 8.0, right: 8.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search Event...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              prefixIcon: Icon(Icons.search),
            ),
            style: TextStyle(color: Colors.white),
          ),
        ),
        //CategoryListWidget(),
        Row(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Category:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8, right: 8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    color: Colors.brown[50],
                    child: CustomDropdown(
                      hintText: 'Select Category',
                      items: categories,
                      onChanged: (String newValue) {
                        print(newValue);
                      },
                      controller: categoryController,
                    ),
                  ),
                ),
              ),
            ),
          ],
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
