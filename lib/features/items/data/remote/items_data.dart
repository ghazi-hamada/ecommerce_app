import '../../../../core/class/crud.dart';
import '../../../../core/constant/app_apis.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);
  getData({required String id, required String userId}) async {
    var response = await crud.postData(AppApis.items, {
      'id': id,
      'usersid': userId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
