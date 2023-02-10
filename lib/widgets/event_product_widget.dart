import 'package:events_app/core/models/event-product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:ticket_widget/ticket_widget.dart';

class EventProductWidget extends StatelessWidget {
  final EventProduct eventProduct;

  const EventProductWidget({
    super.key,
    required this.eventProduct,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 60,
            child: SpinBox(
              min: 0,
              max: 6,
              value: 0,
              spacing: 0,
              direction: Axis.vertical,
              textStyle: TextStyle(fontSize: 26),
              incrementIcon: Icon(Icons.keyboard_arrow_up, size: 50),
              decrementIcon: Icon(Icons.keyboard_arrow_down, size: 50),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: const EdgeInsets.all(0),
              ),
            ),
          ),
          Container(
            width: 10,
          ),
          TicketWidget(
            width: 290,
            height: 120,
            isCornerRounded: true,
            padding: const EdgeInsets.all(20),
            child: TicketData(eventProduct: eventProduct),
          ),
        ],
      ),
    );
  }
}

class TicketData extends StatelessWidget {
  final EventProduct eventProduct;

  const TicketData({
    Key? key,
    required this.eventProduct,
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
                border: Border.all(width: 1.0, color: Colors.green),
              ),
              child: Center(
                child: Text(
                  eventProduct.hierarchyName,
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ),
            Text(
              'LHR',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Text(
            eventProduct.sectionName,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
