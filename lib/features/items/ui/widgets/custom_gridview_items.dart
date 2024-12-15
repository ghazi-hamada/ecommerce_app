import 'package:cached_network_image/cached_network_image.dart';
import '../../../../core/constant/app_apis.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/widgets/custom_price_widget.dart';
import '../../../NavigationBar_items/home/data/models/items_model.dart';
import '../../controller/favorite_controller.dart';
import '../../controller/items_controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomGridViewItems extends GetView<ItemsControllerImpl> {
  final ItemsModel itemsModel;
  final bool active;
  const CustomGridViewItems(
      {super.key, required this.itemsModel, required this.active});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => FavoriteController());
    return Stack(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Hero(
                    tag: "${itemsModel.itemsId}",
                    child: CachedNetworkImage(
                      imageUrl:
                          "${AppApis.imageItems}/${itemsModel.itemsImage!}",
                      height: 100,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(itemsModel.itemsName!,
                      style: TextStyle(
                          color: AppColor.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                          height: 1.h)),
                  SizedBox(height: 10.h),
                  //Description

                  //info price and discount
                  CustomPriceWidget(
                    itemsDiscount: itemsModel.itemsDiscount!,
                    itemsPrice: itemsModel.itemsPrice!,
                  ),
                  const SizedBox(height: 10),
                  // add to Cart
                  GetBuilder<ItemsControllerImpl>(builder: (controller) {
                    return InkWell(
                      onTap: () {
                        if (itemsModel.itemInCart == 1) {
                        } else {
                          controller.showProductDetails(itemsModel);
                          controller.getItems();
                        }
                      },
                      child: Container(
                        // height: .h,
                        alignment: Alignment.topCenter,
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.h,
                          vertical: 2.h,
                        ),
                        decoration: BoxDecoration(
                          color: itemsModel.itemInCart ==
                                  1 // controller.isProductInCart(itemsModel.itemsId!)
                              ? AppColor.grey
                              : AppColor.primaryColor,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: const Text(
                          "Add to Cart",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    );
                  })
                ]),
          ),
        ),
        Positioned(
            right: 10,
            top: 10,
            child: GetBuilder<FavoriteController>(builder: (controllerfav) {
              return 1 == 2
                  ? Container(
                      alignment: Alignment.center,
                      height: 32.h,
                      width: 35.w,
                      decoration: BoxDecoration(
                          color: AppColor.primaryColor,
                          borderRadius: BorderRadius.circular(30)),
                      child: IconButton(
                          onPressed: () {
                            controllerfav.setFavorite(
                                "${itemsModel.itemsId}", itemsModel);
                          },
                          icon: Icon(
                            controllerfav.isFavorite["${itemsModel.itemsId}"] ==
                                    '1'
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Colors.white,
                            size: 24,
                          )),
                    )
                  : IconButton(
                      onPressed: () {
                        controllerfav.setFavorite(
                            "${itemsModel.itemsId}", itemsModel);
                      },
                      icon: Icon(
                        Icons.favorite,
                        color:
                            controllerfav.isFavorite["${itemsModel.itemsId}"] ==
                                    '1'
                                ? AppColor.primaryColor
                                : AppColor.grey,
                        size: 30.sp,
                      ));
            }))
      ],
    );
  }
}
