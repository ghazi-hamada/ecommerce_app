import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/constant/app_apis.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);

  getData( ) async {
    var response = await crud.postData(AppApis.items, { 
    });
    return response.fold((l) => l, (r) => r);
  }
}
