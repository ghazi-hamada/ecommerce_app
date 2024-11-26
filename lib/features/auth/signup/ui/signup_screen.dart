import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/localization/strings_keys.dart';
import 'package:ecommerce_app/core/routing/routes_app.dart';
import 'package:ecommerce_app/features/auth/signup/controller/signup_controller.dart';
import 'package:ecommerce_app/features/auth/login/ui/widgets/dont_have_account.dart';
import 'package:ecommerce_app/features/auth/login/ui/widgets/form_email_and_password.dart';
import 'package:ecommerce_app/features/auth/signup/ui/widgets/form_name_and_phone_and_email_and_password.dart';
import 'package:ecommerce_app/features/auth/login/ui/widgets/logo_and_text_welcome.dart';
import 'package:ecommerce_app/features/auth/login/ui/widgets/remember_me_and_forget_password.dart';
import 'package:ecommerce_app/features/auth/widgets/text_form_field_widget.dart';
import 'package:ecommerce_app/features/auth/signup/ui/widgets/text_welcome.dart';
import 'package:ecommerce_app/features/onboarding/ui/widgets/custom_button.dart';
import 'package:ecommerce_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupControllerImpl());
    return Scaffold(
      appBar: AppBar(
        title: Text(StringsKeys.signUp.tr),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //logo and text welcome back
              const TextWelcome(),
              //text form field name and phone number and email and password for sign up
              const FormNameAndPhoneAndEmailAndPassword(),
              //button sign up
              CustomButton(
                text: StringsKeys.signUp.tr,
                onPress: () {
                  controller.signup();
                },
              ),

              // dont have an account ? sign up
              DontHaveAccount(
                body: StringsKeys.hasAccount.tr,
                action: StringsKeys.signIn.tr,
                onPressAction: () {
                  controller.haveAccount();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
