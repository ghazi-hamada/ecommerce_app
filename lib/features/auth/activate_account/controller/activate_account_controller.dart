import '../../../../routes_app.dart';
import 'package:get/get.dart';

abstract class ActivateAccountController extends GetxController {
  verifyNow();
}

class ActivateAccountControllerImpl extends ActivateAccountController {
  String? email;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    email = Get.arguments['email'];
  }

  @override
  verifyNow() {
    print("email $email");
    Get.offNamed(AppRoutes.kVerfiyCodesignup, arguments: {"email": email});
  }
}
