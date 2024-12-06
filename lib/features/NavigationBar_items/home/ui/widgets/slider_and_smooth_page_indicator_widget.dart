import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:ecommerce_app/features/NavigationBar_items/home/controller/home_controller.dart';
import 'package:ecommerce_app/features/NavigationBar_items/home/ui/widgets/custom_slider_item.dart';

// slider_and_smooth_page_indicator_widget
class SliderAndSmoothPageIndicatorWidget extends StatelessWidget {
  const SliderAndSmoothPageIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeControllerImpl());
    return GetBuilder<HomeControllerImpl>(builder: (controller) {
      return Column(
        children: [
          // slider
          CarouselSlider(
            carouselController: controller.carouselController,
            options: CarouselOptions(
              height: 150.h,
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 0.85,
              aspectRatio: 16 / 9,
              initialPage: 0,
              onPageChanged: (index, reason) {
                controller.changeIndex(index);
              },
            ),
            items: controller.carouselItems.map((item) {
              // custom_slider_item
              return CustomSliderItem(item: item);
            }).toList(),
          ),
          SizedBox(height: 10.h),
          AnimatedSmoothIndicator(
            activeIndex: controller.curntIndex,
            count: controller.carouselItems.length,
            effect: const ExpandingDotsEffect(
              activeDotColor: AppColor.primaryColor,
              dotColor: Colors.grey,
              dotHeight: 8,
              dotWidth: 8,
              expansionFactor: 3,
            ),
            onDotClicked: (index) {
              controller.carouselController.animateToPage(index);
            },
          ),
        ],
      );
    });
  }
}
