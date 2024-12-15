import 'custom_cutom_cart_widget.dart';
import 'form_input_coupon_and_apply.dart';
import 'text_and_val_widget.dart';

import '../../../../../core/constant/color.dart';
import '../../controller/cart_controller.dart';
import '../../../../../routes_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrderBottomSheetWidget extends StatelessWidget {
  const OrderBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => CartControllerImp());
    Get.put(CartControllerImp());
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 6,
                offset: const Offset(0, -3),
              ),
            ],
          ),
          child: GetBuilder<CartControllerImp>(builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Discount Code",
                  style: TextStyle(fontSize: 12.sp, color: AppColor.black),
                  textAlign: TextAlign.left,
                ),
                // cuopon
                buildFormInputCouponAndApply(controller: controller),

                // السعر الإجمالي
                Column(
                  children: [
                    textAndValWidget(
                        text: "Price",
                        val: "\$${controller.subTotal.toStringAsFixed(2)}"),
                    textAndValWidget(
                        text: "Discount", val: "\$${controller.discount}"),
                    textAndValWidget(text: "Shipping", val: "\$10"),
                    const Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                    textAndValWidget(
                        isTotal: true,
                        text: "Total",
                        val: "\$${controller.total.toStringAsFixed(2)}"),
                  ],
                ),
                const SizedBox(height: 16),
                // زر الطلب
                customButomCartWidget(
                    text: "Order Now",
                    onTap: () {
                      controller.openCheckoutScreen();
                    }),
              ],
            );
          }),
        ),
      ],
    );
  }
}
