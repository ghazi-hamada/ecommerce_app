import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBarWidget extends StatelessWidget {
  final String title;
  const CustomAppBarWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.w),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: const BoxDecoration(
        color: AppColor.backgroundcolor,
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.h),
        child: Row(
          children: [
            Text(title,
                style: const TextStyle(
                    color: AppColor.primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(5),
              width: 30.w,
              height: 40.h,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: const Icon(Icons.notifications,
                  color: Color(0xffD04142), size: 35),
            ),
          ],
        ),
      ),
    );
  }
}
