import '../../../../../core/class/crud.dart';
import '../../../../../core/constant/app_apis.dart';

class ForgetPasswordData {
  Crud crud;
  ForgetPasswordData(this.crud);

  postData(String email) async {
    var response = await crud.postData(AppApis.checkEmail, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
