import 'package:events_app/core/models/customer_ticket.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:ticket_widget/ticket_widget.dart';
import '../controllers/events_controller.dart';
import '../core/models/ticket.dart';

class MyTicketWidget extends StatelessWidget {
  EventsController eventsController = Get.find();

  final CustomerTicket ticket;

  MyTicketWidget({
    super.key,
    required this.ticket,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(children: <Widget>[
        TicketWidget(
          width: 382,
          height: 185,
          isCornerRounded: true,
          padding: const EdgeInsets.all(20),
          child: TicketData(ticket: ticket),
        ),
        Positioned(
          right: 10.0,
          bottom: 10.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: TextButton(
              onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => Dialog(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          ticket.eventTitle,
                          style: TextStyle(fontSize: 18),
                        ),
                        Container(
                          height: 10,
                        ),
                        Text(
                          ticket.sectionName.length > 14
                              ? ticket.sectionName
                              : 'Section: ${ticket.sectionName}',
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 15),
                        QrImage(
                          data: ticket.ticketId.toString(),
                          version: QrVersions.auto,
                          size: 200,
                          gapless: false,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Close',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              child: const Text(
                'View QR Code',
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class TicketData extends StatelessWidget {
  final CustomerTicket ticket;

  const TicketData({
    Key? key,
    required this.ticket,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 120.0,
              height: 25.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                border: Border.all(
                    width: 1.0, color: Color.fromARGB(255, 3, 129, 11)),
              ),
              child: Center(
                child: Text(
                  ticket.hierarchyName,
                  style: TextStyle(color: Color.fromARGB(255, 3, 129, 11)),
                ),
              ),
            ),
            Text(
              ticket.sectionName.length > 14
                  ? ticket.sectionName
                  : 'Section: ${ticket.sectionName}',
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 15, left: 8),
              child: Text(
                ticket.eventTitle,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8, left: 8),
              child: Text(
                ticket.eventDateTime,
                style: TextStyle(
                    color: Colors.blue[600],
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8, left: 8),
              child: Text(
                ticket.venueName,
                style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
