import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/constant/image_asset.dart';
import '../controller/activate_account_controller.dart';
import '../../../onboarding/ui/widgets/custom_button.dart';

class ActivateAccountScreen extends StatelessWidget {
  const ActivateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ActivateAccountControllerImpl());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Activate account"),
      ),
      //"It seems that your account is inactive. To complete the login process, please check your email. Would you like to resend the verification code?"
      body: Column(
        children: [
          Image.asset(
            AppImageAsset.logo,
            width: 250.w,
            height: 250.h,
            fit: BoxFit.cover,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            alignment: Alignment.center,
            child: const Text(
              "Your account is inactive. Please check your email to verify your account.",
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColor.grey, fontSize: 18),
            ),
          ),
          const Spacer(),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: CustomButton(
                  text: "Verify Now",
                  onPress: () {
                    print("Verify Now");
                    controller.verifyNow();
                  }))
        ],
      ),
    );
  }
}
