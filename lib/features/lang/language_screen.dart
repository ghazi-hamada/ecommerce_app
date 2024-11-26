import 'package:ecommerce_app/core/localization/change_local.dart';
import 'package:ecommerce_app/core/localization/strings_keys.dart';
import 'package:ecommerce_app/core/routing/routes_app.dart';
import 'package:ecommerce_app/features/lang/ui/widgets/custum_button_lang.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageScreen extends GetView<LocaleController> {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // ignore: deprecated_member_use
            Text(StringsKeys.lang.tr,
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 20),
            CustumButtonLang(
                text: StringsKeys.langArabic.tr,
                function: () {
                  controller.changeLang("ar");
                  Get.toNamed(AppRoutes.kOnboarding);
                }),
            CustumButtonLang(
                text: StringsKeys.langEnglish.tr,
                function: () {
                  controller.changeLang("en");
                  Get.toNamed(AppRoutes.kOnboarding);
                }),
          ],
        ),
      ),
    );
  }
}
