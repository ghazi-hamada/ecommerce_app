
import '../../../../core/class/post_data.dart';
import '../../../../core/constant/app_apis.dart';

import '../../../../core/class/status_request.dart';
import '../../../../core/functions/handling_data.dart';
import '../../../../routes_app.dart';
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
  StatusRequest statusRequest = StatusRequest.none;
  PostData postDatas = PostData(Get.find());
  bool isShowPassword = false;
  List data = [];
  @override
  haveAccount() {
    Get.back();
  }

  @override
  signup() async {
    if (formKey.currentState!.validate()) {
      if (passwordConfirmController.text == passwordController.text) {
        statusRequest = StatusRequest.loading;
        update();
        var response = await postData();
        statusRequest = handlingData(response);
        if (StatusRequest.success == statusRequest) {
          print(
              "response['status']:================================== ${response['status']}");
          if (response['status'] == "success") {
            Get.offAllNamed(AppRoutes.kVerfiyCodesignup,
                arguments: {"email": emailController.text});
          } else {
            Get.defaultDialog(
                title: "ُWarning",
                middleText: "Phone Number Or Email Already Exists");
            statusRequest = StatusRequest.failure;
          }
        }
        update();
      } else {
        Get.snackbar(
          'Error',
          'There is no matching password.!!',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red[300],
        );
      }
    }
    update();
    // There is no matching password.!!
  }

  postData() {
    return postDatas.postData(
      linkurl: AppApis.signUp,
      data: {
        'username': nameController.text,
        'phone': phoneController.text,
        'email': emailController.text,
        'password': passwordController.text,
      },
    );
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
