import 'widgets/list_items_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/class/handling_data_view.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/localization/strings_keys.dart';
import '../controller/home_controller.dart';
import '../data/models/items_model.dart';
import 'widgets/categories_images_and_name.dart';
import 'widgets/hello_and_notification.dart';
import 'widgets/items_home.dart';
import 'widgets/search_and_filter.dart';
import 'widgets/slider_and_smooth_page_indicator_widget.dart';
import 'widgets/text_and_seeAll.dart';

class HomeScreen extends GetView<HomeControllerImpl> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeControllerImpl());
    return Scaffold(
      body: GetBuilder<HomeControllerImpl>(builder: (controller) {
        return GetBuilder<HomeControllerImpl>(builder: (controller) {
          return SingleChildScrollView(
            child: Center(
              child: Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // widget hello_and_notification and search_and_filter
                    Container(
                      width: double.infinity,
                      height: 175.h,
                      decoration: const BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 40.h, left: 25.w, right: 25.w, bottom: 20.h),
                        child: Column(
                          children: [
                            // hello_and_notification
                            const HelloAndNotification(),
                            SizedBox(height: 25.h),
                            // search_and_filter
                            SearchAndFilter(
                               onChanged: (value) {
                                controller.isSearchingItems(value);
                              },
                              onPressedSearch: () {
                                controller.search();
                              },
                              onPressedClear: () => controller.clearSearch(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    // special_for_you_widget
                    controller.isSearching
                        ? ListItemsSearch(listData: controller.itemsSearch)
                        : HandlingDataView(
                            statusRequest: controller.statusRequest,
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Column(
                                    children: [
                                      TextAndSeeAll(
                                          text: "#SpecialForYou",
                                          onPressed: () {}),
                                      SizedBox(height: 15.h),
                                      // slider_and_smooth_page_indicator_widget
                                      const SliderAndSmoothPageIndicatorWidget(),
                                      SizedBox(height: 15.h),

                                      // categoryAndSeeAll
                                      TextAndSeeAll(
                                          text: StringsKeys.categories.tr,
                                          onPressed: () {}),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5.h),
                                // categories_images_and_name
                                const CategoriesImagesAndName(),
                                // items for you
                                Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 20.w),
                                    child: TextAndSeeAll(
                                        text: "#ItemsForYou",
                                        onPressed: () {})),
                                SizedBox(
                                  height: 140,
                                  child: ListView.builder(
                                      itemCount: controller.items.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return ItemsHome(
                                            index: index,
                                            itemsModel: ItemsModel.fromJson(
                                                controller.items[index]));
                                      }),
                                ),
                                Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 20.w),
                                    child: TextAndSeeAll(
                                        text: "#popular", onPressed: () {})),
                                SizedBox(
                                  height: 140,
                                  child: ListView.builder(
                                      itemCount: controller.items.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return ItemsHome(
                                            index: index,
                                            itemsModel: ItemsModel.fromJson(
                                                controller.items[index]));
                                      }),
                                ),
                              ],
                            ),
                          ),
                  ],
                ),
              ),
            ),
          );
        });
      }),
    );
  }
}
