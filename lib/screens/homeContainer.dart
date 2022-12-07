import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class homeContainer extends StatelessWidget {
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  homeContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      const Padding(
        padding: EdgeInsets.all(10.0),
        child: Text(
          'Welcome Chris,',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ),
      const Text(
        'Upcoming events near you:',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 0),
        child: SizedBox(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.all(8),
            itemCount: entries.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: 388,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Event ${entries[index]}',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      )
    ]);
  }
}
