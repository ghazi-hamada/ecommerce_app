import 'package:ecommerce_app/core/routing/routes_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  proceedToVerifyCode();
  checkEmail();
}

class ForgetPasswordControllerImpl extends ForgetPasswordController {
  late TextEditingController emailController;
    late GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  proceedToVerifyCode() {
    Get.toNamed(AppRoutes.kVerfiyCode);
  }

  @override
  void onInit() {
    emailController = TextEditingController();
  late GlobalKey<FormState> formKey = GlobalKey<FormState>();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  checkEmail() {
    // TODO: implement checkEmail
    throw UnimplementedError();
  }
}
