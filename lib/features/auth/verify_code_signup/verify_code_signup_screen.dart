import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/localization/strings_keys.dart';
import 'package:ecommerce_app/features/auth/verify_code_signup/controller/verify_code_signup_Controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class VerifyCodeSignUpScreen extends StatelessWidget {
  VerifyCodeSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => verifyCodeSignUpControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          title: Text(StringsKeys.verificationCode.tr,
              style: const TextStyle(color: AppColor.grey)),
        ),
        body: GetBuilder<verifyCodeSignUpControllerImp>(builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
              child: SingleChildScrollView(
                child: Form(
                  key: controller.formstate,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 30.h),
                      Text(
                        StringsKeys.verifyCode.tr,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Center(
                        child: Text(
                          StringsKeys.enterCode.tr,
                          style: TextStyle(
                            fontSize: 18.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 15.h),
                      OtpTextField(
                        fieldWidth: 50.00,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(18.0)),
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
                          controller.goTOsuccessSignup(verificationCode);
                        }, // end onSubmit
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }));
  }
}
