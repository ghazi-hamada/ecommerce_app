import 'package:ecommerce_app/features/home/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class NavBarController extends GetxController {
  changPage(int currentPage);
}

class NavBarControllerImpl extends NavBarController {
  int currentIndex = 0;
  List titlebottomappbar = ["home", "settings", "profile", "favorite"];
  List iconbottomappbar = [Icons.home, Icons.settings, Icons.person, Icons.favorite];
  List<Widget> listpages = [
    const HomeScreen(),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Page 2'),
        ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('Back')),
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Page 3'),
        ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('Back')),
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Page 4'),
        ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('Back')),
      ],
    ),
  ];
  @override
  changPage(int currentPage) {
    currentIndex = currentPage;
    update();
  }
}
