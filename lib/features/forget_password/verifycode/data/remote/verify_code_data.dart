import '../../../../../core/class/crud.dart';
import '../../../../../core/constant/app_apis.dart';

class VerifyCodeData {
  Crud crud;
  VerifyCodeData(this.crud);

  postData(String email, String verifycodr) async {
    var response = await crud.postData(AppApis.verifyCodeForgetPassword, {
      "email": email,
      "verifycode": verifycodr,
    });
    return response.fold((l) => l, (r) => r);
  }
}
