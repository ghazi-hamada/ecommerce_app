import 'package:dartz/dartz.dart';
import '../../../core/class/status_request.dart';
import '../../../core/functions/handling_data.dart';
import '../../../core/services/services.dart';
import '../../address/data/model/address_model.dart';
import '../../address/data/remote/addres_data.dart';
import '../data/remote/orders_data.dart';
import 'package:get/get.dart';

abstract class CheckoutController extends GetxController {
  String? paymentMethod;
  String? deliveryType;
  String? selectedAddress;
  String? couponId;
  String? totalPrice;
  AddressData addressData = AddressData(Get.find());
  OrdersData ordersData = OrdersData(Get.find());
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;

  // قائمة العناوين (سوف يتم جلبها من قاعدة البيانات)
  List<AddressModel> addresses = [];
  getAddresses();
  checkout();
  changePaymentMethod(String value);
  changeDeliveryType(String value);
  changeSelectedAddress(String value);
}

class CheckoutControllerImp extends CheckoutController {
  @override
  checkout() async {
    statusRequest = StatusRequest.loading;
    update();

    if (paymentMethod == null || deliveryType == null) {
      Get.snackbar("خطاء", "يجب اختيار طريقة الدفع ونوع التوصيل");
    } else {
      if (deliveryType == "Delivery" && selectedAddress == null) {
        Get.snackbar("خطأ", "يجب اختيار عنوان التوصيل");
      } else {
        selectedAddress = "0";
        var response = await ordersData.checkout(
          addressid: selectedAddress!,
          orderstype: deliveryType == "Delivery" ? "0" : "1",
          pricedelivery: "10",
          ordersprice: totalPrice!,
          couponid: couponId!,
          orderPaymentMethod: paymentMethod == "Cash" ? "0" : "1",
          usersid: myServices.sharedPreferences.getString("id")!,
        );
        statusRequest = handlingData(response);
        if (StatusRequest.success == statusRequest) {
          if (response['status'] == 'success') {
            Get.offNamed("/");
          } else {
            Get.snackbar("خطأ", "حدث خطأ أثناء عملية الدفع");
          }
        }
      }
    }
    update();
  }

  @override
  changePaymentMethod(String value) {
    paymentMethod = value;
    update();
  }

  @override
  changeDeliveryType(String value) {
    deliveryType = value;
    update();
  }

  @override
  changeSelectedAddress(String value) {
    selectedAddress = value;
    print(value);
    update();
  }

  @override
  getAddresses() async {
    update();
    var response = await addressData
        .viewAddress(myServices.sharedPreferences.getString("id")!);
    if (response['status'] == 'success') {
      List listdata = response['data'];
      addresses.addAll(listdata.map((e) => AddressModel.fromJson(e)).toList());
    } else {
      Get.snackbar("خطأ", "حدث خطأ أثناء جلب العناوين");
    }
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAddresses();
    couponId = Get.arguments["couponId"].toString();
    totalPrice = Get.arguments["total"].toString();
  }
}
