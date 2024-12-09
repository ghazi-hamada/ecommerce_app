import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/features/address/data/model/address_model.dart';
import 'package:ecommerce_app/features/address/data/remote/addres_data.dart';
import 'package:get/get.dart';

abstract class CheckoutController extends GetxController {
  String? paymentMethod;
  String? deliveryType;
  String? selectedAddress;
  AddressData addressData = AddressData(Get.find());
  MyServices myServices = Get.find();

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
  checkout() {
    if (paymentMethod == null ||
        deliveryType == null ||
        selectedAddress == null) {
      Get.snackbar("خطأ", "الرجاء اختيار جميع الخيارات");
    } else {
      print("طريقة الدفع: $paymentMethod");
      print("نوع التوصيل: $deliveryType");
      print("العنوان: $selectedAddress");
    }
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
  }
}
