import 'package:ecommerce_app/core/routing/routes_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignupController extends GetxController {
  signup();
  haveAccount();
}

class SignupControllerImpl extends SignupController {
  // TextEditingController name, phone, email, password;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  haveAccount() {
    Get.back();
  }

  @override
  signup() {
    Get.toNamed(AppRoutes.kVerfiyCodesignup);
  }

  @override
  void onInit() {
    nameController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
