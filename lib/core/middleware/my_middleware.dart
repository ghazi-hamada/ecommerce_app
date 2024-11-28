import 'package:ecommerce_app/routes_app.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/route_middleware.dart';

class MyMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;

  MyServices myServices = Get.find<MyServices>();
  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getBool('onBoarding_seen') == true) {
      return const RouteSettings(name: AppRoutes.kLogin);
    }
    return null;
  }
}
