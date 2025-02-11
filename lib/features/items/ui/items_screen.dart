import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/class/handling_data_view.dart';
import '../../NavigationBar_items/home/data/models/items_model.dart';
import '../../NavigationBar_items/home/ui/widgets/list_items_search.dart';
import '../../search/controller/search_controller.dart';
import '../controller/favorite_controller.dart';
import '../controller/items_controller.dart';
import 'widgets/categories_name_widget.dart';
import 'widgets/custom_gridview_items.dart';
import 'widgets/search_and_notification.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
   final controller = Get.put(ItemsControllerImpl());
    final controllerFev = Get.put(FavoriteController());
    Get.put(SearchControllerImpl());
    return Scaffold(
      body: ListView(
        children: [
          //search_and_notification
            SearchAndNotification(
            searchController: controller.searchController,
          ),
          //categories_name_widget
          const CategoriesNameWidget(),
          GetBuilder<SearchControllerImpl>(builder: (searchController) {
            return searchController.isSearching &&
                    searchController.itemsSearch.isNotEmpty
                ? ListItemsSearch(listData: searchController.itemsSearch)
                : Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                    child:
                        GetBuilder<ItemsControllerImpl>(builder: (controller) {
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
                                itemsModel: ItemsModel.fromJson(
                                    controller.items[index]),
                              );
                            }),
                      );
                    }),
                  );
          }),
          //gridview builder items
        ],
      ),
    );
  }
}
//custom_gridview_items
