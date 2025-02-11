import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/localization/change_local.dart';
import 'package:ecommerce_app/routes_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/localization/strings_keys.dart';

class LanguageSelectionScreen extends StatelessWidget {
  const LanguageSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LocaleController());
    return Scaffold(
      appBar: AppBar(
        title: Text(StringsKeys.lang.tr),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Center(
                child: Text(
                  StringsKeys.chooseLang.tr,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  StringsKeys.chooseLangbady.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              GetBuilder<LocaleController>(builder: (controller) {
                return Column(
                  spacing: 15.h,
                  children: [
                    languageOption(
                      language: "العربية / Arabic",
                      flag: "🇵🇸", // يمكنك استبدال هذا بصورة للعلم
                      isSelected: controller.selectedLanguage == "ar",
                      onTap: () {
                        controller.changeLang("ar");
                      },
                      context: context,
                    ),
                    languageOption(
                      language: "English / الإنجليزية",
                      flag: "🇬🇧", // يمكنك استبدال هذا بصورة للعلم
                      isSelected: controller.selectedLanguage == "en",
                      onTap: () {
                        controller.changeLang("en");
                      },
                      context: context,
                    ),
                  ],
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}

Widget languageOption(
    {required String language,
    required String flag,
    required bool isSelected,
    required VoidCallback onTap,
    required BuildContext context}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
        color: isSelected ? Colors.purple[50] : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected ? AppColor.primaryColor : Colors.grey[300]!,
          width: 2,
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      child: Row(
        spacing: context.width * 0.04,
        children: [
          Text(
            flag,
            style: const TextStyle(fontSize: 28),
          ),
          Expanded(
            child: Text(
              language,
              style: TextStyle(
                fontSize: 18,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                color: isSelected ? AppColor.primaryColor : Colors.black,
              ),
            ),
          ),
          if (isSelected)
            const Icon(
              Icons.check_circle,
              color: AppColor.primaryColor,
            ),
        ],
      ),
    ),
  );
}
