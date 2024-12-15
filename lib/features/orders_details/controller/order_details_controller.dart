import 'dart:async';
import 'dart:developer';

import '../../../core/class/post_data.dart';
import '../../../core/class/status_request.dart';
import '../../../core/constant/app_apis.dart';
import '../../../core/functions/handling_data.dart';
import '../../../core/services/services.dart';
import '../../orders/data/model/pending_orders_model.dart';
import '../data/model/order_details_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class OrderDetailsController extends GetxController {
  PostData postData = PostData(Get.find());
  MyServices myServices = Get.find();
  Completer<GoogleMapController>? completercontroller;
  Position? position;
  StatusRequest statusRequest = StatusRequest.loading;
  CameraPosition? cameraPosition;
  List<Marker> markers = <Marker>[];
  List<OrderDetailsModel> orderDetailsModel = [];
  late PendingOrdersModel pendingOrders;
  double? lat;
  double? long;
  intialData();
  getDetailsData();
 }

class OrderDetailsControllerImpl extends OrderDetailsController {
  @override
  intialData() {
    if (pendingOrders.ordersType == 0) {
      cameraPosition = CameraPosition(
        target: LatLng(double.parse(pendingOrders.addressLat!),
            double.parse(pendingOrders.addressLong!)),
        zoom: 14.4746,
      );
      markers.add(
        Marker(
          markerId: const MarkerId('1'),
          position: LatLng(double.parse(pendingOrders.addressLat!),
              double.parse(pendingOrders.addressLong!)),
        ),
      );
    }
  }

  @override
  void onInit() {
    pendingOrders = Get.arguments['pendingOrdersModel'];
    // TODO: implement onInit
    super.onInit();
    getDetailsData();
    intialData();
    log("orderDetailsModel: $orderDetailsModel");
    log("orderDetailsModel: ${orderDetailsModel.length}");
  }

  @override
  getDetailsData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await postData.postData(
      linkurl: AppApis.orderDetails,
      data: {
        'cartOrders': pendingOrders.ordersId.toString(),
      },
    );
    statusRequest = handlingData(response);
    log("================================response: $statusRequest");
    update();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        orderDetailsModel = List<OrderDetailsModel>.from(
            response['data'].map((x) => OrderDetailsModel.fromJson(x)));
        log("orderDetailsModel: $orderDetailsModel");
        log("orderDetailsModel: ${orderDetailsModel.length}");
      } else {}
    }
    update();
  }


}
