part of 'product_api.dart';

Future<List<ProductModel>> _getAllProducts() async {
  List<ProductModel> res = [];
  String url = "https://fakestoreapi.com/products";
  try {
    http.Response response = await http.get(Uri.parse(url));
    for (var a in jsonDecode(response.body)) {
      res.add(ProductModel.fromJson(a));
    }
  } catch (e) {
    debugPrint("ProductGet Error: $e");
  }
  return res;
}
