import '../../routes_app.dart';
import '../services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;

  MyServices myServices = Get.find<MyServices>();
  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString('step') == "logined") {
      return const RouteSettings(name: AppRoutes.khome);
    }
    if (myServices.sharedPreferences.getString('step') == "login") {
      return const RouteSettings(name: AppRoutes.kLogin);
    }
    return null;
  }
}
