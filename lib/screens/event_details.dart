import 'dart:typed_data';
import 'package:events_app/controllers/events_controller.dart';
import 'package:events_app/screens/buy_tickets_screen.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import '../core/models/event.dart';
import 'home.dart';

class EventDetailsScreen extends StatelessWidget {
  EventsController eventsController = Get.find();
  Event event;
  bool isFavorite = false;
  bool cameFromHomeScreen = false;

  EventDetailsScreen({
    super.key,
    required this.event,
    required this.cameFromHomeScreen,
  });

  void onInit() async {
    if (eventsController.isEventfavourited(event.eventId)) {
      isFavorite = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.orange, Colors.purple])),
        child: SafeArea(
          child: Column(
            children: [
              customTopBar(event),
              eventInfo(event),
              Container(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => BuyTicketsScreen(
                            event: event,
                          ));
                    },
                    style:
                        ElevatedButton.styleFrom(shape: const StadiumBorder()),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Buy Tickets',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget eventInfo(Event event) {
    return Column(children: [
      ShaderMask(
        blendMode: BlendMode.srcATop,
        shaderCallback: (Rect bounds) {
          return LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.orange[600]!, Colors.transparent],
            stops: [0, 0.5],
          ).createShader(bounds);
        },
        child: Stack(children: <Widget>[
          Image.asset(
            'assets/images/events/${event.categoryName!.toLowerCase()}.png',
            fit: BoxFit.cover,
          ),
          Positioned(
              right: 10.0,
              bottom: 10.0,
              child: FavoriteButton(
                isFavorite: eventsController.isEventfavourited(event.eventId),
                valueChanged: (isFavorite) {
                  eventsController.favoriteEvent(event.eventId);
                },
              )),
        ]),
      ),
      FractionallySizedBox(
        widthFactor: 1,
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  event.eventTitle,
                  style: const TextStyle(
                    fontSize: 22,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 4, bottom: 4),
                child: Text(
                  event.eventDateTime,
                  style: const TextStyle(fontSize: 18, color: Colors.blue),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 4, bottom: 10),
                child: Text(
                  event.venueName,
                  style: const TextStyle(
                    color: Color.fromARGB(221, 59, 59, 59),
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      checkIfDescriptionExists(event.eventDescription),
    ]);
  }

  Row customTopBar(Event event) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.to(() => cameFromHomeScreen
              ? HomeScreen(newContainerIndex: 0)
              : HomeScreen(newContainerIndex: 1)),
        ),
      ),
      const Text(
        "Event Detail",
        style: TextStyle(
          fontSize: 20,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
            icon: const Icon(Icons.share),
            onPressed: () async {
              Share.share(
                  "Hey! Check this event I found in Events.tech app:\n\n" +
                      event.eventTitle +
                      '\nDate: ' +
                      event.eventDateTime +
                      '\nVenue: ' +
                      event.venueName);
            }),
      ),
    ]);
  }
}

checkIfDescriptionExists(eventDescription) {
  if (eventDescription == null || eventDescription == '') return Container();

  return FractionallySizedBox(
    widthFactor: 1,
    child: Container(
      color: Colors.white,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 10, bottom: 4),
            child: Text(
              "Description:",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 5),
            child: Text(
              eventDescription,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
