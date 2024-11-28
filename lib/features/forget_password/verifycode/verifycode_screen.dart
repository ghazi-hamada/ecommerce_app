import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/localization/strings_keys.dart';
import 'package:ecommerce_app/features/forget_password/verifycode/controller/verifycode_controller.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyCodeScreen extends StatelessWidget {
  const VerifyCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => verifyCodeControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          title: Text(StringsKeys.verificationCode.tr,
              style: const TextStyle(color: AppColor.grey)),
        ),
        body: GetBuilder<verifyCodeControllerImp>(
          builder: (controller) {
            return HandlingDataView(
              statusRequest: controller.statusRequest,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                child: SingleChildScrollView(
                  child: Form(
                    // key: controller.formstate,
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 30),
                        Text(
                          StringsKeys.verifyCode.tr,
                          style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              fontFamily: "PT_Sans"),
                        ),
                        const SizedBox(height: 10),
                        Center(
                          child: Text(
                            "enterCode".tr,
                            style:
                                const TextStyle(fontSize: 18, fontFamily: "PT_Sans"),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const Text("ghazihamada7@gmail.com"),
                        const SizedBox(height: 15),
                        OtpTextField(
                          fieldWidth: 50.00,
                          borderRadius: const BorderRadius.all(Radius.circular(18.0)),
                          numberOfFields: 5,
                          borderColor: AppColor.primaryColor,
                          //set to true to show as box or false to show as dash
                          showFieldAsBox: true,
                          //runs when a code is typed in
                          onCodeChanged: (String code) {
                            //handle validation or checks here
                          },
                          //runs when every textfield is filled
                          onSubmit: (String verificationCode) {
                            controller.goTOResetPassword(verificationCode);
                          }, // end onSubmit
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        ));
  }
}
