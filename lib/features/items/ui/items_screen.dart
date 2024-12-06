import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/features/NavigationBar_items/home/data/models/items_model.dart';
import 'package:ecommerce_app/features/items/controller/favorite_controller.dart';
import 'package:ecommerce_app/features/items/controller/items_controller.dart';
import 'package:ecommerce_app/features/items/ui/widgets/categories_name_widget.dart';
import 'package:ecommerce_app/features/items/ui/widgets/custom_gridview_items.dart';
import 'package:ecommerce_app/features/items/ui/widgets/search_and_notification.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ItemsControllerImpl());
    final controllerFev = Get.put(FavoriteController());
    return Scaffold(
      body: ListView(
        children: [
          //search_and_notification
          const SearchAndNotification(),
          //categories_name_widget
          const CategoriesNameWidget(),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: GetBuilder<ItemsControllerImpl>(builder: (controller) {
              return HandlingItems(
                statusRequest: controller.statusRequest,
                child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.items.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 0.7),
                    itemBuilder: (context, index) {
                      log("${controller.items[index]['items_id']}");

                      controllerFev.isFavorite.addIf(
                          1 == 1,
                          "${controller.items[index]['items_id']}",
                          "${controller.items[index]['favorite']}");
                      return CustomGridViewItems(
                        active: true,
                        itemsModel:
                            ItemsModel.fromJson(controller.items[index]),
                      );
                    }),
              );
            }),
          ),
          //gridview builder items
        ],
      ),
    );
  }
}
//custom_gridview_items
