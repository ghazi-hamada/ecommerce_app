import 'dart:developer';

import '../../../core/class/status_request.dart';
import '../../../core/functions/handling_data.dart';
import '../../../core/services/services.dart';
import '../../NavigationBar_items/cart/controller/cart_controller.dart';
import '../../NavigationBar_items/cart/data/remote/cart_data.dart';
import '../../NavigationBar_items/home/data/models/items_model.dart';
import '../../../routes_app.dart';
import 'package:get/get.dart';

abstract class ProductDetailsController extends GetxController {
  intialData();
  increment();
  decrement();
  addItemsCart(String itemsId, int count);
  late ItemsModel itemsModel;
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  CartData cartData = CartData(Get.find());
}

class ProductDetailsControllerImpl extends ProductDetailsController {
  int count = 1;
  @override
  intialData() {
    itemsModel = Get.arguments['itemsmodel'];
  }

  List subItems = [
    {"name": "red", "id": 1, "active": '1'},
    {"name": "white", "id": 2, "active": '0'},
    {"name": "black", "id": 3, "active": '0'},
  ];
  @override
  void onInit() {
    intialData();
    super.onInit();
  }

  @override
  decrement() {
    if (count > 1) {
      count--;
      update();
    }
  }

  @override
  increment() {
    count++;
    update();
  }

  @override
  addItemsCart(String itemsId, int count) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartData.addData(
      myServices.sharedPreferences.getString("id")!.toString(),
      itemsId.toString(),
      count.toString(),
    );
    Get.back();

    statusRequest = handlingData(response);
    log('response: $response');

    update();
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.rawSnackbar(
          message: "Add Cart Success",
          duration: const Duration(seconds: 1),
        );
        Get.back();
      }
    }
  }
}
