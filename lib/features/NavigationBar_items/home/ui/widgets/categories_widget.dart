import '../../../../../core/constant/color.dart';
import '../../../../../core/constant/app_apis.dart';
import '../../../../../core/functions/translate_database.dart';
import '../../controller/home_controller.dart';
import '../../data/models/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class CategoriesWidget extends GetView<HomeControllerImpl> {
  const CategoriesWidget(
      {required this.index, required this.categoriesModel, super.key});
  final int index;
  final CategoriesModel categoriesModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItems(categoriesModel);
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: index == 0 ? 20.w : 0, right: 20.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: const Color(0xffF6F6F6),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.network(
                "${AppApis.imageCategories}/${categoriesModel.categoriesImage}",
                color: const Color(0xffFF4747),
                width: 30.w,
                height: 30.h,
              ),
            ),
            SizedBox(height: 3.h),
            Container(
              alignment: Alignment.center,
              child: Text(
                  translateDatabase(
                      arabic: categoriesModel.categoriesNameAr!,
                      english: categoriesModel.categoriesName!),
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      fontSize: 14,
                      color: AppColor.black,
                      fontWeight: FontWeight.w600)),
            ),
          ],
        ),
      ),
    );
  }
}
