import 'dart:io';

import 'package:events_app/screens/exploreContainer.dart';
import 'package:events_app/screens/home.dart';
import 'package:events_app/utils/user_simple_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'MyHttpOverrides.dart';
import 'controllers/init_dependency.dart';
import 'screens/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //remove when in production
  HttpOverrides.global = MyHttpOverrides();

  await UserSimplePreferences.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitDep(),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
