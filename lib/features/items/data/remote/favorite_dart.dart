import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/constant/app_apis.dart';

class FavoriteData {
  Crud crud;
  FavoriteData(this.crud);
  addFavorite({required String itemsid, required String usersid}) async {
    var response = await crud.postData(AppApis.favoriteAdd, {
      "itemsid": itemsid,
      "usersid": usersid,
    });
    return response.fold((l) => l, (r) => r);
  }

  removeFavorite({required String itemsid, required String usersid}) async {
    var response = await crud.postData(AppApis.favoriteRemove, {
      "itemsid": itemsid,
      "usersid": usersid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
