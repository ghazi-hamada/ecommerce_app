import 'package:ecommerce_app/core/class/post_data.dart';
import 'package:flutter/material.dart';
import 'package:googleapis/blogger/v3.dart';

import '../../../core/class/status_request.dart';
import '../../../core/constant/app_apis.dart';
import '../../../core/functions/handling_data.dart';
import '../../../core/services/services.dart';
import '../../NavigationBar_items/cart/controller/cart_controller.dart';
import '../../NavigationBar_items/home/data/models/items_model.dart';
import '../data/remote/items_data.dart';
import '../../../routes_app.dart';
import 'package:get/get.dart';

abstract class ItemsController extends GetxController {
  TextEditingController searchController = TextEditingController();
  changeItemCategories(int index);
  getItems();
  showProductDetails(ItemsModel itemsModel);
  // Check if the product is in the cart
  late List categoriesModel;
  late int categoriesId;
  ItemsData itemsData = ItemsData(Get.find());
  PostData postData = PostData(Get.find());
  List categories = [];
  List items = [];
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;
}

class ItemsControllerImpl extends ItemsController {
  final CartControllerImp cartControllerCart = Get.put(CartControllerImp());
  @override
  getItems() async {
    items.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await postData.postData(linkurl: AppApis.items, data: {
      'id': categoriesId.toString(),
      'usersid': myServices.sharedPreferences.getString('id')!,
    });

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      response.fold((l) {
        statusRequest = StatusRequest.failure;
        update();
      }, (r) {
        if (r['status'] == "success") {
          items.addAll(r['data']);
          statusRequest = StatusRequest.none;
        }
      });
    }

    update();
  }

  @override
  void onInit() async {
    //get data from arguments
    categoriesModel = Get.arguments['categories'];
    categoriesId = Get.arguments['categorySelected'];
    searchController = TextEditingController();
    getItems();

    super.onInit();
  }

  @override
  changeItemCategories(int index) {
    categoriesId = index;
    getItems();
    update();
  }

  @override
  showProductDetails(ItemsModel itemsModel) async {
    var result = await Get.toNamed(AppRoutes.kProductDetails, arguments: {
      'itemsmodel': itemsModel,
    });
    // إذا عادت النتيجة بنجاح، قم بتحديث البيانات
    if (result != null && result == true) {
      getItems(); // استدعاء دالة لتحديث حالة العناصر
    }
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
