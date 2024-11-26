import 'package:ecommerce_app/core/routing/routes_app.dart';
import 'package:get/get.dart';

// ignore: camel_case_types
abstract class verifyCodeSignUpController extends GetxController {
  checkCode();
  goTOsuccessSignup(String verifyCode);
}

// ignore: camel_case_types
class verifyCodeSignUpControllerImp extends verifyCodeSignUpController {
  String? email;

  @override
  goTOsuccessSignup(String verifyCode) async {
    Get.toNamed(AppRoutes.kSuccessSignup);
  }

// ghazihamada7@gmail.com
  @override
  checkCode() {
    // TODO: implement checkCode
    throw UnimplementedError();
  }
}
