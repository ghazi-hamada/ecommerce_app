import 'package:carousel_slider/carousel_slider.dart';
import '../../../../../core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../controller/home_controller.dart';
import 'custom_slider_item.dart';

class SliderAndSmoothPageIndicatorWidget extends StatelessWidget {
  const SliderAndSmoothPageIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeControllerImpl());
    return GetBuilder<HomeControllerImpl>(builder: (controller) {
      return Column(
        children: [
          // Slider
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
            items: controller.banners.map((banner) {
              return CustomSliderItem(bannersModel: banner);
            }).toList(),
          ),
          SizedBox(height: 10.h),
          AnimatedSmoothIndicator(
            activeIndex:
                controller.curntIndex.isNaN || controller.curntIndex < 0
                    ? 0
                    : controller.curntIndex,
            count:
                controller.banners.isNotEmpty ? controller.banners.length : 1,
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
