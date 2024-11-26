import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/features/onboarding/controller/onboarding_controller.dart';
import 'package:ecommerce_app/features/onboarding/data/datasource/static/stasic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PointIndicator extends StatelessWidget {
  const PointIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Column(
          children: [
            GetBuilder<OnboardingControllerImpl>(
              builder: (controller) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                      onBoardingData.length,
                      (index) => AnimatedContainer(
                            margin: const EdgeInsets.only(right: 5),
                            duration: const Duration(milliseconds: 900),
                            height: 6,
                            width: controller.currentIndex == index ? 15 : 6,
                            decoration: BoxDecoration(
                              color: controller.currentIndex == index
                                  ? AppColor.primaryColor
                                  : AppColor.grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          )),
                ],
              ),
            )
          ],
        ));
  }
}
