import 'package:ecommerce_app/core/constant/app_apis.dart';
import 'package:ecommerce_app/core/functions/discount_calculator.dart';
import 'package:ecommerce_app/features/NavigationBar_items/cart/controller/cart_controller.dart';
import 'package:ecommerce_app/features/NavigationBar_items/home/controller/home_controller.dart';
import 'package:ecommerce_app/features/NavigationBar_items/home/data/models/items_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class ListItemsSearch extends GetView<HomeControllerImpl> {
  final List<ItemsModel> listData;
  const ListItemsSearch({super.key, required this.listData});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listData.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            controller.goToProductDetails(listData[index]);
          },
          child: Container(
            height: 100.h,
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
                        '${AppApis.imageItems}/${listData[index].itemsImage}',
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
                          listData[index].itemsName!,
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
                          listData[index].itemsDesc!,
                          maxLines: 3,
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: Colors.grey,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "\$${discountCalculator(listData[index].itemsDiscount, listData[index].itemsPrice)!}",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
