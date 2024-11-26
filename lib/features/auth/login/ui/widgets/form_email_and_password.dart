import 'package:ecommerce_app/core/localization/strings_keys.dart';
import 'package:ecommerce_app/features/auth/login/controller/login_controller.dart';
import 'package:ecommerce_app/features/auth/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormEmailAndPassword extends GetView<LoginControllerImpl> {
const FormEmailAndPassword({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          TextFormFieldWidget(
            controller: controller.emailController,
                    labeltext: StringsKeys.email.tr,
                    icon: const Icon(
                      Icons.email_outlined,
                      size: 30,
                    ),
                    hinttext: StringsKeys.enterEmail.tr,
                    valid: (value) {
                      if (value!.isEmpty) {
                        return StringsKeys.enterEmail.tr;
                      }
                      return null;
                    }),
                TextFormFieldWidget(
                  controller: controller.passwordController,
                  labeltext: StringsKeys.password.tr,
                  icon: const Icon(
                    Icons.lock_outline_rounded,
                    size: 30,
                  ),
                  hinttext: StringsKeys.enterPassword.tr,
                  valid: (value) {
                    if (value!.isEmpty) {
                      return StringsKeys.enterEmail.tr;
                    }
                    return null;
                  },
                ),
        ],
      ),
    );
  }
}