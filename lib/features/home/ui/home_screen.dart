import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/link_apis.dart';
import 'package:ecommerce_app/core/localization/strings_keys.dart';
import 'package:ecommerce_app/features/home/data/models/items_model.dart';
import 'package:ecommerce_app/features/home/ui/widgets/hello_and_notification.dart';
import 'package:ecommerce_app/features/home/ui/widgets/search_and_filter.dart';
import 'package:ecommerce_app/features/home/ui/widgets/special_for_you_widget.dart';
import 'package:ecommerce_app/features/home/ui/widgets/text_and_seeAll.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce_app/features/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends GetView<HomeControllerImpl> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeControllerImpl());
    return Scaffold(
      body: GetBuilder<HomeControllerImpl>(builder: (controller) {
        return GetBuilder<HomeControllerImpl>(builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            child: SingleChildScrollView(
              child: Center(
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 175.h,
                        decoration: const BoxDecoration(
                          color: Color(0xffFF4747),
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
                              const SearchAndFilter()
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          children: [
                            TextAndSeeAll(
                                text: "#SpecialForYou", onPressed: () {}),
                            SizedBox(height: 15.h),
                            // special_for_you_widget
                            const SpecialForYouWidget(),
                            SizedBox(height: 15.h),
                            // categoryAndSeeAll
                            TextAndSeeAll(
                                text: StringsKeys.categories.tr,
                                onPressed: () {}),
                          ],
                        ),
                      ),
                      SizedBox(height: 5.h),
                      // SmoothPageIndicator
                      SizedBox(
                        height: 90.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.categories.length,
                          itemBuilder: (context, index) => Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(
                                    left: index == 0 ? 20.w : 0, right: 20.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: const Color(0xffF6F6F6),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SvgPicture.network(
                                    "${LinkApis.imagecategories}/${controller.categories[index]['categories_image']}",
                                    color: const Color(0xffFF4747),
                                    width: 40.w,
                                    height: 40.h,
                                  ),
                                ),
                              ),
                              SizedBox(height: 5.h),
                              Container(
                                alignment: Alignment.center,
                                child: Text(
                                    controller.categories[index]
                                        ['categories_name'],
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        color: AppColor.black,
                                        fontWeight: FontWeight.w600)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 15.h),
                      SizedBox(
      height: 140,
      child: ListView.builder(
          itemCount: controller.items.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) {
            return ItemsHome(
                itemsModel: ItemsModel.fromJson(controller.items[i]));
          }),
    )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
      }),
    );
  }
}

class ItemsHome extends StatelessWidget {
  final ItemsModel itemsModel;
  const ItemsHome({Key? key, required this.itemsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Image.network(
            "${LinkApis.imageItems}/${itemsModel.itemsImage}",
            height: 100,
            width: 150,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: AppColor.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20)),
          height: 120,
          width: 200,
        ),
        Positioned(
            left: 10,
            child: Text(
              "${itemsModel.itemsName}",
              style: const TextStyle(
                  color: Colors.white,
                  // fontWeight: FontWeight.bold,
                  fontSize: 14),
            ))
      ],
    );
  }
}