import 'package:ecommerce_app/core/constant/app_apis.dart';
import 'package:ecommerce_app/core/functions/discount_calculator.dart';
import 'package:ecommerce_app/core/widgets/custom_price_widget.dart';
import 'package:ecommerce_app/features/NavigationBar_items/cart/controller/cart_controller.dart';
import 'package:ecommerce_app/features/NavigationBar_items/cart/data/model/mycart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ShoppingCartItem extends StatelessWidget {
  const ShoppingCartItem({super.key, required this.myCartModel});
  final MycartModel myCartModel;

  @override
  Widget build(BuildContext context) {
    final CartControllerImp controller = Get.put(CartControllerImp());
    return Container(
      height: 150.h,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          // صورة المنتج
          Expanded(
            flex: 2,
            child: SizedBox(
              width: 100.w,
              height: 100.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  '${AppApis.imageItems}/${myCartModel.itemsImage}',
                  width: 100.w,
                  height: 100.h,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          // تفاصيل المنتج
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    myCartModel.itemsName!,
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    myCartModel.itemsDesc!,
                    maxLines: 3,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Colors.grey,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                Expanded(
                    child: CustomPriceWidget(
                        itemsDiscount: myCartModel.itemsDiscount!,
                        itemsPrice: myCartModel.itemsPrice!.toDouble())

                    //  Text(
                    //   "\$${discountCalculator(myCartModel.itemsDiscount, myCartModel.itemsPrice)!}",
                    //   style: const TextStyle(
                    //     fontSize: 16,
                    //     fontWeight: FontWeight.bold,
                    //     color: Colors.green,
                    //   ),
                    // ),
                    ),
              ],
            ),
          ),
          // أزرار التحكم بالعدد
          GetBuilder<CartControllerImp>(builder: (controller) {
            return Expanded(
              flex: 1,
              child: Column(
                children: [
                  Expanded(
                    child: IconButton(
                      onPressed: () {
                        controller.increment(myCartModel.itemsId.toString());
                      },
                      icon: const Icon(Icons.add, color: Colors.red),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      controller.quantity[myCartModel.itemsId.toString()]!
                          .toString(),
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      onPressed: () {
                        controller.decrement(myCartModel.itemsId.toString());
                      },
                      icon: const Icon(Icons.remove, color: Colors.red),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
