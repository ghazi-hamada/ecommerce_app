import '../../../../../core/constant/color.dart';
import '../../../../../core/constant/app_apis.dart';
import '../../controller/home_controller.dart';
import '../../data/models/categories_model.dart';
import 'categories_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CategoriesImagesAndName extends GetView<HomeControllerImpl> {
  const CategoriesImagesAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: SizedBox(
        height: 75.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.categories.length,
          itemBuilder: (context, index) =>   CategoriesWidget(
            categoriesModel: CategoriesModel.fromJson(controller.categories[index]),
            index: index,
          ),
        ),
      ),
    );
  }
}
