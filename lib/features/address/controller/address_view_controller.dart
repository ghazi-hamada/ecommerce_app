import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/functions/handling_data.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/features/address/data/model/address_model.dart';
import 'package:ecommerce_app/features/address/data/remote/addres_data.dart';
import 'package:ecommerce_app/features/address/data/remote/address_delete_data.dart';
import 'package:ecommerce_app/features/address/data/remote/address_view_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AddressViewController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  AddressViewData addressViewData = AddressViewData(Get.find());
  AddressData addressData = AddressData(Get.find());
  List<AddressModel> address = [];
  viewData();
  deleteAddress(int id);
  confirmDismissalOutcome(DismissDirection direction);
}

class AddressViewControllerImpl extends AddressViewController {
  @override
  viewData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData
        .viewAddress(myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List listdata = response['data'];
        address.addAll(listdata.map((e) => AddressModel.fromJson(e)).toList());
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
    viewData();
  }

  @override
  deleteAddress(int id) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.deleteAddress(id.toString());
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        address.removeWhere((element) => element.id == id);
        Get.snackbar("Success", "Address deleted successfully");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  Future<bool> confirmDismissalOutcome(direction) async {
    // إظهار مربع الحوار قبل تأكيد الحذف
    bool? confirm = await Get.defaultDialog<bool>(
      title: "Delete Address",
      middleTextStyle: const TextStyle(fontWeight: FontWeight.bold),
      middleText: "Are you sure you want to delete this address?",
      actions: [
        MaterialButton(
          onPressed: () {
            Get.back(result: true); // الموافقة على الحذف
          },
          child: const Text(
            "Yes",
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
        MaterialButton(
          onPressed: () {
            Get.back(result: false); // إلغاء الحذف
          },
          child: const Text(
            "Cancel",
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
    return confirm ?? false; // يتم الحذف فقط إذا أكد المستخدم.
  }
}
