import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/localization/strings_keys.dart';
import 'package:ecommerce_app/features/forget_password/success_reset_password/controller/success_reset_password_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../onboarding/ui/widgets/custom_button.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessResetPasswordControllerImp controller =
        Get.put(SuccessResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text(StringsKeys.success.tr,
            style: const TextStyle(color: AppColor.grey)),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(children: [
          const Center(
              child: Icon(
            Icons.check_circle_outline,
            size: 200,
            color: AppColor.primaryColor,
          )),
          Text(StringsKeys.congratulations.tr,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: 30)),
          Text(StringsKeys.passwordResetSuccess.tr),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: CustomButton(
                text: StringsKeys.done.tr,
                onPress: () {
                  controller.goToPageLogin();
                }),
          ),
        ]),
      ),
    );
  }
}
