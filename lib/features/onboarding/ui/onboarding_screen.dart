import '../../../core/localization/strings_keys.dart';
import '../controller/onboarding_controller.dart';
import 'widgets/custom_button.dart';
import 'widgets/point_indicator.dart';
import 'widgets/title_and_image_and_body_onboarding_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingControllerImpl());
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              //onboarding widget
              const TitleAndImageAndBodyOnboardingWidget(),
              //point indicator
              const PointIndicator(),
              //custom button
              CustomButton(
                  text: StringsKeys.next.tr,
                  onPress: () {
                    controller.next();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
