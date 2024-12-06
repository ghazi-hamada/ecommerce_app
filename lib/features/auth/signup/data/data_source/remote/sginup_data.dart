import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/constant/app_apis.dart';

class SginupData {
  Crud crud;
  SginupData(this.crud);

  postData(Map data) async {
    var response = await crud.postData(AppApis.signUp , data);
    return response.fold((l) => l, (r) => r);
  }
}
