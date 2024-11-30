import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/constant/app_apis.dart';

class TestData {
  Crud crud;
  TestData(this.crud);

  getData() async {
    var response = await crud.postData(AppApis.test, {});
    return response.fold((l) => l, (r) => r);
  }
}
