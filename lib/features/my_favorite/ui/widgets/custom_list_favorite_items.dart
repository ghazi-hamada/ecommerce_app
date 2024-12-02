
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/constant/app_apis.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/functions/translate_database.dart';
import 'package:ecommerce_app/core/widgets/custom_price_widget.dart';
import 'package:ecommerce_app/features/my_favorite/controller/my_favorite_controller.dart';
import 'package:ecommerce_app/features/my_favorite/data/model/my_fevorite_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class CustomListFavoriteItems extends GetView<MyFavoriteControllerImpl> {
  final MyFavoriteModel itemsModel;
  const CustomListFavoriteItems({
    super.key,
    required this.itemsModel,
  });

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => MyFavoriteControllerImpl());
    return InkWell(
      onTap: () {},
      child: Stack(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(10.00),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Hero(
                    tag: "${itemsModel.itemsId}",
                    child: CachedNetworkImage(
                      imageUrl:
                          "${AppApis.imageItems}/${itemsModel.itemsImage}",
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "${translateDatabase(arabic: itemsModel.itemsNameAr!, english: itemsModel.itemsName!)}",
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColor.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomPriceWidget(
                    itemsDiscount: itemsModel.itemsDiscount!,
                    itemsPrice: itemsModel.itemsPrice!,
                  ),
                  const SizedBox(height: 10),
                  // add to Cart
                  Container(
                    // height: .h,
                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.h,
                      vertical: 2.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: const Text(
                      "Add to Cart",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
              right: 10,
              top: 10,
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite,
                      color: AppColor.primaryColor, size: 26.sp))),
        ],
      ),
    );
  }
}
