import '../../../../core/localization/strings_keys.dart';
import '../../home/ui/home_screen.dart';
import '../../my_favorite/ui/my_favorite_screen.dart';
import '../../offers/ui/offers_screen.dart';
import '../../settings/ui/settings_screen.dart';
import '../../../../routes_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class NavBarController extends GetxController {
  changPage(int currentPage);
  pressCart();
}

class NavBarControllerImpl extends NavBarController {
  int currentIndex = 0;
  List titlebottomappbar = [
    StringsKeys.home.tr,
    StringsKeys.offers.tr,
    StringsKeys.settings.tr,
    StringsKeys.favorite.tr,
  ];
  List iconbottomappbar = [
    Icons.home,
    Icons.local_offer,
    Icons.settings,
    Icons.favorite
  ];
  List<Widget> listpages = [
    const HomeScreen(),
    const OffersScreen(),
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
    Get.toNamed(
      AppRoutes.kCart,
      arguments: {'source': 'homepage'},
    );
  }
}
