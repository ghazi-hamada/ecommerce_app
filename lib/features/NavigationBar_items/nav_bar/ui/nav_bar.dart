import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:ecommerce_app/features/NavigationBar_items/nav_bar/controller/nav_bar_controller.dart';
import 'package:ecommerce_app/features/NavigationBar_items/nav_bar/ui/widgets/custom_button_app_bar_home.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NavBarControllerImpl());
    return GetBuilder<NavBarControllerImpl>(
        builder: (controller) => Scaffold(
              backgroundColor: AppColor.backgroundcolor,
              floatingActionButton: FloatingActionButton(
                  shape: const CircleBorder(),
                  onPressed: () {
                    controller.pressCart();
                  },
                  child: SvgPicture.asset(
                    'assets/svg/shop.svg',
                    color: Colors.white,
                    width: 24.w,
                    height: 24.h,
                  )),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: const CustomBottomAppBarHome(),
              body: controller.listpages.elementAt(controller.currentIndex),
            ));
  }
}
