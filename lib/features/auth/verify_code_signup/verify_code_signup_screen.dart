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
  const VerifyCodeSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => verifyCodeSignUpControllerImp());
    return Scaffold(
        backgroundColor: AppColor.backgroundcolor,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            StringsKeys.verificationCode.tr,
            style: const TextStyle(color: AppColor.primaryColor),
          ),
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
                            color: Color(0xff6C757D)),
                      ),
                      SizedBox(height: 10.h),
                      Center(
                        child: Text(
                          StringsKeys.enterCode.tr,
                          style: TextStyle(
                              fontSize: 18.sp, color: const Color(0xff6C757D)),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Text(
                        controller.hideEmail(controller.email!),
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: AppColor.black,
                        ),
                      ),
                      SizedBox(height: 15.h),
                      OtpTextField(
                        fieldWidth: 50.00,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(18.0)),
                        numberOfFields: 5,
                        borderColor: AppColor.primaryColor,
                        showFieldAsBox: true,
                        onCodeChanged: (String code) {
                          //handle validation or checks here
                        },
                        onSubmit: (String verificationCode) {
                          controller.goTOsuccessSignup(verificationCode);
                        },
                      ),
                      SizedBox(height: 20.h),
                      TextButton(
                          onPressed: () {
                            controller.resendVerifyCode();
                          },
                          child: const Text(
                            "resend code",
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColor.primaryColor,
                            ),
                          )),
                      SizedBox(height: 30.h)
                    ],
                  ),
                ),
              ),
            ),
          );
        }));
  }
}
