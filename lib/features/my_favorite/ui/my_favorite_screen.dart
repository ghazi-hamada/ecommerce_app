import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/features/my_favorite/controller/my_favorite_controller.dart';
import 'package:ecommerce_app/features/my_favorite/ui/widgets/custom_appbar_widget.dart';
import 'package:ecommerce_app/features/my_favorite/ui/widgets/custom_list_favorite_items.dart';

class MyFavoriteScreen extends StatelessWidget {
  const MyFavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => MyFavoriteControllerImpl());
    return ListView(
      children: [
        const CustomAppBarWidget(
          title: "My Favorite",
        ),
        GetBuilder<MyFavoriteControllerImpl>(builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 0.7),
                  itemCount: controller.myFavorite.length,
                  itemBuilder: (context, index) {
                    return CustomListFavoriteItems(
                        itemsModel: controller.myFavorite[index]);
                  }),
            ),
          );
        }),
      ],
    );
  }
}
