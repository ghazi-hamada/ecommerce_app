import 'package:ecommerce_app/features/NavigationBar_items/home/ui/home_screen.dart';
import 'package:ecommerce_app/features/NavigationBar_items/my_favorite/ui/my_favorite_screen.dart';
import 'package:ecommerce_app/features/NavigationBar_items/settings/ui/settings_screen.dart';
import 'package:ecommerce_app/routes_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class NavBarController extends GetxController {
  changPage(int currentPage);
  pressCart();
}

class NavBarControllerImpl extends NavBarController {
  int currentIndex = 0;
  List titlebottomappbar = [
    "home",
    "profile",
    "settings",
    "favorite",
  ];
  List iconbottomappbar = [
    Icons.home,
    Icons.person,
    Icons.settings,
    Icons.favorite
  ];
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
    const SettingsScreen(),
    const MyFavoriteScreen(),
  ];
  @override
  changPage(int currentPage) {
    currentIndex = currentPage;
    update();
  }

  @override
  pressCart() {
    Get.toNamed(AppRoutes.kCart, arguments: {'source': 'homepage'});
  }
}
