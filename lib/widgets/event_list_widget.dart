import 'package:events_app/screens/event_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/models/event.dart';
import 'event_widget.dart';

class EventsListWidget extends StatelessWidget {
  final List<Event> events;
  bool cameFromHomeScreen;

  EventsListWidget({
    super.key,
    required this.events,
    required this.cameFromHomeScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.all(10),
                itemCount: events.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () => Get.to(() => EventDetailsScreen(
                          event: events[index],
                          cameFromHomeScreen: cameFromHomeScreen,
                        )),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: EventWidget(event: events[index]),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    height: 20, //height spacing of divider
                    thickness: 0, //thickness of divider line
                    indent: 0, //spacing at the start of divider
                    endIndent: 0, //spacing at the end of divider
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
