import '../../../../core/class/crud.dart';
import '../../../../core/constant/app_apis.dart';

class AddressData {
    Crud crud;
    AddressData(this.crud);

      addAddress(
    String userid,
    String name,
    String city,
    String street,
    String lat,
    String long,
  ) async {
    var response = await crud.postData(AppApis.addressAdd, {
      "usersid": userid.toString(),
      "name": name.toString(),
      "city": city.toString(),
      "street": street.toString(),
      "lat": lat.toString(),
      "long": long.toString(),
    });

    return response.fold((l) => l, (r) => r);
  }


deleteAddress(
    String addressid,
  ) async {
    var response = await crud.postData(AppApis.addressDelete, {
      "addressid": addressid.toString(),
    });

    return response.fold((l) => l, (r) => r);
  }

    editAddress(
    String addressid,
    String name,
    String city,
    String street,
    String lat,
    String long,
  ) async {
   var response = await crud.postData(AppApis.addressEdit, {
      "addressid": addressid.toString(),
      "name": name.toString(),
      "city": city.toString(),
      "street": street.toString(),
      "lat": lat.toString(),
      "long": long.toString(),
    });

    return response.fold((l) => l, (r) => r);
  }


    viewAddress(
    String userid,
  ) async {
    var response = await crud.postData(AppApis.addressView, {
      "usersid": userid.toString(),
    });

    return response.fold((l) => l, (r) => r);
  }
}