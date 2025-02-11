import 'package:ecommerce_app/routes_app.dart';

import '../../../../core/class/status_request.dart';
import '../../../../core/services/services.dart';
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

  logoutuser() async {
    statusRequest = StatusRequest.loading;
    myServices.sharedPreferences.clear();
    statusRequest = StatusRequest.none;
    Get.offAllNamed(AppRoutes.kLogin);
  }
}
