import 'package:events_app/screens/event_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/models/event.dart';
import 'event_widget.dart';

class EventsListWidget extends StatelessWidget {
  final List<Event> events;
  var title;
  bool cameFromHomeScreen;

  EventsListWidget({
    super.key,
    required this.events,
    required this.title,
    required this.cameFromHomeScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          height: 320,
          color: Color.fromARGB(255, 73, 186, 211),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 20, bottom: 4),
                child: SizedBox(
                  height: 20,
                  child: Text(
                    title,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 280,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.all(8),
                  itemCount: events.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () => Get.to(() => EventDetailsScreen(
                          cameFromHomeScreen: cameFromHomeScreen,
                          event: events[index])),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: eventWidget(event: events[index]),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(
                      height: 1, //height spacing of divider
                      thickness: 1, //thickness of divider line
                      indent: 5, //spacing at the start of divider
                      endIndent: 5, //spacing at the end of divider
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
