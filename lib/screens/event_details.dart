import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/event_list_widget.dart';
import 'home.dart';

class EventDetailsScreen extends StatelessWidget {
  EventDetailsScreen({
    super.key,
  });

  @override
  void onInit() async {}

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () => Get.to(() => HomeScreen()),
                    ),
                  )
                ],
              ),
              Image.asset(
                'assets/images/events/A.png',
                fit: BoxFit.contain,
              ),
              FractionallySizedBox(
                widthFactor: 1,
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(left: 8, top: 10),
                        child: Text(
                          'Event A - More Event Information',
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8, top: 4, bottom: 4),
                        child: Text(
                          '25 Dec - 8pm',
                          style: TextStyle(fontSize: 18, color: Colors.blue),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8, top: 4),
                        child: Text(
                          'OAKA Venue',
                          style: TextStyle(
                            color: Color.fromARGB(221, 59, 59, 59),
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
