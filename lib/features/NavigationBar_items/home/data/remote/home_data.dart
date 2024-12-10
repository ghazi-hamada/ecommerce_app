import '../../../../../core/class/crud.dart';
import '../../../../../core/constant/app_apis.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);

  getData() async {
    var response = await crud.postData(AppApis.homepage, {});
    return response.fold((l) => l, (r) => r);
  }

  searchData(String search) async {
    var response = await crud.postData(AppApis.search, {'search': search});
    return response.fold((l) => l, (r) => r);
  }
}
