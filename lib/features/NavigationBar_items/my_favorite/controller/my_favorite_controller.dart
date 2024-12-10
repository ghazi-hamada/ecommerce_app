import 'dart:developer';

import '../../../../core/class/status_request.dart';
import '../../../../core/functions/handling_data.dart';
import '../../../../core/services/services.dart';
import '../../cart/controller/cart_controller.dart';
import '../../home/data/models/items_model.dart';
import '../data/model/my_fevorite_model.dart';
import '../data/remote/favorite_data.dart';
import '../../../../routes_app.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

abstract class MyFavoriteController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  List<MyFavoriteModel> myFavorite = [];
  MyServices myServices = Get.find();
  MyFavoriteData myFavoriteData = MyFavoriteData(Get.find());
  showProductDetails(MyFavoriteModel itemsModel);
  getMyFavorite();
  deleteItemFromFavorite(int id);
  // Check if the product is in the cart
  isProductInCart(int itemsId);
}

class MyFavoriteControllerImpl extends MyFavoriteController {
  final controllerCart = Get.put(CartControllerImp());
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

  @override
  deleteItemFromFavorite(id) async {
    myFavorite.removeWhere((element) => element.favoriteId == id);
    Get.rawSnackbar(
      message: "remove Favorite Success",
      duration: const Duration(seconds: 1),
    );
    update();
    var response = await myFavoriteData.removeFavorite(id);
    statusRequest = handlingData(response);
    print("response $response");
    print("statusRequest $statusRequest");

    update();
  }

  @override
  bool isProductInCart(int itemsId) {
    return controllerCart.myCart
        .any((element) => element['items_id'] == itemsId);
  }

  @override
  showProductDetails(MyFavoriteModel itemsModel) {
    Get.toNamed(AppRoutes.kProductDetails,
        arguments: {'itemsmodel': itemsModel as ItemsModel});
  }
}
