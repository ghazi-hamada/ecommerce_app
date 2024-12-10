import '../../../../core/constant/color.dart';
import '../../controller/onboarding_controller.dart';
import '../../data/datasource/static/stasic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PointIndicator extends StatelessWidget {
  const PointIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => OnboardingControllerImpl());
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
                            height: 6.w,
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

