import '../../../../core/class/status_request.dart';
import '../../../../core/functions/handling_data.dart';
import '../data/remote/reset_password_data.dart';
import '../../../../routes_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  successResetPasssword();
  showPassword();
}

class ResetPasswordControllerImpl extends ResetPasswordController {
  late TextEditingController password;
  late TextEditingController confirmPassword;
  StatusRequest statusRequest = StatusRequest.none;
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  bool isShowPassword = false;
  String? email;
  final GlobalKey<FormState> formstate = GlobalKey();

  @override
  successResetPasssword() async {
    if (formstate.currentState!.validate()) {
      if (password.text == confirmPassword.text) {
        statusRequest = StatusRequest.loading;
        update();
        var response = await resetPasswordData.postdata(email!, password.text);
        statusRequest = handlingData(response);
        if (StatusRequest.success == statusRequest) {
          if (response['status'] == 'success') {
            Get.offAllNamed(AppRoutes.kSuccessResetPassword);
          } else {
            Get.defaultDialog(title: "warning", middleText: "try again later");
          }
        } else {
          Get.defaultDialog(title: "warning", middleText: "try again later");
        }
      } else {
        return Get.defaultDialog(
            title: "warning", middleText: "Password Not Match");
      }
      update();
    }
  }

  @override
  showPassword() {
    isShowPassword = !isShowPassword;

    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    password = TextEditingController();
    confirmPassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }
}
