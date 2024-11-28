import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/constant/link_apis.dart';

class ResetPasswordData {
  Crud crud;
  ResetPasswordData(this.crud);

  postdata(String email, String password) async {
    var response = await crud.postData(
        LinkApis.resetPassword, {"email": email, "password": password});
    return response.fold((l) => l, (r) => r);
  }
}