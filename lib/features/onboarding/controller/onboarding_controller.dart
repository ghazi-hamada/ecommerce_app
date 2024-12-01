
import 'package:ecommerce_app/routes_app.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/features/onboarding/data/datasource/static/stasic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OnboardingController extends GetxController {
  next();
  onPageChanged({required int pageIndex});
}

class OnboardingControllerImpl extends OnboardingController {
  late PageController pageController;
  int currentIndex = 0;
  late MyServices myServices = Get.find<MyServices>();
  @override
  next() {
    currentIndex++;
    if (currentIndex < onBoardingData.length) {
      pageController.animateToPage(currentIndex,
          duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    } else {
      Get.offAllNamed(AppRoutes.kLogin);
      myServices.sharedPreferences.setString('step', 'login');
      print('page finished');
      update();
    }
  }

  @override
  onPageChanged({required int pageIndex}) {
    currentIndex = pageIndex;
    update();
  }

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
