import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/route_middleware.dart';

class MyMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    if (route == '/login') {
      return RouteSettings(name: '/login');
    }
    return null;
  }
}