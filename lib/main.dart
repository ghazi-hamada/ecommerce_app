import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'core/bindings/initial_Binding.dart';
import 'core/localization/change_local.dart';
import 'core/localization/translation.dart';
import 'core/services/services.dart';
import 'routes_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // التأكد من التهيئة الصحيحة
  await initialServices(); // انتظار الخدمات الأولية
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => GetMaterialApp(
              translations: MyTranslations(),
              debugShowCheckedModeBanner: false,
              locale: controller.language,
              title: 'E-commerce App',
              theme: controller
                  .appTheme, // تأكد أن appTheme لا يستخدم ScreenUtil بشكل مباشر
              initialBinding: InitialBinding(),
              getPages: AppRoutes.getPages,
              home: child, // يمكنك تحديد الصفحة الرئيسية هنا إذا كانت مطلوبة
            ));
  }
}
