import '../../../../../core/class/crud.dart';
import '../../../../../core/constant/app_apis.dart';

class TestData {
  Crud crud;
  TestData(this.crud);

  getData() async {
    var response = await crud.postData(AppApis.test, {});
    return response.fold((l) => l, (r) => r);
  }
}
