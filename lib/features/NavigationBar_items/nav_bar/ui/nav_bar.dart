import 'dart:io';

import '../../../../core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../controller/nav_bar_controller.dart';
import 'widgets/custom_button_app_bar_home.dart';

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
              body: WillPopScope(
                  onWillPop: () async {
                    return await showExitConfirmation();
                  },
                  child:
                      controller.listpages.elementAt(controller.currentIndex)),
            ));
  }

  /// نافذة التأكيد عند محاولة الخروج
  Future<bool> showExitConfirmation() async {
    return await Get.defaultDialog(
          title: "Exit App?",
          titleStyle: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          middleText: "Are you sure you want to exit the app?",
          middleTextStyle: const TextStyle(
              fontSize: 18, color: AppColor.grey, fontWeight: FontWeight.w500),
          backgroundColor: Colors.white,
          radius: 10,
          confirm: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
            ),
            onPressed: () {
              exit(0); // يغلق التطبيق
            },
            child: const Text("Exit", style: TextStyle(color: Colors.white)),
          ),
          cancel: OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.redAccent),
            ),
            onPressed: () {
              Get.back(); // يغلق النافذة
            },
            child:
                const Text("Cancel", style: TextStyle(color: Colors.redAccent)),
          ),
        ) ??
        false;
  }
}
