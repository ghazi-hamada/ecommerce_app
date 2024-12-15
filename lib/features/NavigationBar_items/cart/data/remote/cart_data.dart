import 'dart:developer';

import '../../../../../core/class/crud.dart';
import '../../../../../core/constant/app_apis.dart';
import '../../../../../core/services/services.dart';
import 'package:get/get.dart';

class CartData {
  Crud crud;
  CartData(this.crud);
  addData(String userId, String itemsId, String cartQuantity) async {
    MyServices myServices = Get.find();

    log("Sending Data: usersid=${myServices.sharedPreferences.getString("id")!.toString()}, itemsid=${itemsId.toString()}, cartQuantity=$cartQuantity");

    var response = await crud.postData(AppApis.cartAdd, {
      "usersid": userId.toString(),
      "itemsid": itemsId.toString(),
      "cartQuantity": cartQuantity.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  removeAtCart(String userId, String itemsId) async {
    var response = await crud.postData(AppApis.cartRemove, {
      "usersid": userId.toString(),
      "itemsid": itemsId.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  viewCart(String userId) async {
    var response = await crud.postData(AppApis.cartView, {
      "id": userId,
    });
    return response.fold((l) => l, (r) => r);
  }

  applyCoupon(String coupon) async {
    var response = await crud.postData(AppApis.checkCoupon, {
      "coupon": coupon,
    });
    return response.fold((l) => l, (r) => r);
  }

  editCart(String userId, String itemsId, String cartQuantity) async {
    var response = await crud.postData(AppApis.cartEdit, {
      "usersid": userId.toString(),
      "itemsid": itemsId.toString(),
      "cartQuantity": cartQuantity.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
