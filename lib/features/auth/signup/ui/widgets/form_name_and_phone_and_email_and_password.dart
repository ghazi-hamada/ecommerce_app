import 'package:ecommerce_app/core/functions/validinput.dart';
import 'package:ecommerce_app/core/localization/strings_keys.dart';
import 'package:ecommerce_app/features/auth/signup/controller/signup_controller.dart';
import 'package:ecommerce_app/features/auth/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormNameAndPhoneAndEmailAndPassword extends StatelessWidget {
  const FormNameAndPhoneAndEmailAndPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<SignupControllerImpl>(() => SignupControllerImpl());
    return GetBuilder<SignupControllerImpl>(builder: (controller) {
      return Form(
        key: controller.formKey,
        child: Column(
          children: [
            //name
            TextFormFieldWidget(
              keyboardType: TextInputType.name,
              controller: controller.nameController,
              labeltext: StringsKeys.name.tr,
              icon: const Icon(
                Icons.person_outline_rounded,
                size: 30,
              ),
              hinttext: StringsKeys.enterFullName.tr,
              valid: (value) => validInput(value!, InputType.username),
            ),
            //phone
            TextFormFieldWidget(
              keyboardType: TextInputType.phone,
              controller: controller.phoneController,
              labeltext: StringsKeys.phone.tr,
              icon: const Icon(
                Icons.phone_android_outlined,
                size: 30,
              ),
              hinttext: StringsKeys.enterPhone.tr,
              valid: (value) => validInput(value!, InputType.phone),
            ),
            //email
            TextFormFieldWidget(
              keyboardType: TextInputType.emailAddress,
              controller: controller.emailController,
              labeltext: StringsKeys.email.tr,
              icon: const Icon(
                Icons.email_outlined,
                size: 30,
              ),
              hinttext: StringsKeys.enterEmail.tr,
              valid: (value) => validInput(value!, InputType.email),
            ),
            //password
            TextFormFieldWidget(
              keyboardType: TextInputType.visiblePassword,
              controller: controller.passwordController,
              labeltext: StringsKeys.password.tr,
              icon: Icon(
                controller.isShowPassword
                    ? Icons.lock_open_outlined
                    : Icons.lock_outline_rounded,
                size: 30,
              ),
              hinttext: StringsKeys.enterNewPassword.tr,
              valid: (value) => validInput(value!, InputType.password),
              onTapIcon: controller.showPassword,
              obsText: !controller.isShowPassword,
            ),
            //confirm password
            TextFormFieldWidget(
              controller: controller.passwordConfirmController,
              keyboardType: TextInputType.visiblePassword,
              labeltext: StringsKeys.confirmPassword.tr,
              icon: Icon(
                controller.isShowPassword
                    ? Icons.lock_open_outlined
                    : Icons.lock_outline_rounded,
                size: 30,
              ),
              hinttext: StringsKeys.enterNewPassword.tr,
              valid: (value) => validInput(value!, InputType.confirmPassword),
              onTapIcon: controller.showPassword,
              obsText: !controller.isShowPassword,
            ),
          ],
        ),
      );
    });
  }
}
