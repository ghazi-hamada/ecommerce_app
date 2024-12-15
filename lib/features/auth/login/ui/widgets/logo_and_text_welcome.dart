import '../../../../../core/localization/strings_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LogoAndTextWelcome extends StatelessWidget {
  const LogoAndTextWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/images/logo.png", fit: BoxFit.fill),
        Text(
          StringsKeys.welcomeBack.tr,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(height: 10.h),
        Center(
          child: Text(
            StringsKeys.signInWithEmail.tr,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
        SizedBox(height: 40.h),
      ],
    );
  }
}
