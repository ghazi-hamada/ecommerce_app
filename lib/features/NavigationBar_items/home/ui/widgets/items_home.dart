import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import '../../../../../core/constant/color.dart';
import '../../../../../core/constant/app_apis.dart';
import '../../../../../core/functions/translate_database.dart';
import '../../../../../routes_app.dart';
import '../../data/models/items_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemsHome extends StatelessWidget {
  final ItemsModel itemsModel;
  final int index;
  const ItemsHome({super.key, required this.itemsModel, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (itemsModel.itemInCart == 1) {
          Get.snackbar(
            'Warning',
            'This item is already in the cart',
            backgroundColor: AppColor.grey,
            colorText: Colors.white,
          );
        } else if (itemsModel.itemInCart == 0) {
          Get.toNamed(AppRoutes.kProductDetails,
              arguments: {'itemsmodel': itemsModel});
        }
      },
      child: Container(
        margin: EdgeInsets.only(left: index == 0 ? 20.w : 0),
        child: Stack(
          children: [
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: CachedNetworkImage(
                  imageUrl: "${AppApis.imageItems}/${itemsModel.itemsImage}",
                  height: 100,
                  width: 150,
                  fit: BoxFit.contain,
                )),
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
                  translateDatabase(
                      arabic: "${itemsModel.itemsNameAr}",
                      english: "${itemsModel.itemsName}"),
                  style: const TextStyle(
                      color: Colors.white,
                      // fontWeight: FontWeight.bold,
                      fontSize: 14),
                ))
          ],
        ),
      ),
    );
  }
}
