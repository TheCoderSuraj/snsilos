import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sn_silos/models/address_model.dart';

class UserModel {
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
    this.joinedDate,
  });
  late String id;
  late String name;
  late String email;
  late List<dynamic> address;
  Timestamp? joinedDate;

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    // parsing list of AddressModel from json
    address = (json['address'] as List)
        .map(
          (e) => AddressModel.fromJson(e),
        )
        .toList();
    joinedDate = json['joinedDate'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['address'] =
        address.map((e) => (e as AddressModel).toJson().toString()).toList();
    data['joinedDate'] = joinedDate;
    return data;
  }
}

// {
//   "id":"",
//   "name":"",
//   "email":"",
//   "address":[],
//   "joinedDate":413
// }