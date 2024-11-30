import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/constant/app_apis.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/features/home/data/models/items_model.dart';
import 'package:ecommerce_app/features/items/controller/items_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class CustomGridViewItems extends GetView<ItemsControllerImpl> {
  final ItemsModel itemsModel;
  const CustomGridViewItems({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
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
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(height: 10),
                  Text(itemsModel.itemsName!,
                      style: const TextStyle(
                          color: AppColor.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
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
                                fontFamily: "sans")),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite,
                              color: AppColor.primaryColor,
                            ))
                      ],
                    ),
                  )
                ]),
          ),
        ));
  }
}
