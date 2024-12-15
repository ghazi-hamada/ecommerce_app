import '../../../../../core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildFormInputCouponAndApply({required controller}) {
  return Container(
    margin: EdgeInsets.only(bottom: 5.h, top: 5.h),
    child: Row(
      children: [
        // حقل إدخال القسيمة
        Expanded(
          flex: 3,
          child: TextFormField(
            controller: controller.controllerCoupon,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
              hintText: 'Enter Coupon',
              hintStyle: TextStyle(color: Colors.grey, fontSize: 12.sp),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8), // حواف دائرية
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                    color: AppColor.primaryColor,
                    width: 1.5), // لون عند التركيز
              ),
            ),
          ),
        ),
        SizedBox(width: 10.w), // مسافة صغيرة بين الحقل والزر
        // زر تطبيق القسيمة
        Expanded(
          flex: 1,
          child: InkWell(
            onTap: () {
              controller.couponIsApplied ? null : controller.applyCoupon();
            },
            child: Container(
              alignment: Alignment.center,
              height: 40.h, // ارتفاع أقل
              decoration: controller.couponIsApplied
                  ? BoxDecoration(
                      color: AppColor.grey, // لون مناسب للشاشة
                      borderRadius: BorderRadius.circular(8), // حواف دائرية
                    )
                  : BoxDecoration(
                      color: AppColor.primaryColor, // لون مناسب للشاشة
                      borderRadius: BorderRadius.circular(8), // حواف دائرية
                    ),
              child: Text(
                'Apply',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp, // حجم أصغر للنص
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
