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
    return ListView.separated(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.only(left: 5),
      itemCount: eventProducts.length,
      itemBuilder: (BuildContext context, int index) {
        return EventProductWidget(eventProduct: eventProducts[index]);
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(
          height: 0, //height spacing of divider
          thickness: 0, //thickness of divider line
          indent: 0, //spacing at the start of divider
          endIndent: 0, //spacing at the end of divider
        );
      },
    );
  }
}
