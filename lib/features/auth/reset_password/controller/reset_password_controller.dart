import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  successResetPasssword();
}

class ResetPasswordControllerImpl extends ResetPasswordController {
  late TextEditingController password;
  late TextEditingController confirmPassword;

  String? email;
  final GlobalKey<FormState> formstate = GlobalKey();

  @override
  successResetPasssword() async {
    if (password.text != confirmPassword.text) {
      return Get.defaultDialog(
          title: "warning", middleText: "Password Not Match");
    }
  }

  @override
  void onInit() {
    // email = Get.arguments['email'];
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
