import '../../../core/class/handling_data_view.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/validinput.dart';
import '../../../core/localization/strings_keys.dart';
import 'controller/forget_password_controller.dart';
import '../../auth/widgets/text_form_field_widget.dart';
import '../../onboarding/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ForgetPasswordControllerImpl());
    return Scaffold(
        appBar: AppBar(
          title: Text(
            StringsKeys.passwordRecovery.tr,
          ),
        ),
        body: GetBuilder<ForgetPasswordControllerImpl>(builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            child: Container(
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
                    SizedBox(height: 7.h),

                    //body page as logo
                    Text(
                      StringsKeys.emailVerificationDescription.tr,
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 30.h),
                    //email
                    Form(
                      key: controller.formKey,
                      child: TextFormFieldWidget(
                        obsText: false,
                        controller: controller.emailController,
                        labeltext: StringsKeys.email.tr,
                        icon: const Icon(Icons.email_outlined),
                        hinttext: StringsKeys.enterEmail.tr,
                        valid: (value) => validInput(value!, InputType.email),
                      ),
                    ),
                    SizedBox(height: 20.h),
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
            ),
          );
        }));
  }
}
