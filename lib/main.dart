import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/localization/translation.dart';
import 'package:ecommerce_app/core/routing/routes.dart';
import 'package:ecommerce_app/core/routing/routes.dart';
import 'package:ecommerce_app/core/routing/routes_app.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/features/onboarding/ui/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main(List<String> args) async{
  WidgetsFlutterBinding.ensureInitialized();
 await initialServices();
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: MyTranslations(),
      debugShowCheckedModeBanner: false,
      title: 'E-commerce App',
      theme: ThemeData(
        fontFamily: "Poppins",
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          titleMedium: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: AppColor.black,
          ),
          displaySmall: TextStyle(
              height: 2,
              color: AppColor.grey,
              fontWeight: FontWeight.bold,
              fontSize: 16),
        ),
      ),
      home: const OnboardingScreen(),
      getPages: AppRoutes.getPages,
    );
  }
}
