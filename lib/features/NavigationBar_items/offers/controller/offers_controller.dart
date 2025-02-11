import 'package:ecommerce_app/core/class/post_data.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:googleapis/gkehub/v1.dart';

import '../../../../core/class/status_request.dart';
import '../../../../core/constant/app_apis.dart';
import '../../../../core/functions/handling_data.dart';
import '../../../../routes_app.dart';
import '../../home/data/models/items_model.dart';
import '../data/model/offer_model.dart';

abstract class OffersController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  List<OfferModel> offers = [];
  PostData postData = PostData(Get.find());
  MyServices myServices = Get.find();
  getOffers();
      TextEditingController searchController = TextEditingController();

  addtocart(OfferModel offer);
}

class OffersControllerImp extends OffersController {
  @override
  getOffers() async {
    offers = [];
    statusRequest = StatusRequest.loading;
    update();
    var response = await postData.postData(linkurl: AppApis.offers, data: {});
    statusRequest = handlingData(response);
    print('response: $response');
    response.fold(
      (l) {
        offers = [];
        statusRequest = StatusRequest.failure;
        update();
      },
      (r) {
        if (StatusRequest.success == statusRequest &&
        r ['status'] == 'success') {
      List<dynamic> data = r ['data'];
      offers.addAll(data.map((e) => OfferModel.fromJson(e)).toList());
      statusRequest = StatusRequest.none;
      update();
    }
      },
    ); 
  }

  @override
  void onInit() {
    super.onInit();
    searchController = TextEditingController();
    getOffers();
  }
    @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    searchController.dispose();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  addtocart(OfferModel offer) async {
    ItemsModel itemDetails = ItemsModel.fromJson(offer.toJson());
    var result = await Get.toNamed(AppRoutes.kProductDetails,
        arguments: {'itemsmodel': itemDetails});

    if (result != null && result == true) {
      getOffers();
    }
  }
}
