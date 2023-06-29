import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:sn_silos/core/auth/functions/auth.dart';

import '../../../../models/product_model.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/firebase_callback_listener.dart';
import '../../../general/functions/user_database/firestore/user_firestore_database.dart';

part 'add2cart.dart';
part 'delete_cart_product.dart';
part 'get_cart_products.dart';
part 'update_cart.dart';

class CartApi {
  static Future<void> addProductToCart({
    required ProductModel product,
    FirebaseCallbackListener? listener,
  }) async {
    if (!AuthApi.isUserLoggedIn()) {
      listener?.call(error: "Error: User not logged in");
      return;
    }
    return _addProductToCart(
      uid: AuthApi.getCurrentUser()!.uid,
      product: product,
      listener: listener,
    );
  }

  static Future<void> updateCartProduct({
    required ProductModel product,
    FirebaseCallbackListener? listener,
  }) async {
    if (!AuthApi.isUserLoggedIn()) {
      listener?.call(error: "Error: User not logged in");
      return;
    }
    return _updateCartProduct(
      uid: AuthApi.getCurrentUser()!.uid,
      product: product,
      listener: listener,
    );
  }

  static Future<List<ProductModel>> getAllProductToCart({
    FirebaseCallbackListener? listener,
  }) async {
    if (!AuthApi.isUserLoggedIn()) {
      listener?.call(error: "Error: User not logged in");
      return [];
    }
    return _getAllProductToCart(
      uid: AuthApi.getCurrentUser()!.uid,
      listener: listener,
    );
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getProductStream() {
    if (!AuthApi.isUserLoggedIn()) {
      return Stream.error("User not logged in");
    }
    return _getProductStream(
      uid: AuthApi.getCurrentUser()!.uid,
    );
  }

  static Future<void> deleteProductFromCart({
    required String productId,
    FirebaseCallbackListener? listener,
  }) async {
    if (!AuthApi.isUserLoggedIn()) {
      listener?.call(error: "Error: User not logged in");
      return;
    }
    return _deleteProductFromCart(
      uid: AuthApi.getCurrentUser()!.uid,
      productId: productId,
      listener: listener,
    );
  }
}
