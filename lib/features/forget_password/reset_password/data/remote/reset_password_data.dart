import '../../../../../core/class/crud.dart';
import '../../../../../core/constant/app_apis.dart';

class ResetPasswordData {
  Crud crud;
  ResetPasswordData(this.crud);

  postdata(String email, String password) async {
    var response = await crud.postData(
        AppApis.resetPassword, {"email": email, "password": password});
    return response.fold((l) => l, (r) => r);
  }
}
