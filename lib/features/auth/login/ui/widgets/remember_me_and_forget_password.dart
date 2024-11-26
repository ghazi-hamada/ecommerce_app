import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/localization/strings_keys.dart';
import 'package:ecommerce_app/features/auth/login/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RememberMeAndForgetPassword extends GetView<LoginControllerImpl> {
  const RememberMeAndForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(value: false, onChanged: (value) {}),
            Text(StringsKeys.rememberMe.tr),
          ],
        ),
        TextButton(
          onPressed: () {
            controller.forgotPassword();
          },
          child: Text(
            StringsKeys.forgotPassword.tr,
            style: const TextStyle(color: AppColor.grey),
          ),
        ),
      ],
    );
  }
}
