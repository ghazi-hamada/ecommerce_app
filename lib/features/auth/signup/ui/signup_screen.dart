import '../../../../core/class/handling_data_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/localization/strings_keys.dart';
import '../../login/ui/widgets/dont_have_account.dart';
import '../controller/signup_controller.dart';
import 'widgets/form_name_and_phone_and_email_and_password.dart';
import 'widgets/text_welcome.dart';
import '../../../onboarding/ui/widgets/custom_button.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SignupControllerImpl());
    return Scaffold(
      appBar: AppBar(
        title: Text(StringsKeys.createNewAccount.tr),
      ),
      body: GetBuilder<SignupControllerImpl>(builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          child: SingleChildScrollView(
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
      }),
    );
  }
}
