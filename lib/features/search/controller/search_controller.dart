import 'package:ecommerce_app/core/class/post_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/status_request.dart';
import '../../../core/constant/app_apis.dart';
import '../../../core/functions/handling_data.dart';
import '../../../routes_app.dart';
import '../../NavigationBar_items/home/data/models/items_model.dart';
import '../../NavigationBar_items/home/data/remote/home_data.dart';

abstract class SearchController extends GetxController {
  clearSearch();
  search({bool isOffers = false,required String search});
  HomeData homeData = HomeData(Get.find());
  PostData postData = PostData(Get.find());

  isSearchingItems(String value);
  goToProductDetails(ItemsModel itemsModel);
  List<ItemsModel> itemsSearch = [];
   bool isSearching = false;
  StatusRequest statusRequest = StatusRequest.none;
}

class SearchControllerImpl extends SearchController {
  @override
  goToProductDetails(ItemsModel itemsModel) {
    Get.toNamed(AppRoutes.kProductDetails,
        arguments: {'itemsmodel': itemsModel});
  }

  @override
  isSearchingItems(String value) {
    itemsSearch.clear();
    isSearching = false;
    update();
  }

  @override
  clearSearch() {
     itemsSearch.clear();
    isSearching = false;
    update();
  }

  @override
  search({bool isOffers = false,required String search}) async {
    print('searching $isOffers');
    isSearching = search.isNotEmpty;
    update();
    statusRequest = StatusRequest.loading;
    var response = await postData.postData(
      linkurl: isOffers ? AppApis.offersSearch : AppApis.search,
      data: {
        'search': search,
      },
    );

    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      response.fold((l) {
        Get.rawSnackbar(
          message: 'No items found',
          duration: const Duration(seconds: 1),
        );
        statusRequest = StatusRequest.failure;
      }, (r) {
        if (r['status'] == 'success') {
          itemsSearch.clear();
          List responseItems = r['data'];
          itemsSearch.addAll(
              responseItems.map((e) => ItemsModel.fromJson(e)).toList());
        }
      });
    }
    update();
  }

 
}
