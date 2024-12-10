import '../../../../../core/localization/strings_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TextWelcome extends StatelessWidget {
  const TextWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          StringsKeys.welcomeBack.tr,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(height: 10.h),
        Text(
          StringsKeys.welcomeStartJourney.tr,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.displaySmall,
        ),
        SizedBox(height: 40.h),
      ],
    );
  }
}
