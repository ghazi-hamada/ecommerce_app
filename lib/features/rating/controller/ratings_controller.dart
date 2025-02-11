import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/post_data.dart';
import '../../../core/class/status_request.dart';
import '../../../core/constant/app_apis.dart';
import '../../../core/functions/handling_data.dart';
import '../../../core/services/services.dart';
import '../../orders/data/model/pending_orders_model.dart';
import '../../orders_details/data/model/order_details_model.dart';

abstract class RatingsController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  late PendingOrdersModel pendingOrders;
  PostData postData = PostData(Get.find());
  MyServices myServices = Get.find();
  List<OrderDetailsModel> orderDetailsModel = [];
  Map<String, double> rating = {};
  String reviewNote = '';
  getItemsforRating();
  setRating(rate, index);
  setReview(review);
  sendReview(int id);
}

class RatingsControllerImpl extends RatingsController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    pendingOrders = Get.arguments['pendingOrdersModel'];
    getItemsforRating();
  }

  @override
  getItemsforRating() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await postData.postData(
      linkurl: AppApis.orderDetails,
      data: {
        'cartOrders': pendingOrders.ordersId.toString(),
        'usersid': myServices.sharedPreferences.getString('id').toString(),
      },
    );
    statusRequest = handlingData(response);
    log("================================response: $statusRequest");
    update();
    if (StatusRequest.success == statusRequest) {
      response.fold(
        (l) {
          statusRequest = StatusRequest.failure;
          update();
        },
        (r) {
          if (r['status'] == 'success') {
            orderDetailsModel = List<OrderDetailsModel>.from(
                r['data'].map((x) => OrderDetailsModel.fromJson(x)));
            rating.addAll(
                {for (var e in orderDetailsModel) e.itemsId.toString(): 0.0});
            log("orderDetailsModel: ${orderDetailsModel.length}");
          }
        },
      );
    }
    update();
  }

  @override
  setRating(rate, index) {
    rating['${orderDetailsModel[index].itemsId}'] = rate;
    print("rating: $rating");
    update();
  }

  @override
  setReview(review) {
    reviewNote = review;
    print("review: $reviewNote");
    update();
  }

  @override
  sendReview(int id) async {
    if (rating['$id'] != 0.0) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await postData.postData(
        linkurl: AppApis.rating,
        data: {
          "usersid": myServices.sharedPreferences.getString('id').toString(),
          "itemsid": id.toString(),
          "ratingValue": rating['$id'].toString(),
          "ratingreview": reviewNote.toString(),
        },
      );
      statusRequest = handlingData(response);
      update();
      if (StatusRequest.success == statusRequest) {
        response.fold(
          (l) {
            Get.snackbar('Error', 'Rating not added');
          },
          (response) {
            if (response['status'] == 'success') {
              orderDetailsModel.removeAt(orderDetailsModel
                  .indexWhere((element) => element.itemsId == id));

              Get.snackbar('Success', 'Rating added successfully');
            }
          },
        );
      }
    } else {
      Get.snackbar('Error', 'Please rate the item');
    }
  }
}
