import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/constant/link_apis.dart';

class VerifyCodeSignupData {
  Crud crud;
  VerifyCodeSignupData(this.crud);

  postData(String email, String verifycodr) async {
    var response = await crud.postData(LinkApis.verfiycodeSignup, {
      "email": email,
      "verifycode": verifycodr,
    });
    return response.fold((l) => l, (r) => r);
  }
}
