import 'package:ecommerce_app/core/localization/strings_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/class/handling_data_view.dart';
import '../controller/my_favorite_controller.dart';
import 'widgets/custom_appbar_widget.dart';
import 'widgets/custom_list_favorite_items.dart';

class MyFavoriteScreen extends StatelessWidget {
  const MyFavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => MyFavoriteControllerImpl());
    return ListView(
      children: [
        CustomAppBarWidget(
          title: StringsKeys.myFavorite.tr,
        ),
        GetBuilder<MyFavoriteControllerImpl>(builder: (controller) {
          return HandlingDataViewRequesst(
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
