import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/functions/handling_data.dart';
import 'package:ecommerce_app/features/auth/verify_code_signup/data/remote/verify_code_signup_data.dart';
import 'package:ecommerce_app/routes_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: camel_case_types
abstract class verifyCodeSignUpController extends GetxController {
  goTOsuccessSignup(String verifyCode);
}

// ignore: camel_case_types
class verifyCodeSignUpControllerImp extends verifyCodeSignUpController {
  GlobalKey<FormState> formstate = GlobalKey();
  VerifyCodeSignupData verifyCodeSignupData = VerifyCodeSignupData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  String? email;

  @override
  goTOsuccessSignup(String verifyCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeSignupData.postData(email!, verifyCode);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      print(
          "response['status']:================================== ${response['status']}");
      if (response['status'] == "success") {
        Get.offAllNamed(
          AppRoutes.kSuccessSignup,
        );
      } else {
        Get.defaultDialog(
            title: "ُWarning", middleText: "Verify code is wrong");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}
