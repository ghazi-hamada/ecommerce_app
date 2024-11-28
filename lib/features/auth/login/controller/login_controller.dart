import 'dart:math';

import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/functions/handling_data.dart';
import 'package:ecommerce_app/features/auth/login/data/remote/login_data.dart';
import 'package:ecommerce_app/routes_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  dontHaveAccount();
  forgotPassword();
  showPassword();
}

class LoginControllerImpl extends LoginController {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isShowPassword = false;
  LoginData loginData = LoginData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  @override
  dontHaveAccount() {
    Get.toNamed(AppRoutes.kSignup);
  }

  @override
  login() async {
    if (formKey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postData(
        emailController.text,
        passwordController.text,
      );
      statusRequest = handlingData(response);

      print("hello" + response['status']);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          Get.offAllNamed(AppRoutes.khome);
        } else {
          Get.defaultDialog(
              title: "ُWarning", middleText: "Email Or Password is wrong");
          statusRequest = StatusRequest.failure;
        }
      }
    }
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  forgotPassword() {
    Get.toNamed(AppRoutes.kForgetPassword);
  }

  @override
  showPassword() {
    isShowPassword = !isShowPassword;

    update();
  }
}
