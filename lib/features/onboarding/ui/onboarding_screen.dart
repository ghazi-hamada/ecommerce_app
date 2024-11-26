import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/features/onboarding/controller/onboarding_controller.dart';
import 'package:ecommerce_app/features/onboarding/data/datasource/static/stasic.dart';
import 'package:ecommerce_app/features/onboarding/ui/widgets/custom_button.dart';
import 'package:ecommerce_app/features/onboarding/ui/widgets/point_indicator.dart';
import 'package:ecommerce_app/features/onboarding/ui/widgets/title_and_image_and_body_onboarding_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingControllerImpl());
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //onboarding widget
            const TitleAndImageAndBodyOnboardingWidget(),
            //point indicator
            const PointIndicator(),
            //custom button
            CustomButton(
                text: 'Continue',
                onPress: () {
                  controller.next();
                }),
          ],
        ),
      ),
    );
  }
}
