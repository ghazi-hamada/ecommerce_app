import 'dart:math';

import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/functions/handling_data.dart';
import 'package:ecommerce_app/core/services/services.dart';
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
  MyServices myServices = Get.find();
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
          sharedData(response);
          Get.offAllNamed(AppRoutes.khome);
        } else {
          statusRequest = StatusRequest.none;
          update();
          Get.defaultDialog(
              title: "ُWarning", middleText: "Email Or Password is wrong");
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

  Future<void> sharedData(response) async {
    await myServices.sharedPreferences
        .setString("id", response['data']['users_id'].toString());

    await myServices.sharedPreferences
        .setString("username", response['data']['users_name']);

    await myServices.sharedPreferences
        .setString("email", response['data']['users_email']);

    await myServices.sharedPreferences
        .setString("phone", response['data']['users_phone']);

    await myServices.sharedPreferences.setString("step", "logined");
  }
}
