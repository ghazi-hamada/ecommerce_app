import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/constant/app_apis.dart';

class VerifyCodeData {
  Crud crud;
  VerifyCodeData(this.crud);

  postData(String email, String verifycodr) async {
    var response = await crud.postData(AppApis.verfiyCodeForgetPassword, {
      "email": email,
      "verifycode": verifycodr,
    });
    return response.fold((l) => l, (r) => r);
  }
}
