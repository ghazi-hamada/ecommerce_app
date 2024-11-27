import 'package:ecommerce_app/core/functions/validinput.dart';
import 'package:ecommerce_app/core/localization/strings_keys.dart';
import 'package:ecommerce_app/features/auth/signup/controller/signup_controller.dart';
import 'package:ecommerce_app/features/auth/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormNameAndPhoneAndEmailAndPassword extends GetView<SignupControllerImpl> {
  const FormNameAndPhoneAndEmailAndPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          //name
          TextFormFieldWidget(
              controller: controller.nameController,
              labeltext: StringsKeys.name.tr,
              icon: const Icon(
                Icons.person_outline_rounded,
                size: 30,
              ),
              hinttext: StringsKeys.enterFullName.tr,
              valid: (value) => validInput(value!, InputType.username),),
          //phone
          TextFormFieldWidget(
              controller: controller.phoneController,
              labeltext: StringsKeys.phone.tr,
              icon: const Icon(
                Icons.phone_android_outlined,
                size: 30,
              ),
              hinttext: StringsKeys.enterPhone.tr,
             valid: (value) => validInput(value!, InputType.phone),),
          //email
          TextFormFieldWidget(
              controller: controller.emailController,
              labeltext: StringsKeys.email.tr,
              icon: const Icon(
                Icons.email_outlined,
                size: 30,
              ),
              hinttext: StringsKeys.enterEmail.tr,
              valid: (value) => validInput(value!, InputType.email),),
          //password
          TextFormFieldWidget(
            controller: controller.passwordController,
            labeltext: StringsKeys.password.tr,
            icon: const Icon(
              Icons.lock_outline_rounded,
              size: 30,
            ),
            hinttext: StringsKeys.enterNewPassword.tr,
            valid: (value) => validInput(value!, InputType.password),
          ),
          //confirm password
          TextFormFieldWidget(
            labeltext: StringsKeys.confirmPassword.tr,
            icon: const Icon(
              Icons.lock_outline_rounded,
              size: 30,
            ),
            hinttext: StringsKeys.enterNewPassword.tr,
            valid: (value) => validInput(value!, InputType.password),
          ),
        ],
      ),
    );
  }
}
