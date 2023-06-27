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
  });
  late String id;
  late String title;
  late String category;
  late String price;
  late String description;
  late String image;
  late double rating;
  late int votes;

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    title = json['title'];
    category = json['category'];
    price = json['price'];
    image = json['image'];
    description = json['description'];

    // rating = json['rating'];
    // votes = json['votes'];

    // just for fakestoreapi.com
    // rating and vote are in nested map "rating"
    rating = json['rating']["rate"];
    votes = json['rating']['count'];
  }

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

    data['rating']['rate'] = rating;
    data['rating']['count'] = votes;
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
