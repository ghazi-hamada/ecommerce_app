import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/features/onboarding/controller/onboarding_controller.dart';
import 'package:ecommerce_app/features/onboarding/data/datasource/static/stasic.dart';
import 'package:flutter/material.dart';
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
            const SizedBox(height: 50),
            Text(onBoardingData[index].title!,
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 50),
            Image.asset(onBoardingData[index].image!,
                width: 270, height: 300, fit: BoxFit.fill),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: Text(
                onBoardingData[index].description!,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
