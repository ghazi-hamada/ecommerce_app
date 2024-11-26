import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/localization/strings_keys.dart';
import 'package:ecommerce_app/features/auth/forget_password/controller/forget_password_controller.dart';
import 'package:ecommerce_app/features/auth/widgets/text_form_field_widget.dart';
import 'package:ecommerce_app/features/onboarding/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordControllerImpl());
    return Scaffold(
        appBar: AppBar(
          title: Text(
            StringsKeys.passwordRecovery.tr,
          ),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
          child: SingleChildScrollView(
            child: Column(
              children: [
                //title page as logo
                Text(
                  StringsKeys.checkEmail.tr,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: AppColor.black,
                  ),
                ),
                const SizedBox(height: 7),

                //body page as logo
                Text(
                  StringsKeys.emailVerificationDescription.tr,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                //email
                Form(
                  key: controller.formKey,
                  child: TextFormFieldWidget(
                    obsText: false,
                    controller: controller.emailController,
                    labeltext: StringsKeys.email.tr,
                    icon: const Icon(Icons.email_outlined),
                    hinttext: StringsKeys.enterEmail.tr,
                    valid: (p0) {
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20),
                //button
                CustomButton(
                  text: StringsKeys.send.tr,
                  onPress: () {
                    controller.proceedToVerifyCode();
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
