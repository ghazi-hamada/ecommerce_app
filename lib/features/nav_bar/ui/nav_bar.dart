import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:ecommerce_app/features/nav_bar/controller/nav_bar_controller.dart';
import 'package:ecommerce_app/features/nav_bar/ui/widgets/custom_button_app_bar_home.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NavBarControllerImpl());
    return GetBuilder<NavBarControllerImpl>(
        builder: (controller) => Scaffold(
              floatingActionButton: FloatingActionButton(
                  shape: const CircleBorder(),
                  onPressed: () {},
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
