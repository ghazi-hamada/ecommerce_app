import 'package:ecommerce_app/core/routing/routes_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

// ignore: camel_case_types
abstract class verifyCodeController extends GetxController {
  checkCode();
  goTOResetPassword(String verificationCode);
}

// ignore: camel_case_types
class verifyCodeControllerImp extends verifyCodeController {
  @override
  checkCode() {
    // TODO: implement checkCode
    throw UnimplementedError();
  }

  @override
  goTOResetPassword(String verificationCode) {
    Get.toNamed(AppRoutes.kResetpassword);
  }
}
