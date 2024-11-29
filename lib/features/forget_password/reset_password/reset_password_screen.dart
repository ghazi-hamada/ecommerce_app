import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/core/functions/validinput.dart';
import 'package:ecommerce_app/core/localization/strings_keys.dart';
import 'package:ecommerce_app/features/forget_password/reset_password/controller/reset_password_controller.dart';
import 'package:ecommerce_app/features/auth/widgets/text_form_field_widget.dart';
import 'package:ecommerce_app/features/onboarding/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ResetPasswordControllerImpl());

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: GetBuilder<ResetPasswordControllerImpl>(builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            child: Container(
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
                      SizedBox(height: 10.h),
                      Center(
                        child: Text(
                          StringsKeys.enterNewPassword.tr,
                          style: const TextStyle(
                              fontSize: 20, fontFamily: "PT_Sans"),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 50.h),

                      //password
                      TextFormFieldWidget(
                        obsText: controller.isShowPassword,
                        controller: controller.password,
                        labeltext: StringsKeys.newPassword.tr,
                        icon: const Icon(Icons.lock_outline),
                        hinttext: StringsKeys.newPassword.tr,
                        valid: (newPassword) =>
                            validInput(newPassword!, InputType.password),
                        keyboardType: TextInputType.visiblePassword,
                        onTapIcon: () => controller.showPassword(),
                      ),
                      //confirm password
                      TextFormFieldWidget(
                        obsText: controller.isShowPassword,
                        controller: controller.confirmPassword,
                        labeltext: StringsKeys.confirmPassword.tr,
                        icon: const Icon(Icons.lock_outline),
                        hinttext: StringsKeys.confirmPassword.tr,
                        valid: (newPassword) =>
                            validInput(newPassword!, InputType.password),
                        keyboardType: TextInputType.visiblePassword,
                        onTapIcon: () => controller.showPassword(),
                      ),

                      CustomButton(
                        text: StringsKeys.save.tr,
                        onPress: () => controller.successResetPasssword(),
                      ),
                      SizedBox(height: 30.h),
                    ],
                  ),
                ),
              ),
            ),
          );
        }));
  }
}
