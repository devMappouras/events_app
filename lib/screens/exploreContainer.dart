import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/events_controller.dart';
import '../widgets/event_list_widget.dart';
import '../widgets/loading_spinner.dart';

class exploreContainer extends StatelessWidget {
  EventsController eventsController = Get.find();
  final List<String> categories = [
    'All',
    'Music',
    'Dance',
    'Tournaments',
    'Speeches'
  ];
  TextEditingController categoryController = TextEditingController(text: 'All');

  exploreContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(children: <Widget>[
        Row(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Category:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8, right: 8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    color: Colors.brown[50],
                    child: CustomDropdown(
                      hintText: 'Select Category',
                      items: categories,
                      onChanged: (String newValue) {
                        filterEventsList(newValue);
                      },
                      controller: categoryController,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        GetBuilder<EventsController>(
            init: eventsController,
            builder: ((controller) => FutureBuilder(
                future: controller.getExploreEvents(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return SizedBox(
                      height: 572,
                      width: 200,
                      child: Obx(
                        () => EventsListWidget(
                          events: eventsController.filteredEventsList,
                          cameFromHomeScreen: false,
                        ),
                      ),
                    );
                  } else {
                    return const Padding(
                      padding: EdgeInsets.only(left: 25, right: 25),
                      child: loadingSpinner(),
                    );
                  }
                }))),
      ]),
    );
  }

  void filterEventsList(String categoryName) {
    eventsController.resetFilteredList();
    eventsController.filterEventsList(categoryName);
  }
}
