class AddressModel {
  int? id;
  String? addressCity;
  int? addressUsersid;
  String? addressName;
  String? addressStreet;
  String? addressLat;
  String? addressLong;

  AddressModel(
      {this.id,
      this.addressCity,
      this.addressUsersid,
      this.addressName,
      this.addressStreet,
      this.addressLat,
      this.addressLong});

  AddressModel.fromJson(Map<String, dynamic> json) {
    id = json['address_id'];
    addressCity = json['address_city'];
    addressUsersid = json['address_usersid'];
    addressName = json['address_name'];
    addressStreet = json['address_street'];
    addressLat = json['address_lat'];
    addressLong = json['address_long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address_id'] = id;
    data['address_city'] = addressCity;
    data['address_usersid'] = addressUsersid;
    data['address_name'] = addressName;
    data['address_street'] = addressStreet;
    data['address_lat'] = addressLat;
    data['address_long'] = addressLong;
    return data;
  }
}
