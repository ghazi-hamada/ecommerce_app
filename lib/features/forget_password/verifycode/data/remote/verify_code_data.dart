import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/constant/link_apis.dart';

class VerifyCodeData {
  Crud crud;
  VerifyCodeData(this.crud);

  postData(String email, String verifycodr) async {
    var response = await crud.postData(LinkApis.verfiyCodeForgetPassword, {
      "email": email,
      "verifycode": verifycodr,
    });
    return response.fold((l) => l, (r) => r);
  }
}
