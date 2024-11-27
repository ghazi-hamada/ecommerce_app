import 'dart:math';

import 'package:ecommerce_app/core/routing/routes_app.dart';
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
  @override
  dontHaveAccount() {
    Get.toNamed(AppRoutes.kSignup);
  }

  @override
  login() {
    if (formKey.currentState!.validate()) {
      // Get.toNamed(AppRoutes.kHome);
      print('login success');
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
