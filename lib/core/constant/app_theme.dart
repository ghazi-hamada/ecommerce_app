import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';

ThemeData themeEnglish = ThemeData(
    fontFamily: "Poppins",
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColor.primaryColor),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0,
      iconTheme: const IconThemeData(color: AppColor.primaryColor),
      titleTextStyle: const TextStyle(
          color: AppColor.primaryColor,
          fontWeight: FontWeight.bold,
          fontFamily: "Poppins",
          fontSize: 25),
      backgroundColor: Colors.grey[50],
    ),
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
        // ignore: deprecated_member_use
        displayLarge: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 22, color: AppColor.black),
        // ignore: deprecated_member_use
        displayMedium: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 26, color: AppColor.black),
        // ignore: deprecated_member_use
        bodyLarge: TextStyle(
            height: 2,
            color: AppColor.grey,
            fontWeight: FontWeight.bold,
            fontSize: 14),
        // ignore: deprecated_member_use
        bodyMedium: TextStyle(height: 2, color: AppColor.grey, fontSize: 14)),
    primarySwatch: Colors.deepOrange);

ThemeData themeArabic = ThemeData(
  fontFamily: "Cairo",
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
      // ignore: deprecated_member_use
      displayLarge: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 22, color: AppColor.black),
      // ignore: deprecated_member_use
      displayMedium: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 26, color: AppColor.black),
      // ignore: deprecated_member_use
      bodyLarge: TextStyle(
          height: 2,
          color: AppColor.grey,
          fontWeight: FontWeight.bold,
          fontSize: 14),
      // ignore: deprecated_member_use
      bodyMedium: TextStyle(height: 2, color: AppColor.grey, fontSize: 14)),
  primarySwatch: Colors.deepOrange,
);
