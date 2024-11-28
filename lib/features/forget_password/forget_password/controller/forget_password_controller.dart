import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/functions/handling_data.dart';
import 'package:ecommerce_app/features/forget_password/forget_password/data/remote/forget_password_data.dart';
import 'package:ecommerce_app/routes_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  proceedToVerifyCode();
  checkEmail();
}

class ForgetPasswordControllerImpl extends ForgetPasswordController {
  late TextEditingController emailController;
  late GlobalKey<FormState> formKey = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;
  ForgetPasswordData forgetPasswordData = ForgetPasswordData(Get.find());

  @override
  proceedToVerifyCode() async {
    if (formKey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await forgetPasswordData.postData(emailController.text);
      statusRequest = handlingData(response);

      print("hello" + response['status']);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          Get.toNamed(AppRoutes.kVerfiyCode,
              arguments: {"email": emailController.text});
        } else {
          Get.defaultDialog(
              title: "ُWarning", middleText: "your email is not registered");
          statusRequest = StatusRequest.failure;
        }
      }
    }
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
