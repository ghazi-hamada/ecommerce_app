import 'package:ecommerce_app/core/localization/strings_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogoAndTextWelcome extends StatelessWidget {
const LogoAndTextWelcome({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
         Image.asset("assets/images/logo.png", fit: BoxFit.fill),
              Text(
                StringsKeys.welcomeBack.tr,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  StringsKeys.signInWithEmail.tr,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
              const SizedBox(height: 40),
      ],
    );
  }
}