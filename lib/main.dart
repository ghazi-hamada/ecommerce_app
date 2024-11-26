import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/localization/change_local.dart';
import 'package:ecommerce_app/core/localization/translation.dart';
import 'package:ecommerce_app/core/routing/routes.dart';
import 'package:ecommerce_app/core/routing/routes.dart';
import 'package:ecommerce_app/core/routing/routes_app.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/features/onboarding/ui/onboarding_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      translations: MyTranslations(),
      debugShowCheckedModeBanner: false,
      locale: controller.language,
      title: 'E-commerce App',
      theme: controller.appTheme,
      getPages: AppRoutes.getPages,
    );
  }
}
