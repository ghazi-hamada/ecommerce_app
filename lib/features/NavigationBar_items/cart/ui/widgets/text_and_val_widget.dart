import '../../../../../core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget textAndValWidget(
    {bool isTotal = false, required String text, required String val}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        text,
        style: TextStyle(
          fontSize: isTotal ? 14.sp : 12.sp,
          fontWeight: FontWeight.bold,
          color: isTotal ? AppColor.primaryColor : AppColor.grey,
        ),
      ),
      Text(
        val, // يمكنك تحديث هذا المبلغ بناءً على مجموع المنتجات
        style: TextStyle(
          fontSize: isTotal ? 14.sp : 12.sp,
          fontWeight: FontWeight.bold,
          color: isTotal ? AppColor.primaryColor : AppColor.grey,
        ),
      ),
    ],
  );
}
