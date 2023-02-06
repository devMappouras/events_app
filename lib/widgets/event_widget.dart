import 'package:flutter/material.dart';
import '../core/models/event.dart';

class eventWidget extends StatelessWidget {
  final Event event;

  const eventWidget({
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
          Image.asset(
            'assets/images/events/A.png',
            fit: BoxFit.contain,
            width: 320,
          ),
          Padding(
            padding: EdgeInsets.only(left: 14, top: 4, bottom: 4),
            child: Text(
              event.eventDateTime,
              style: TextStyle(fontSize: 18, color: Colors.blue),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 14, top: 4),
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
