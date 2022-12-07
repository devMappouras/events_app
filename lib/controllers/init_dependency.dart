import 'package:dio/dio.dart';
import 'package:events_app/controllers/auth_controller.dart';
import 'package:get/get.dart';

class InitDep implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
  }
}
