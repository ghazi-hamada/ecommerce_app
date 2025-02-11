import 'dart:developer';

import 'package:ecommerce_app/features/address/controller/address_view_controller.dart';

import '../../../core/class/status_request.dart';
import '../../../core/functions/handling_data.dart';
import '../../../core/services/services.dart';
import '../../../routes_app.dart';
import '../data/remote/addres_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AddressAddDetailsController extends GetxController {
  String? lat;
  String? long;
  String? userid;
  late TextEditingController nameController;
  late TextEditingController cityController;
  late TextEditingController streetController;
  final formKey = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  AddressData addressData = AddressData(Get.find());
  intialData();
  saveAddress();
}

class AddressAddDetailsControllerImpl extends AddressAddDetailsController {
  @override
  intialData() {
    lat = Get.arguments['lat'];
    long = Get.arguments['long'];
    userid = myServices.sharedPreferences.getString("id");
    nameController = TextEditingController();
    cityController = TextEditingController();
    streetController = TextEditingController();
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    intialData();
  }

  @override
  saveAddress() async {
    if (formKey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      // add request here to add address
      var response = await addressData.addAddress(
          myServices.sharedPreferences.getString("id")!,
          nameController.text,
          cityController.text,
          streetController.text,
          lat!,
          long!);
      // handling response
      statusRequest = handlingData(response);
      log('Status Request: $statusRequest');
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          AddressViewControllerImpl addressViewControllerImpl =
              Get.find<AddressViewControllerImpl>();
          addressViewControllerImpl.viewData();
          Get.back();
          Get.back();

          Get.rawSnackbar(
            message: "Add Address Success",
            duration: const Duration(seconds: 1),
          );
        }
      } else {
        Get.rawSnackbar(
          message: "Add Address Failure",
          borderColor: Colors.red,
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 1),
        );
        statusRequest = StatusRequest.failure;
      }
      update();
    }
  }
}
