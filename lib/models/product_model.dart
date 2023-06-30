import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  ProductModel({
    required this.title,
    required this.category,
    required this.price,
    required this.description,
    required this.image,
    required this.rating,
    required this.votes,
    this.id = "",
    this.itemCount = 1,
    this.createdDate,
  });
  late String id;
  late String title;
  late String category;
  late double price;
  late String description;
  late String image;
  late double rating;
  late int votes;
  double get totalPrice => itemCount.toDouble() * price;
  Timestamp? createdDate;
  int itemCount = 0;
  // set setCount(int value) {
  //   if (value < 1) itemCount = 1;
  //   itemCount = value;
  // }

  ProductModel copyWith(int count) {
    var v = ProductModel.fromJson(toJson());
    v.itemCount = count;
    return v;
  }

  ProductModel.demo() {
    id = "id";
    title = "Product title:This is a temporary title";
    category = "food";
    price = 1299.99;
    image = "https://picsum.photos/200/300";
    description =
        "This is a temporary description for a test purpose.This is a temporary description for a test purpose.This is a temporary description for a test purpose.This is a temporary description for a test purpose.This is a temporary description for a test purpose...";

    rating = 4.5;
    votes = 250;
    itemCount = 1;
    // totalPrice = itemCount * price;
  }
  ProductModel.fromJson(Map<String, dynamic> json) {
    print("new product creating");
    id = json['id'].toString();
    title = json['title'];
    category = json['category'];
    price = double.parse(json['price'].toString());
    image = json['image'];
    description = json['description'];

    // rating = json['rating'];
    // votes = json['votes'];

    // just for fakestoreapi.com
    // rating and vote are in nested map "rating"
    rating = double.parse(json['rating']["rate"].toString());
    votes = json['rating']['count'];
    itemCount = 1;

    createdDate = json['createdDate'];
    itemCount = json['itemCount'] ?? 1;
    // totalPrice = itemCount * price;
  }

  // // for creating from
  // ProductModel.fromJson(Map<String, dynamic> json) {
  //   id = json['id'].toString();
  //   title = json['title'];
  //   category = json['category'];
  //   price = json['price'];
  //   image = json['image'];
  //   description = json['description'];
  //   rating = json['rating']["rate"];
  //   votes = json['rating']['count'];
  // }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['category'] = category;
    data['price'] = price;
    data['description'] = description;
    data['image'] = image;
    // data['rating'] = rating;
    // data['votes'] = votes;

    // data['rating']['rate'] = rating;
    // data['rating']['count'] = votes;
    data['rating'] = {"rate": rating, "count": votes};

    data['itemCount'] = itemCount;
    data['totalPrice'] = totalPrice;
    data['createdDate'] = createdDate;
    return data;
  }
}

// {
//   "id":"",
//   "title":"",
//   "category":"",
//   "price":"",
//   "desc":"",
//   "image":"",
//   "rating":2.3,
//   "votes":123
// }
