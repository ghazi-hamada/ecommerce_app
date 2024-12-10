import '../../../../core/constant/color.dart';
import '../../../../core/functions/translate_database.dart';
import '../../../NavigationBar_items/home/data/models/categories_model.dart';
import '../../controller/items_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CategoriesNameWidget extends StatelessWidget {
  const CategoriesNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ItemsControllerImpl());
    return GetBuilder<ItemsControllerImpl>(builder: (controller) {
      return Container(
        margin: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        height: 50.h,
        child: ListView.builder(
            itemCount: controller.categoriesModel.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return CustomListViewCategory(
                index,
                categoriesModel:
                    CategoriesModel.fromJson(controller.categoriesModel[index]),
              );
            }),
      );
    });
  }
}

class CustomListViewCategory extends GetView<ItemsControllerImpl> {
  final CategoriesModel categoriesModel;
  final int index;
  const CustomListViewCategory(
    this.index, {
    super.key,
    required this.categoriesModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //categories
        InkWell(
          onTap: () {
            controller
                .changeItemCategories(categoriesModel.categoriesId as int);
          },
          child: Container(
            alignment: Alignment.center,
            margin:
                EdgeInsets.only(left: index == 0 ? 20 : 0, right: 20, top: 20),
            decoration: categoriesModel.categoriesId == controller.categoriesId
                ? const BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(width: 3, color: AppColor.primaryColor)))
                : null,
            child: Text(
              translateDatabase(
                  arabic: categoriesModel.categoriesNameAr!,
                  english: categoriesModel.categoriesName!),
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
