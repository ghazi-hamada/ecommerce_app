import 'dart:developer';

import '../../../core/class/status_request.dart';
import '../../../core/constant/app_apis.dart';
import '../../../core/functions/handling_data.dart';
import '../../../core/services/services.dart';
import '../data/model/pending_orders_model.dart';
import '../../../routes_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/post_data.dart';

abstract class OrdersController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  PostData postData = PostData(Get.find());
  List<PendingOrdersModel> pendingOrdersModel = [];
  getData();
  printOrderType(int type);
  printPaymentType(int type);
  printOrderStatus(int type);
  showOrderDetailScreen(PendingOrdersModel pendingOrders);
  deleteOrder(int ordersid);
}

class OrdersControllerImpl extends OrdersController {
  @override
  deleteOrder(ordersid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await postData.postData(
      linkurl: AppApis.orderDelete,
      data: {
        'ordersid': ordersid.toString(),
      },
    );
    statusRequest = handlingData(response);
    log("response: $response");
    log("statusRequest: $statusRequest");
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.snackbar('Success', 'Cancel Order Successfully');
        pendingOrdersModel
            .removeWhere((element) => element.ordersId == ordersid);
      }
    }
    update();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await postData.postData(
      linkurl: AppApis.orderPending,
      data: {
        'usersid': myServices.sharedPreferences.getString('id')!,
      },
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      List listdata = response['data'];
      pendingOrdersModel =
          listdata.map((item) => PendingOrdersModel.fromJson(item)).toList();
      log("pendingOrders: $pendingOrdersModel");
    } else {}
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
  }

  @override
  printOrderType(int type) {
    //0 => delivery ; 1 => Drive Thru
    if (type == 0) {
      return 'Delivery';
    } else {
      return 'Drive Thru';
    }
  }

  @override
  printPaymentType(int type) {
    // 0 => cash; 1 => card;
    if (type == 0) {
      return 'Cash';
    } else {
      return 'Card';
    }
  }

  Color? statusColor;
  @override
  String printOrderStatus(int type) {
    // 0 => pending; 1 => on process; 2 => on delivery; 3 => done;

    if (type == 0) {
      statusColor = Colors.orange; // Pending
      return 'Pending';
    } else if (type == 1) {
      statusColor = Colors.blue; // On Process
      return 'On Process';
    } else if (type == 2) {
      statusColor = Colors.purple; // On Delivery
      return 'On Delivery';
    } else {
      statusColor = Colors.green; // Done
      return 'Done';
    }
  }

  @override
  showOrderDetailScreen(PendingOrdersModel pendingOrders) {
    Get.toNamed(AppRoutes.korderDetails,
        arguments: {"pendingOrdersModel": pendingOrders});
  }
}
