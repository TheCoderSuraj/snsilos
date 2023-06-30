part of 'cart_api.dart';

Future<void> _updateCartProduct({
  required String uid,
  required ProductModel product,
  FirebaseCallbackListener? listener,
}) async {
  try {
    await UserFireStoreDatabase.getInstance()
        .collection(fUserCollectionName)
        .doc(uid)
        .collection(fCartProductCollectionName)
        .doc(product.id)
        .update({
      "totalPrice": product.totalPrice,
      "itemCount": product.itemCount
    }).then(
      (value) {
        listener?.call();
      },
      onError: (e) {
        var err = "UpdateCart Error: $e";
        debugPrint(err);
        listener?.call(error: err);
      },
    );
  } catch (e) {
    var err = "UpdateCart Error: $e";
    debugPrint(err);
    listener?.call(error: err);
  }
}
