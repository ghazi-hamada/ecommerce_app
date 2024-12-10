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
                Container(
                  margin: EdgeInsets.only(bottom: 10.h, top: 5.h),
                  child: Row(
                    children: [
                      // حقل إدخال القسيمة
                      Expanded(
                        flex: 3,
                        child: TextFormField(
                          controller: controller.controllerCoupon,
                          cursorHeight: 20.h,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 12.w),
                            hintText: 'Enter Coupon',
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 12.sp),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(8), // حواف دائرية
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
                            controller.couponIsApplied
                                ? null
                                : controller.applyCoupon();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 40.h, // ارتفاع أقل
                            decoration: controller.couponIsApplied
                                ? BoxDecoration(
                                    color: AppColor.grey, // لون مناسب للشاشة
                                    borderRadius:
                                        BorderRadius.circular(8), // حواف دائرية
                                  )
                                : BoxDecoration(
                                    color: AppColor
                                        .primaryColor, // لون مناسب للشاشة
                                    borderRadius:
                                        BorderRadius.circular(8), // حواف دائرية
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
                ),

                // السعر الإجمالي
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Discount",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "%${controller.discount.toInt()}", // يمكنك تحديث هذا المبلغ بناءً على مجموع المنتجات
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Total",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "\$${controller.total.toStringAsFixed(2)}", // يمكنك تحديث هذا المبلغ بناءً على مجموع المنتجات
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // زر الطلب
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: Colors.red, // لون الزر
                    ),
                    onPressed: () {
                      controller.openCheckoutScreen();
                    },
                    child: const Text(
                      "Order Now",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ],
    );
  }
}
