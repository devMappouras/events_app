import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/models/event.dart';
import 'home.dart';

class BuyTicketsScreen extends StatelessWidget {
  Event event;

  BuyTicketsScreen({
    super.key,
    required this.event,
  });

  void onInit() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: background(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: ElevatedButton(
                    onPressed: () {},
                    style:
                        ElevatedButton.styleFrom(shape: const StadiumBorder()),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Checkout',
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

  BoxDecoration background() {
    return const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.orange, Colors.purple]));
  }
}
