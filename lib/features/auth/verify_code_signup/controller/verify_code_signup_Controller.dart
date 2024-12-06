import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/functions/handling_data.dart';
import 'package:ecommerce_app/features/auth/verify_code_signup/data/remote/verify_code_signup_data.dart';
import 'package:ecommerce_app/routes_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: camel_case_types
abstract class verifyCodeSignUpController extends GetxController {
  goTOsuccessSignup(String verifyCode);
  resendVerifyCode();
}

// ignore: camel_case_types
class verifyCodeSignUpControllerImp extends verifyCodeSignUpController {
  GlobalKey<FormState> formstate = GlobalKey();
  VerifyCodeSignupData verifyCodeSignupData = VerifyCodeSignupData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  String? email;
  String hideEmail(String email) {
    // تقسيم البريد الإلكتروني إلى اسم المستخدم والمجال
    final parts = email.split('@');
    if (parts.length != 2) {
      return email; // إذا لم يكن البريد صالحًا، يتم إرجاعه كما هو
    }

    String username = parts[0];
    String domain = parts[1];

    // إخفاء نصف اسم المستخدم
    int visibleLength = (username.length / 2).ceil(); // عدد الأحرف المرئية
    String hiddenPart =
        '*' * (username.length - visibleLength); // عدد الأحرف المخفية
    String hiddenUsername = username.substring(0, visibleLength) + hiddenPart;

    // دمج الأجزاء مع المجال
    return "$hiddenUsername@$domain";
  }

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

  @override
  resendVerifyCode() async {
    statusRequest = StatusRequest.loading;
    var response = await verifyCodeSignupData.resendCode(email!);
    statusRequest = handlingData(response);
    update();
    if (response is Right) {
      Get.rawSnackbar(
        message: "Verify code is sent to your email",
        duration: const Duration(seconds: 1),
      );
      statusRequest = StatusRequest.none;
    } else {
      Get.defaultDialog(
          title: "ُWarning",
          middleText: "Verify code is not sent to your email");
      statusRequest = StatusRequest.failure;
    }
  }
}
