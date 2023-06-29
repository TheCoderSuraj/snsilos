import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../../../../models/product_model.dart';

part 'get_products.dart';

class ProductApi {
  static Future<List<ProductModel>> getAllProducts() async {
    return _getAllProducts();
  }
}
