import 'dart:developer';

import 'package:ecommerce_app/features/NavigationBar_items/cart/data/model/coupon_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/functions/handling_data.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/features/NavigationBar_items/cart/data/remote/cart_data.dart';

abstract class CartController extends GetxController {
  addItemsCart(String itemsId, int count);
  remove(int itemsId);
  view();
  decrement(String itemsId);
  increment(String itemsId);
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  CartData cartData = CartData(Get.find());
  int count = 1;
  List myCart = [];
  Map<String, int> quantity = {};
  double total = 0.0;
  double discount = 0.0;
  late TextEditingController controllerCoupon;
  late CouponModel couponModel;
  applyCoupon();
  bool couponIsApplied = false;
}

class CartControllerImp extends CartController {
  @override
  addItemsCart(String itemsId, int count) async {
    Get.back();
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartData.addData(
      myServices.sharedPreferences.getString("id")!.toString(),
      itemsId.toString(),
      count.toString(),
    );

    statusRequest = handlingData(response);
    log('response: $response');

    update();
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.rawSnackbar(
          message: "Add Cart Success",
          duration: const Duration(seconds: 1),
        );
      }
    }
  }

  @override
  view() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartData.viewFavorite(
      myServices.sharedPreferences.getString("id")!.toString(),
    );

    statusRequest = handlingData(response);
    log('response: $response');
    if (statusRequest == StatusRequest.success) {
      myCart.addAll(response['data']);
      total = 0.0; // إعادة تعيين الإجمالي
      discount = 0; // إعادة تعيين إجمالي الخصم

      for (int i = 0; i < myCart.length; i++) {
        // Calculate total
        quantity[myCart[i]['cart_itemsid'].toString()] =
            myCart[i]['cart_quantity'];
        total += myCart[i]['cart_quantity'] *
            (myCart[i]['items_price'] *
                (1 - (myCart[i]['items_discount'] / 100)));

        // Calculate total discount
        // discount += myCart[i]['cart_quantity'] *
        //     (myCart[i]['items_price'] * (myCart[i]['items_discount'] / 100));
      }
    }

    update();
  }

  @override
  void onInit() {
    view();
    controllerCoupon = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controllerCoupon.dispose();
  }

  @override
  decrement(String itemsId) {
    if (quantity[itemsId] != null && quantity[itemsId]! > 1) {
      quantity[itemsId] = (quantity[itemsId]! - 1);
      for (var element in myCart) {
        if (element['cart_itemsid'].toString() == itemsId) {
          total -=
              element['items_price'] * (1 - (element['items_discount'] / 100));
        }
      }
    }
    update();
  }

  @override
  increment(String itemsId) {
    if (quantity[itemsId] != null) {
      quantity[itemsId] = (quantity[itemsId]! + 1);
      for (var element in myCart) {
        if (element['cart_itemsid'].toString() == itemsId) {
          total +=
              element['items_price'] * (1 - (element['items_discount'] / 100));
        }
      }
    }
    update();
  }

  @override
  remove(int itemsId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.removeAtCart(
        myServices.sharedPreferences.getString("id")!.toString(),
        itemsId.toString());
    statusRequest = handlingData(response);
    log('response: $response');
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.rawSnackbar(
          message: "Remove Cart Success",
          duration: const Duration(seconds: 1),
        );
      }
    }
    update();
  }

  @override
  applyCoupon() async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.applyCoupon(controllerCoupon.text);
    statusRequest = handlingData(response);
    log('response: $response');

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        couponIsApplied = true;
        couponModel = CouponModel.fromJson(response['data']);
        double couponDiscount = total * (couponModel.couponDiscount! / 100);

        // تحديث إجمالي الخصم
        discount = couponModel.couponDiscount!.toDouble();

        // تحديث الإجمالي بعد تطبيق الكوبون
        total -= couponDiscount;

        update();
        Get.rawSnackbar(
          message: "Coupon Applied",
          duration: const Duration(seconds: 1),
        );
      } else {
        Get.rawSnackbar(
          message: "Coupon Not Applied",
          duration: const Duration(seconds: 1),
        );
      }
    }
  }
}
