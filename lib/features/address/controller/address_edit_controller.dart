import 'dart:developer';

import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/functions/handling_data.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/features/address/data/model/address_model.dart';
import 'package:ecommerce_app/features/address/data/remote/addres_data.dart';
 import 'package:flutter/material.dart';
import 'package:get/get.dart';
 
abstract class AddressEditController extends GetxController {
  String addressid = "";
  String name = "";
  String city = "";
  String street = "";
  String lat = "";
  String long = "";
  late AddressModel addressModel;
  AddressData addressData = AddressData(Get.find());
  MyServices myServices = Get.find();
  late TextEditingController nameController;
  late TextEditingController cityController;
  late TextEditingController streetController;
  StatusRequest statusRequest = StatusRequest.none;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  saveAddress();
}

class AddressEditControllerImpl extends AddressEditController {
  @override
  void onInit() {
    super.onInit();
    addressModel = Get.arguments['addressModel'];
    addressid = addressModel.id.toString();
    name = addressModel.addressName.toString();
    city = addressModel.addressCity.toString();
    street = addressModel.addressStreet.toString();
    lat = addressModel.addressLat.toString();
    long = addressModel.addressLong.toString();

    nameController = TextEditingController(text: name);
    cityController = TextEditingController(text: city);
    streetController = TextEditingController(text: street);
  }

  @override
  saveAddress() async {
    if (formKey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      // add request here to add address
      var response = await addressData.editAddress(
          addressid,
          nameController.text,
          cityController.text,
          streetController.text,
          lat,
          long);
      // handling response
      statusRequest = handlingData(response);
      log('Status Request: $statusRequest');
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offAllNamed("/");
          Get.rawSnackbar(
            message: "Edit Address Success",
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
