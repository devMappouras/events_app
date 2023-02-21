import 'package:flutter/material.dart';
import '../core/models/event.dart';

class EventWidget extends StatelessWidget {
  final Event event;

  const EventWidget({
    super.key,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(children: <Widget>[
            Image.asset(
              'assets/images/events/${event.categoryName!.toLowerCase()}.png',
              fit: BoxFit.fill,
              width: 392,
              height: 140,
            ),
            Positioned(
              right: 10.0,
              top: 10.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  alignment: Alignment.topRight,
                  decoration: BoxDecoration(
                    color: Colors.orange[700],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      event.categoryName ?? '',
                      style: const TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.only(left: 14, top: 4, bottom: 4),
            child: Text(
              event.eventDateTime,
              style: const TextStyle(fontSize: 18, color: Colors.blue),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14, top: 4),
            child: Text(
              event.venueName,
              style: const TextStyle(
                color: Color.fromARGB(221, 59, 59, 59),
                fontSize: 18,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14, top: 10),
            child: Text(
              event.eventTitle,
              style: const TextStyle(
                fontSize: 22,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
