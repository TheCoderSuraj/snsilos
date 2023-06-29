part of 'cart_api.dart';

Future<void> _deleteProductFromCart({
  required String uid,
  required String productId,
  FirebaseCallbackListener? listener,
}) async {
  try {
    UserFireStoreDatabase.getInstance()
        .collection(apUserCollectionName)
        .doc(uid)
        .collection(apCartProductCollectionName)
        .doc(productId)
        .delete()
        .then(
      (value) {
        listener?.call();
      },
      onError: (e) {
        var err = "DeleteCart Error: $e";
        debugPrint(err);
        listener?.call(error: err);
      },
    );
  } catch (e) {
    var err = "DeleteCart Error: $e";
    debugPrint(err);
    listener?.call(error: err);
  }
}
