import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/functions/handling_data.dart';
import 'package:ecommerce_app/features/forget_password/verifycode/data/remote/verify_code_data.dart';
import 'package:ecommerce_app/routes_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

// ignore: camel_case_types
abstract class verifyCodeController extends GetxController {
  checkCode();
  goTOResetPassword(String verificationCode);
}

// ignore: camel_case_types
class verifyCodeControllerImp extends verifyCodeController {
  StatusRequest statusRequest = StatusRequest.none;
  VerifyCodeData verifyCodeData = VerifyCodeData(Get.find());

  String? email;
  @override
  checkCode() {
    // TODO: implement checkCode
    throw UnimplementedError();
  }

  @override
  goTOResetPassword(String verificationCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeData.postData(email!, verificationCode);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      print(
          "response['status']:================================== ${response['status']}");
      if (response['status'] == "success") {
        Get.toNamed(AppRoutes.kResetpassword, arguments: {"email": email});
      } else {
        Get.defaultDialog(
            title: "ُWarning", middleText: "Verify code is wrong");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}
