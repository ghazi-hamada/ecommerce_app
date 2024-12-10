import '../../../../../core/class/crud.dart';
import '../../../../../core/constant/app_apis.dart';

class VerifyCodeSignupData {
  Crud crud;
  VerifyCodeSignupData(this.crud);

  postData(String email, String verifycodr) async {
    var response = await crud.postData(AppApis.verifyCodeSignUp, {
      "email": email,
      "verifycode": verifycodr,
    });
    return response.fold((l) => l, (r) => r);
  }

  Future resendCode(String email) async {
    return await crud.postData(AppApis.verifyCodeLogin, {
      'email': email,
    });
  }
}
