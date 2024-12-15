
import '../helpers/fcmconfig.dart';

import '../constant/app_theme.dart';
import '../services/services.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {
  Locale? language;
  MyServices myServices = Get.find();

  ThemeData appTheme = themeEnglish;

  void changeLang(String langCode) {
    Locale locale = Locale(langCode);
    myServices.sharedPreferences.setString("lang", langCode);
    appTheme = langCode == "ar" ? themeArabic : themeEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  requestPerLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Get.snackbar("تنبيه", "الرجاء تشغيل خدمو تحديد الموقع");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Get.snackbar("تنبيه", "الرجاء اعطاء صلاحية الموقع للتطبيق");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Get.snackbar("تنبيه", "لا يمكن استعمال التطبيق من دون اللوكيشين");
    }
  }

  String? token;

   

  @override
  void onInit() {
    String? langCode = myServices.sharedPreferences.getString("lang");
    if (langCode == "ar") {
      appTheme = themeArabic;
      language = const Locale("ar");
    } else if (langCode == "en") {
      appTheme = themeEnglish;
      language = const Locale("en");
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme = language!.languageCode == "ar" ? themeArabic : themeEnglish;
    }
    requestPerLocation();
     requestPermissionNotification();
    fcmconfig();
    super.onInit();
  }
}