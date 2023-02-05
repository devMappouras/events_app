import 'package:flutter/material.dart';

class loadingSpinner extends StatelessWidget {
  const loadingSpinner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:
          EdgeInsets.only(left: 150.0, right: 150.0, top: 220.0, bottom: 220.0),
      child: CircularProgressIndicator(),
    );
  }
}
