import 'dart:developer';

import '../../../core/class/status_request.dart';
import '../../../core/functions/handling_data.dart';
import '../../../core/services/services.dart';
import '../../NavigationBar_items/home/data/models/items_model.dart';
import '../data/remote/favorite_dart.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  Map<String, dynamic> isFavorite = {};
  FavoriteData favoriteData = FavoriteData(Get.find());

  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  setFavorite(id, ItemsModel itemsModel) {
    if (isFavorite["${itemsModel.itemsId}"] == '1') {
      removeFavorite("${itemsModel.itemsId!}");
      isFavorite[id.toString()] = '0';
    } else if (isFavorite["${itemsModel.itemsId}"] == '0') {
      addFavorite("${itemsModel.itemsId!}");
      isFavorite[id.toString()] = '1';
    }
    update();
  }

  addFavorite(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await favoriteData.addFavorite(
      itemsid: itemsid,
      usersid: myServices.sharedPreferences.getString('id')!,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      log("response $response");
      if (response['status'] == "success") {
        Get.rawSnackbar(
          message: "Add Favorite Success",
          duration: const Duration(seconds: 1),
        );
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  removeFavorite(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await favoriteData.removeFavorite(
      itemsid: itemsid,
      usersid: myServices.sharedPreferences.getString('id')!,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      log("response $response");
      if (response['status'] == "success") {
        Get.rawSnackbar(
          message: "Remove Favorite Success",
          duration: const Duration(seconds: 1),
        );
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }
}
