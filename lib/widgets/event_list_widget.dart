import 'package:events_app/screens/event_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventsListWidget extends StatelessWidget {
  final List<String> events;
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
                          cameFromHomeScreen: cameFromHomeScreen)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Container(
                          width: 320,
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/images/events/${events[index]}.png',
                                fit: BoxFit.contain,
                              ),
                              const Padding(
                                padding:
                                    EdgeInsets.only(left: 8, top: 4, bottom: 4),
                                child: Text(
                                  '25 Dec - 8pm',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.blue),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 8, top: 4),
                                child: Text(
                                  'OAKA Venue',
                                  style: TextStyle(
                                    color: Color.fromARGB(221, 59, 59, 59),
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8, top: 10),
                                child: Text(
                                  'Event ${events[index]}                                       More Event Information',
                                  style: const TextStyle(
                                    fontSize: 22,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
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
