import 'dart:io';

import 'package:events_app/screens/home.dart';
import 'package:events_app/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'MyHttpOverrides.dart';
import 'controllers/init_dependency.dart';
import 'screens/login.dart';

void main() {
  //remove when in production
  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitDep(),
      debugShowCheckedModeBanner: false,
      home: RegisterScreen(),
    );
  }
}
