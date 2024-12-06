import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/constant/app_apis.dart';

class VerifyCodeLoginData {
  Crud crud;
  VerifyCodeLoginData(this.crud);
  Future postDataSendVerifyCode(String email) async {
    return await crud.postData(AppApis.verifyCodeLogin  , {
      'email': email,
    });
  }

  postData(String email, String verifycode) async {
    var response = await crud.postData(AppApis.verifyCodeSignUp , {
      "email": email,
      "verifycode": verifycode,
    });
    return response.fold((l) => l, (r) => r);
  }
}
