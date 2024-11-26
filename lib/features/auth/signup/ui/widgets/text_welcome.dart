import 'package:ecommerce_app/core/localization/strings_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextWelcome extends StatelessWidget {
  const TextWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          StringsKeys.welcomeBack.tr,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 10),
        Text(
          StringsKeys.welcomeStartJourney.tr,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.displaySmall,
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
