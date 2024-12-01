import 'package:ecommerce_app/features/onboarding/controller/onboarding_controller.dart';
import 'package:ecommerce_app/features/onboarding/data/datasource/static/stasic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TitleAndImageAndBodyOnboardingWidget
    extends GetView<OnboardingControllerImpl> {
  const TitleAndImageAndBodyOnboardingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 7,
      child: PageView.builder(
        controller: controller.pageController,
        onPageChanged: (value) {
          controller.onPageChanged(pageIndex: value);
        },
        itemCount: onBoardingData.length,
        itemBuilder: (context, index) => Column(
          children: [
            SizedBox(height: 50.h),
            Text(onBoardingData[index].title!,
                style: Theme.of(context).textTheme.titleMedium),
            SizedBox(height: 50.h),
            Expanded(
              child: Image.asset(onBoardingData[index].image!,
                  width: 270.w, height: 300.h, fit: BoxFit.fill),
            ),
            SizedBox(height: 10.h),
            SizedBox(
              width: double.infinity,
              child: Text(
                onBoardingData[index].description!,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
