import 'package:ecommerce_app/core/routing/routes_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController{
  login();
  dontHaveAccount();
  forgotPassword();
}

class LoginControllerImpl extends LoginController{
  late TextEditingController emailController ;
  late TextEditingController passwordController;
  late GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  dontHaveAccount() {
    Get.toNamed(AppRoutes.kSignup);
  }

  @override
  login() {
    print('login');
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

}