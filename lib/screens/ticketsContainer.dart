import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:events_app/widgets/my_ticket_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/events_controller.dart';
import '../widgets/event_list_widget.dart';
import '../widgets/loading_spinner.dart';

class ticketsContainer extends StatelessWidget {
  EventsController eventsController = Get.find();
  final List<String> categories = ['All', 'Music', 'Tournaments', 'Speeches'];

  ticketsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GetBuilder<EventsController>(
          init: eventsController,
          builder: ((controller) => FutureBuilder(
              future: controller.getCustomerTickets(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return SizedBox(
                    height: 550,
                    child: Obx(() => ListView.separated(
                          scrollDirection: Axis.vertical,
                          padding: EdgeInsets.all(10),
                          itemCount:
                              eventsController.customerTicketsList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return MyTicketWidget(
                                ticket: eventsController
                                    .customerTicketsList[index]);
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const Divider(
                              height: 10, //height spacing of divider
                              thickness: 0, //thickness of divider line
                              indent: 0, //spacing at the start of divider
                              endIndent: 0, //spacing at the end of divider
                            );
                          },
                        )),
                  );
                } else {
                  return const loadingSpinner();
                }
              }))),
    );
  }
}
