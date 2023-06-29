part of 'cart_api.dart';

Future<void> _addProductToCart({
  required String uid,
  required ProductModel product,
  FirebaseCallbackListener? listener,
}) async {
  try {
    var data = product.toJson();

    data['createdDate'] = FieldValue.serverTimestamp();
    var doc = UserFireStoreDatabase.getInstance()
        .collection(apUserCollectionName)
        .doc(uid)
        .collection(apCartProductCollectionName)
        .doc();
    data['id'] = doc.id;
    doc.set(data).then(
      (value) {
        listener?.call();
      },
      onError: (e) {
        var err = "AddCart Error: $e";
        debugPrint(err);
        listener?.call(error: err);
      },
    );
  } catch (e) {
    var err = "AddCart Error: $e";
    debugPrint(err);
    listener?.call(error: err);
  }
}
