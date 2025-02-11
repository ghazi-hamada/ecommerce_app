import '../../../../core/constant/color.dart';
import '../../../../core/localization/strings_keys.dart';
import '../../controller/product_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//button_NavigationBar_widget
Container bottomNavigationBarWidget() {
  ProductDetailsControllerImpl controller =
      Get.put(ProductDetailsControllerImpl());
  return Container(
      margin: EdgeInsets.symmetric(horizontal: Get.width / 20, vertical: 20),
      height: 40,
      child: MaterialButton(
        onPressed: () {
          controller.itemsModel.itemInCart == 1
              ? Get.snackbar("Error", "Item already in cart")
              : controller.addItemsCart(
                  controller.itemsModel.itemsId!.toString(), controller.count);
        },
        color: controller.itemsModel.itemInCart == 1
            ? Colors.grey
            : AppColor.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          StringsKeys.addToCart.tr,
          style: const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ));
}
