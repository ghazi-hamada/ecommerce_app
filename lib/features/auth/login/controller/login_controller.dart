
import '../../../../core/class/post_data.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../../../../core/class/status_request.dart';
import '../../../../core/constant/app_apis.dart';
import '../../../../core/functions/handling_data.dart';
import '../../../../core/services/services.dart';
import '../../../../routes_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  dontHaveAccount();
  forgotPassword();
  showPassword();
  PostData postData = PostData(Get.find());
}

class LoginControllerImpl extends LoginController {
  MyServices myServices = Get.find();
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isShowPassword = false;
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
      var response = await postData.postData(
        linkurl: AppApis.login,
        data: {
          "email": emailController.text,
          "password": passwordController.text,
        },
      );

      statusRequest = handlingData(response);

      print("hello" + response['status']);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          sharedData(response);
          response['data']['users_approve'] == 1
              ? Get.offAllNamed(AppRoutes.khome)
              : Get.toNamed(AppRoutes.kActivateAccount,
                  arguments: {"email": emailController.text});
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
    if (response['data']['users_approve'] == 1) {
      await myServices.sharedPreferences
          .setString("id", response['data']['users_id'].toString());

      await myServices.sharedPreferences
          .setString("username", response['data']['users_name']);

      await myServices.sharedPreferences
          .setString("email", response['data']['users_email']);

      await myServices.sharedPreferences
          .setString("phone", response['data']['users_phone']);
      await myServices.sharedPreferences
          .setInt("approve", response['data']['users_approve']);
      await myServices.sharedPreferences.setString("step", "logined");
      String userId = myServices.sharedPreferences.getString('id')!;
      FirebaseMessaging.instance.subscribeToTopic('users');
      FirebaseMessaging.instance.subscribeToTopic('users$userId');
    } else {
      Get.toNamed(AppRoutes.kVerfiyCodesignup,
          arguments: {"email": emailController.text});
    }
  }
}
