import 'package:ecommerce_app/core/routing/routes_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignupController extends GetxController {
  signup();
  haveAccount();
  showPassword();
}

class SignupControllerImpl extends SignupController {
  // TextEditingController name, phone, email, password;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController passwordConfirmController;

  bool isShowPassword = false;
  @override
  haveAccount() {
    Get.back();
  }

  @override
  signup() {
    if (formKey.currentState!.validate()) {
      if (passwordConfirmController.text != passwordController.text) {
        Get.snackbar(
          'Error',
          'There is no matching password.!!',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red[300],
        );
      } else {
        Get.toNamed(AppRoutes.kVerfiyCodesignup);
      }
    }
    // There is no matching password.!!
  }

  @override
  void onInit() {
    nameController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    passwordConfirmController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();
    super.dispose();
  }

  @override
  showPassword() {
    isShowPassword = !isShowPassword;

    update();
  }
}
