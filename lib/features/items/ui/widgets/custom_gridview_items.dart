
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/constant/app_apis.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/features/home/data/models/items_model.dart';
import 'package:ecommerce_app/features/items/controller/favorite_controller.dart';
import 'package:ecommerce_app/features/items/controller/items_controller.dart';

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
    return InkWell(
        onTap: () => controller.showProductDetails(itemsModel),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CachedNetworkImage(
                    imageUrl: "${AppApis.imageItems}/${itemsModel.itemsImage!}",
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 10),
                  Text(itemsModel.itemsName!,
                      style: TextStyle(
                          color: AppColor.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                          height: 1.h)),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Rating 3.5 ", textAlign: TextAlign.center),
                        Container(
                          alignment: Alignment.bottomCenter,
                          height: 22,
                          child: Row(
                            children: [
                              ...List.generate(
                                  5,
                                  (index) => const Icon(
                                        Icons.star,
                                        size: 15,
                                      ))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${itemsModel.itemsPrice} \$",
                            style: const TextStyle(
                              color: AppColor.primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            )),
                        GetBuilder<FavoriteController>(
                            builder: (controllerfav) {
                          return IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.favorite,
                                color: controllerfav
                                            .isFavorite[itemsModel.itemsId] !=
                                        '1'
                                    ? Colors.red
                                    : null,
                              ));
                        })
                      ],
                    ),
                  )
                ]),
          ),
        ));
  }
}
