import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/constant/app_apis.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);

  postData(String email, String password) async {
    var response = await crud.postData(AppApis.login, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
