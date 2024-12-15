import '../../../../core/class/crud.dart';
import '../../../../core/constant/app_apis.dart';

class OrdersData {
  Crud crud;
  OrdersData(this.crud);
  checkout({
    required String usersid,
    required String addressid,
    required String orderstype,
    required String pricedelivery,
    required String ordersprice,
    required String couponid,
    required String couponDiscount,
    required String orderPaymentMethod,
  }) async {
    var response = await crud.postData(AppApis.orderCheckout, {
      'usersid': usersid,
      'addressid': addressid,
      'orderstype': orderstype,
      'pricedelivery': pricedelivery,
      'ordersprice': ordersprice,
      'couponid': couponid,
      'couponDiscount': couponDiscount,
      'orderPaymentMethod': orderPaymentMethod,
    });
    return response.fold((l) => l, (r) => r);
  }
}
