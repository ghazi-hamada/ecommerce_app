import 'package:ecommerce_app/core/functions/validinput.dart';
import 'package:ecommerce_app/core/localization/strings_keys.dart';
import 'package:ecommerce_app/features/auth/login/controller/login_controller.dart';
import 'package:ecommerce_app/features/auth/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormEmailAndPassword extends StatelessWidget {
  const FormEmailAndPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<LoginControllerImpl>(() => LoginControllerImpl());
    return GetBuilder<LoginControllerImpl>(builder: (controller) {
      return Form(
        key: controller.formKey,
        child: Column(
          children: [
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
              hinttext: StringsKeys.enterPassword.tr,
              valid: (value) => validInput(value!, InputType.password),
              onTapIcon: () => controller.showPassword(),
              obsText: !controller.isShowPassword,
            ),
          ],
        ),
      );
    });
  }
}
