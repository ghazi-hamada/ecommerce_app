import '../../../../../core/class/crud.dart';
import '../../../../../core/constant/app_apis.dart';

class MyFavoriteData {
  Crud crud;
  MyFavoriteData(this.crud);
  getdata(id) async {
    var response = await crud.postData(AppApis.favoriteView, {
      "id": id,
    });
    return response.fold((l) => l, (r) => r);
  }

  removeFavorite(int id) async {
    var response = await crud.postData(AppApis.deleteFromFavorite, {
      "favoriteid": '$id',
    });
    return response.fold((l) => l, (r) => r);
  }
}
