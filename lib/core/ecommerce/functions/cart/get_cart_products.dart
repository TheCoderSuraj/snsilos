part of 'cart_api.dart';

Future<List<ProductModel>> _getAllProductToCart({
  required String uid,
  FirebaseCallbackListener? listener,
}) async {
  List<ProductModel> res = [];
  try {
    await UserFireStoreDatabase.getInstance()
        .collection(fUserCollectionName)
        .doc(uid)
        .collection(fCartProductCollectionName)
        .get()
        .then(
      (value) {
        for (var a in value.docs) {
          print(a.data());
          res.add(ProductModel.fromJson(a.data()));
        }
        listener?.call();
      },
      onError: (e) {
        var err = "GetCart Error: $e";
        debugPrint(err);
        listener?.call(error: err);
      },
    );
  } catch (e) {
    var err = "GetCart Error: $e";
    debugPrint(err);
    listener?.call(error: err);
  }
  return res;
}

Stream<QuerySnapshot<Map<String, dynamic>>> _getProductStream({
  required String uid,
}) {
  return UserFireStoreDatabase.getInstance()
      .collection(fUserCollectionName)
      .doc(uid)
      .collection(fCartProductCollectionName)
      .snapshots();
}
