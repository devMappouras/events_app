import 'package:flutter/material.dart';
import '../core/models/event-product.dart';
import 'event_product_widget.dart';

class EventProductsListWidget extends StatelessWidget {
  final List<EventProduct> eventProducts;

  const EventProductsListWidget({
    super.key,
    required this.eventProducts,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(10),
        itemCount: eventProducts.length,
        itemBuilder: (BuildContext context, int index) {
          return EventProductWidget(eventProduct: eventProducts[index]);
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
    );
  }
}
