import 'dart:developer';

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
      // code for calculate total
      for (int i = 0; i < myCart.length; i++) {
        //map for quantity
        quantity[myCart[i]['cart_itemsid'].toString()] =
            myCart[i]['cart_quantity'];
        //calculate total
        total += myCart[i]['cart_quantity'] *
            (myCart[i]['items_price'] *
                (1 - (myCart[i]['items_discount'] / 100)));
      }
    }

    update();
  }

  @override
  void onInit() {
    view();
    super.onInit();
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
}
