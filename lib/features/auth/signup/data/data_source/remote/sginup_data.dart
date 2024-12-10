import '../../../../../../core/class/crud.dart';
import '../../../../../../core/constant/app_apis.dart';

class SginupData {
  Crud crud;
  SginupData(this.crud);

  postData(Map data) async {
    var response = await crud.postData(AppApis.signUp , data);
    return response.fold((l) => l, (r) => r);
  }
}
