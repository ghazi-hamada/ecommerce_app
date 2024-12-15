import 'dart:developer';

import '../data/model/coupon_model.dart';
import '../../../../routes_app.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../core/class/status_request.dart';
import '../../../../core/functions/handling_data.dart';
import '../../../../core/services/services.dart';
import '../data/remote/cart_data.dart';

abstract class CartController extends GetxController {
  addItemsCart(String itemsId, int count);
  remove(int itemsId, double price);
  view();
  decrement(String itemsId);
  increment(String itemsId);
  editCart(String itemsId, int count);
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  CartData cartData = CartData(Get.find());
  int count = 1;
  List myCart = [];
  Map<String, int> quantity = {};
  double total = 0.0;
  double subTotal = 0.0;
  double discount = 0.0;
  String couponId = '';
  late TextEditingController controllerCoupon;
  late CouponModel couponModel;
  applyCoupon();
  openCheckoutScreen();
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

    var response = await cartData.viewCart(
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
      }
      subTotal = total; // تحديث الإجمالي الفرعي
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
    print("decrement itemsId: $itemsId quantity: ${quantity[itemsId]}");
    if (quantity[itemsId] != null && quantity[itemsId]! > 1) {
      quantity[itemsId] = (quantity[itemsId]! - 1);
      for (var element in myCart) {
        if (element['cart_itemsid'].toString() == itemsId) {
          total -=
              element['items_price'] * (1 - (element['items_discount'] / 100));
          subTotal -=
              element['items_price'] * (1 - (element['items_discount'] / 100));
        }
      }
      editCart(itemsId, quantity[itemsId]!);
    }
    update();
  }

  @override
  increment(String itemsId) {
    if (quantity[itemsId] != null) {
      print("increment itemsId: $itemsId quantity: ${quantity[itemsId]}");

      quantity[itemsId] = (quantity[itemsId]! + 1);
      for (var element in myCart) {
        if (element['cart_itemsid'].toString() == itemsId) {
          total +=
              element['items_price'] * (1 - (element['items_discount'] / 100));
          subTotal +=
              element['items_price'] * (1 - (element['items_discount'] / 100));
        }
      }
      editCart(itemsId, quantity[itemsId]!);
    }
    update();
  }

  @override
  remove(int itemsId, double price) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartData.removeAtCart(
        myServices.sharedPreferences.getString("id")!.toString(),
        itemsId.toString());
    statusRequest = handlingData(response);
    log('response: $response');
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        print("price: $price");
        total -= price;
        subTotal -= price;

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
        couponId = couponModel.couponId.toString();
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

  @override
  openCheckoutScreen() {
    if (myCart.isNotEmpty) {
      Get.toNamed(AppRoutes.kCheckout, arguments: {
        "couponId": couponId.toString() == '' ? '0' : couponId.toString(),
        "total": subTotal.toString(),
        "discountCoupon": discount.toString(),
      });
    } else {
      Get.rawSnackbar(
        message: "Cart is Empty",
        duration: const Duration(seconds: 1),
      );
    }
  }

  @override
  editCart(String itemsId, int count) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.editCart(
        myServices.sharedPreferences.getString("id")!.toString(),
        itemsId.toString(),
        count.toString());
    statusRequest = handlingData(response);
    log('response: $response');
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.rawSnackbar(
          message: "Edit Cart Success",
          duration: const Duration(seconds: 1),
        );
      }
    }
    update();
  }
}
