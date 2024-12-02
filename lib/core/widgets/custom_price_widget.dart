import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/functions/discount_calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPriceWidget extends StatelessWidget {
  const CustomPriceWidget({
    super.key,
    required this.itemsDiscount,
    required this.itemsPrice,
  });

  final int itemsDiscount;
  final double itemsPrice;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        itemsDiscount != 0
            ? Row(
                children: [
                  // price after discount
                  Text(
                    "\$${discountCalculator(itemsDiscount, itemsPrice)}",
                    style: const TextStyle(
                      color: AppColor.primaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 5.w),
                  // price before discount
                  Text(
                    "\$$itemsPrice",
                    style: const TextStyle(
                      color: AppColor.grey,
                      fontSize: 12,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ],
              )
            : Text(
                "\$$itemsPrice",
                style: const TextStyle(
                  color: AppColor.primaryColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
        const Spacer(),
        //discount percent
        if (itemsDiscount != 0)
          Container(
            height: 18.h,
            alignment: Alignment.topCenter,
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 0),
            decoration: BoxDecoration(
              color: AppColor.red,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              "$itemsDiscount%",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          )
        else
          Container(),
      ],
    );
  }
}
