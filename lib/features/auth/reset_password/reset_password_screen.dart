import 'package:ecommerce_app/core/functions/validinput.dart';
import 'package:ecommerce_app/core/localization/strings_keys.dart';
import 'package:ecommerce_app/features/auth/reset_password/controller/reset_password_controller.dart';
import 'package:ecommerce_app/features/auth/widgets/text_form_field_widget.dart';
import 'package:ecommerce_app/features/onboarding/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImpl controller =
        Get.put(ResetPasswordControllerImpl());

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
          child: SingleChildScrollView(
            child: Form(
              key: controller.formstate,
              child: Column(
                children: <Widget>[
                  Text(
                    StringsKeys.resetPassword.tr,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Text(
                      StringsKeys.enterNewPassword.tr,
                      style:
                          const TextStyle(fontSize: 20, fontFamily: "PT_Sans"),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 50),

                  //password
                  TextFormFieldWidget(
                    obsText: true,
                    controller: controller.password,
                    labeltext: StringsKeys.newPassword.tr,
                    icon: const Icon(Icons.lock_outline),
                    hinttext: StringsKeys.newPassword.tr,
                    valid: (newPassword) =>
                        validinput(newPassword!, 6, 30, "password"),
                  ),
                  //confirm password
                  TextFormFieldWidget(
                    obsText: true,
                    controller: controller.confirmPassword,
                    labeltext: StringsKeys.confirmPassword.tr,
                    icon: const Icon(Icons.lock_outline),
                    hinttext: StringsKeys.confirmPassword.tr,
                    valid: (newPassword) =>
                        validinput(newPassword!, 6, 30, "password"),
                  ),

                  CustomButton(
                    text: StringsKeys.save.tr,
                    onPress: () => controller.successResetPasssword(),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ));
  }
}
