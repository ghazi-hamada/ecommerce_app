import '../../../../core/class/handling_data_view.dart';
import '../../../../core/functions/aleretexitapp.dart';
import '../../../../core/localization/strings_keys.dart';
import '../controller/login_controller.dart';
import 'widgets/dont_have_account.dart';
import 'widgets/form_email_and_password.dart';
import 'widgets/logo_and_text_welcome.dart';
import 'widgets/remember_me_and_forget_password.dart';
import '../../../onboarding/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => LoginControllerImpl());
    return Scaffold(
        appBar: AppBar(
          title: Text(StringsKeys.signIn.tr),
        ),
        body: GetBuilder<LoginControllerImpl>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  child: WillPopScope(
                    child: SingleChildScrollView(
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
                    onWillPop: () => aleretexitapp(),
                  ),
                )));
  }
}
