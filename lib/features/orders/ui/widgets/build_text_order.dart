import '../../../../core/constant/color.dart';
import '../../controller/orders_controller.dart';
import 'package:flutter/material.dart';

Widget buildTextOrder({required String text, bool onUp = false}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: onUp ? 16 : 14,
      fontWeight: onUp ? FontWeight.bold : FontWeight.w500,
      color: onUp ? AppColor.primaryColor : Colors.black54,
    ),
  );
}
