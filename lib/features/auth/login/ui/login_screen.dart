import 'package:ecommerce_app/core/localization/strings_keys.dart';
import 'package:ecommerce_app/features/auth/login/controller/login_controller.dart';
import 'package:ecommerce_app/features/auth/login/ui/widgets/dont_have_account.dart';
import 'package:ecommerce_app/features/auth/login/ui/widgets/form_email_and_password.dart';
import 'package:ecommerce_app/features/auth/login/ui/widgets/logo_and_text_welcome.dart';
import 'package:ecommerce_app/features/auth/login/ui/widgets/remember_me_and_forget_password.dart';
import 'package:ecommerce_app/features/onboarding/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginControllerImpl());
    return Scaffold(
      appBar: AppBar(
        title: Text(StringsKeys.signIn.tr),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //logo and text welcome back
              const LogoAndTextWelcome(),
              //text form field email and password
              const FormEmailAndPassword(),
              //remember me and forgot password
              const RememberMeAndForgetPassword(),
              CustomButton(
                text: StringsKeys.signIn.tr,
                onPress: () {
                  controller.login();
                },
              ),

              // dont have an account ? sign up
              DontHaveAccount(
                body: StringsKeys.dontHaveAccount.tr,
                action: StringsKeys.signUp.tr,
                onPressAction: () {
                  controller.dontHaveAccount();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
