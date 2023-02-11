import 'package:events_app/core/models/event-product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:get/get.dart';
import 'package:ticket_widget/ticket_widget.dart';

import '../controllers/events_controller.dart';

class EventProductWidget extends StatelessWidget {
  EventsController eventsController = Get.find();

  final EventProduct eventProduct;
  int ticketNumber = 0;

  EventProductWidget({
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
            child: customSpinBox(eventProduct),
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

  SpinBox customSpinBox(EventProduct eventProduct) {
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
      onChanged: (value) {
        int currentValue = value.toInt();
        if ((ticketNumber == 0 && currentValue == 1) ||
            (currentValue > ticketNumber)) {
          eventsController.addProductToSelectedProductsList(eventProduct);
        } else if (currentValue < ticketNumber) {
          eventsController.removeProductFromSelectedProductsList(eventProduct);
        } else {
          print('weird case happened sir');
        }

        ticketNumber = value.toInt();
      },
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
