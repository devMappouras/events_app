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
        children: [
          SizedBox(
            width: 60,
            child: customSpinBox(),
          ),
          Container(
            width: 4,
          ),
          TicketWidget(
            width: 320,
            height: 135,
            isCornerRounded: true,
            padding: const EdgeInsets.all(20),
            child: TicketData(eventProduct: eventProduct),
          ),
        ],
      ),
    );
  }

  SpinBox customSpinBox() {
    return SpinBox(
      min: 0,
      max: 6,
      value: 0,
      spacing: 0,
      direction: Axis.vertical,
      textStyle: const TextStyle(fontSize: 26),
      incrementIcon: const Icon(Icons.keyboard_arrow_up, size: 46),
      decrementIcon: const Icon(Icons.keyboard_arrow_down, size: 46),
      decoration: const InputDecoration(
        border: InputBorder.none,
        contentPadding: EdgeInsets.only(left: 5, top: 0, bottom: 0, right: 0),
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
                border: Border.all(
                    width: 1.0, color: Color.fromARGB(255, 3, 129, 11)),
              ),
              child: Center(
                child: Text(
                  eventProduct.hierarchyName,
                  style: TextStyle(color: Color.fromARGB(255, 3, 129, 11)),
                ),
              ),
            ),
            Text(
              eventProduct.sectionName.length > 14
                  ? eventProduct.sectionName
                  : 'Section: ' + eventProduct.sectionName,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 47, left: 8),
              child: Text(
                'Price: €' + eventProduct.price.toString(),
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
