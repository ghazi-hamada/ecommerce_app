import 'package:dartz/dartz.dart';
import '../../../../core/class/status_request.dart';
import '../../../../core/functions/handling_data.dart';
import '../../../../core/services/services.dart';
import '../data/remote/verify_code_login_data.dart';
import '../../../../routes_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ActivateAccountController extends GetxController {
  verifyNow();
}

class ActivateAccountControllerImpl extends ActivateAccountController {
  String? email;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    email = Get.arguments['email'];
  }

  @override
  verifyNow() {
    print("email $email");
    Get.offNamed(AppRoutes.kVerfiyCodesignup, arguments: {"email": email});
  }
}
