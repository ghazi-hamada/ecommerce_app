import 'package:ecommerce_app/features/NavigationBar_items/cart/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderBottomSheetWidget extends StatelessWidget {
  const OrderBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => CartControllerImp());
    return Container(
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
      child: Column(
        children: [
          // السعر الإجمالي
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
              GetBuilder<CartControllerImp>(builder: (controller) {
                return Text(
                  "\$${controller.total.toStringAsFixed(2)}", // يمكنك تحديث هذا المبلغ بناءً على مجموع المنتجات
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                );
              }),
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
                // تنفيذ الطلب
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
      ),
    );
  }
}
