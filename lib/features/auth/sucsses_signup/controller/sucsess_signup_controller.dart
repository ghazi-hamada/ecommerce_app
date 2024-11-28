import 'package:ecommerce_app/routes_app.dart';
import 'package:get/get.dart';

abstract class SuccessSignupController extends GetxController {
  gotologin();
}

class SuccessSignupControllerImp extends SuccessSignupController {
  // VerifyCodeSignupData verifyCodeSignupData = VerifyCodeSignupData(Get.find());
  String? email;

  @override
  gotologin() {
    Get.offAllNamed(AppRoutes.kLogin);
  }
}
