import 'dart:developer';

import 'package:ecommerce_app/features/NavigationBar_items/cart/data/model/mycart_model.dart';

import '../data/model/coupon_model.dart';
import '../../../../routes_app.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../core/class/status_request.dart';
import '../../../../core/functions/handling_data.dart';
import '../../../../core/services/services.dart';
import '../data/remote/cart_data.dart';

abstract class CartController extends GetxController {
  remove(int itemsId, double price);
  view();
  decrement(String itemsId);
  increment(String itemsId);
  editCart(String itemsId, int count);
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  CartData cartData = CartData(Get.find());
  int count = 1;
    List<MycartModel> myCart =[];
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
  view() async {
    myCart.clear();
     statusRequest = StatusRequest.loading;
    update();

    var response = await cartData.viewCart(
      myServices.sharedPreferences.getString("id")!.toString(),
    );

    statusRequest = handlingData(response);
    log('response: $response');
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        List data = response['data'];
        myCart.addAll(data.map((e) => MycartModel.fromJson(e)).toList());
        total = 0.0; // إعادة تعيين الإجمالي
        discount = 0; // إعادة تعيين إجمالي الخصم

        for (int i = 0; i < myCart.length; i++) {
          // Calculate total
          quantity[myCart[i].itemsId.toString()] =
              myCart[i].cartQuantity!;
          total += (myCart[i].cartQuantity! *
              (myCart[i].itemsPrice! *
                  (1 - (myCart[i].itemsDiscount! / 100))))!;
        }
        subTotal = total; // تحديث الإجمالي الفرعي
      } else {
        statusRequest = StatusRequest.none;
        update();
      }
    }

    update();
  }

  @override
  void onInit() {
    view();
    controllerCoupon = TextEditingController();
    print("CartControllerImp onInit called");
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    print("CartControllerImp onReady called");
  }

  @override
  void onClose() {
    super.onClose();
    print("CartControllerImp onClose called");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Get.delete<CartControllerImp>(); // التخلص من الـ Controller عند الخروج

    controllerCoupon.dispose();
  }

  @override
  decrement(String itemsId) {
    print("decrement itemsId: $itemsId quantity: ${quantity[itemsId]}");
    if (quantity[itemsId] != null && quantity[itemsId]! > 1) {
      quantity[itemsId] = (quantity[itemsId]! - 1);
      for (var element in myCart) {
        if (element.itemsId.toString() == itemsId) {
          total -=
              element.itemsPrice! * (1 - (element.itemsDiscount! / 100));
          subTotal -=
              element.itemsPrice! * (1 - (element.itemsDiscount! / 100));
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
        if (element.itemsId.toString() == itemsId) {
          total +=
              element.itemsPrice! * (1 - (element.itemsDiscount! / 100));
          subTotal +=
              element.itemsPrice! * (1 - (element.itemsDiscount! / 100));
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
