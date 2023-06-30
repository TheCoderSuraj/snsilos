class AddressModel {
  AddressModel({
    required this.country,
    required this.state,
    required this.district,
    required this.city,
    required this.postalCode,
    this.addressLine1,
    this.addressLine2,
    this.id = "",
  });
  String id = "";
  late String country;
  late String state;
  late String district;
  late String city;
  late int postalCode;
  String? addressLine1;
  String? addressLine2;

  AddressModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    country = json['country'];
    state = json['state'];
    district = json['district'];
    city = json['city'];
    postalCode = json['postalCode'];
    addressLine1 = json['addressLine1'];
    addressLine2 = json['addressLine2'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['country'] = country;
    data['state'] = state;
    data['district'] = district;
    data['city'] = city;
    data['postalCode'] = postalCode;
    if (addressLine1 != null) data['addressLine1'] = addressLine1;
    if (addressLine2 != null) data['addressLine2'] = addressLine2;
    return data;
  }
}

// {
//   "country":"",
//   "state":"",
//   "district":"",
//   "city":"",
//   "postalCode":123,
//   "addressLine1":"",
//   "addressLine2":""
// }