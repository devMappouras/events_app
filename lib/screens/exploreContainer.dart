import 'package:flutter/material.dart';

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
        const Text(
          'Music',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        EventsListWidget(events: upcomingEvents),
        const Padding(
          padding: EdgeInsets.only(top: 20, bottom: 0),
          child: Text(
            'Tournaments',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        EventsListWidget(events: upcomingEvents),
        const Padding(
          padding: EdgeInsets.only(top: 20, bottom: 0),
          child: Text(
            'Speeches',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        EventsListWidget(events: upcomingEvents),
      ]),
    );
  }
}

class EventsListWidget extends StatelessWidget {
  const EventsListWidget({
    super.key,
    required this.events,
  });

  final List<String> events;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 0),
      child: SizedBox(
        height: 300,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.all(8),
          itemCount: events.length,
          itemBuilder: (BuildContext context, int index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Container(
                width: 340,
                color: Colors.white,
                child: Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/events/${events[index]}.png',
                        fit: BoxFit.contain,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 8, top: 4, bottom: 4),
                        child: Text(
                          '25 Dec - 8pm',
                          style: TextStyle(fontSize: 18, color: Colors.blue),
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
                        padding: const EdgeInsets.only(left: 8, top: 10),
                        child: Text(
                          'Event ${events[index]}                                       More Event Information',
                          style: const TextStyle(
                            fontSize: 25,
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
    );
  }
}
