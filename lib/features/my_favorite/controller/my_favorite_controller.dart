import 'dart:developer';

import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/functions/handling_data.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/features/my_favorite/data/model/my_fevorite_model.dart';
import 'package:ecommerce_app/features/my_favorite/data/remote/favorite_data.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

abstract class MyFavoriteController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  List<MyFavoriteModel> myFavorite = [];
  MyServices myServices = Get.find();
  MyFavoriteData myFavoriteData = MyFavoriteData(Get.find());

  getMyFavorite();
}

class MyFavoriteControllerImpl extends MyFavoriteController {
  @override
  getMyFavorite() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await myFavoriteData.getdata(
      myServices.sharedPreferences.getString('id'),
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      log("response $response");
      if (response['status'] == "success") {
        List<dynamic> data = response['data'];

        myFavorite
            .addAll(data.map((e) => MyFavoriteModel.fromJson(e)).toList());

        log("myFavorite $myFavorite");
        statusRequest = StatusRequest.none;
        update();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getMyFavorite();
  }
}
