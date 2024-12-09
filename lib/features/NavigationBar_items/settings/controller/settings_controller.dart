import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  String username = '';
  String email = '';
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initialData();
  }

  initialData() {
    statusRequest = StatusRequest.loading;
    username = myServices.sharedPreferences.getString('username') ?? '';
    email = myServices.sharedPreferences.getString('email') ?? '';
    statusRequest = StatusRequest.none;
    update();
  }
}
