import 'package:flutter/material.dart';

import '../../../../core/constant/color.dart';

Widget buildElevatedButton({
  required String text,
  required void Function()? onPressed,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.all(10),
      backgroundColor: AppColor.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    child: Text(
      text,
      style: const TextStyle(color: Colors.white),
    ),
  );
}