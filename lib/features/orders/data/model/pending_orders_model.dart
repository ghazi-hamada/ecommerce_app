import '../../../../core/functions/json_to_double.dart';

class PendingOrdersModel {
  int? ordersId;
  int? ordersUsersid;
  int? ordersAddress;
  int? ordersType;
  int? ordersPriceDelivery;
  double? ordersPrice;
  double? ordersTotalPrice;
  int? ordersCoupon;
  String? ordersDaterime;
  int? orderPaymentMethod;
  int? ordersStatus;
  int? addressId;
  String? addressCity;
  int? addressUsersid;
  String? addressName;
  String? addressStreet;
  String? addressLat;
  String? addressLong;

  PendingOrdersModel(
      {this.ordersId,
      this.ordersUsersid,
      this.ordersAddress,
      this.ordersType,
      this.ordersPriceDelivery,
      this.ordersPrice,
      this.ordersTotalPrice,
      this.ordersCoupon,
      this.ordersDaterime,
      this.orderPaymentMethod,
      this.ordersStatus,
      this.addressId,
      this.addressCity,
      this.addressUsersid,
      this.addressName,
      this.addressStreet,
      this.addressLat,
      this.addressLong});

  PendingOrdersModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    ordersUsersid = json['orders_usersid'];
    ordersAddress = json['orders_address'];
    ordersType = json['orders_type'];
    ordersPriceDelivery = json['orders_price_delivery'];
    ordersPrice = toDouble(json['orders_price']);
    ordersTotalPrice = toDouble(json['orders_total_price']);
    ordersCoupon = json['orders_coupon'];
    ordersDaterime = json['orders_daterime'];
    orderPaymentMethod = json['order_payment_method'];
    ordersStatus = json['orders_status'];
    addressId = json['address_id'];
    addressCity = json['address_city'];
    addressUsersid = json['address_usersid'];
    addressName = json['address_name'];
    addressStreet = json['address_street'];
    addressLat = json['address_lat'];
    addressLong = json['address_long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['orders_id'] = ordersId;
    data['orders_usersid'] = ordersUsersid;
    data['orders_address'] = ordersAddress;
    data['orders_type'] = ordersType;
    data['orders_price_delivery'] = ordersPriceDelivery;
    data['orders_price'] = ordersPrice;
    data['orders_total_price'] = ordersTotalPrice;
    data['orders_coupon'] = ordersCoupon;
    data['orders_daterime'] = ordersDaterime;
    data['order_payment_method'] = orderPaymentMethod;
    data['orders_status'] = ordersStatus;
    data['address_id'] = addressId;
    data['address_city'] = addressCity;
    data['address_usersid'] = addressUsersid;
    data['address_name'] = addressName;
    data['address_street'] = addressStreet;
    data['address_lat'] = addressLat;
    data['address_long'] = addressLong;
    return data;
  }
}
