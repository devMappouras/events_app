import 'package:animated_custom_dropdown/custom_dropdown.dart';
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
        venueName: "venueName")
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
        SizedBox(
          height: 450,
          width: 200,
          child: EventsListWidget(
            events: upcomingEvents,
          ),
        )
      ]),
    );
  }
}
