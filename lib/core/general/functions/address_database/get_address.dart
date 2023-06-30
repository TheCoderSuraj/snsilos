part of 'address_database_api.dart';

Future<List<AddressModel>> _getAllAddress({
  required String uid,
  FirebaseCallbackListener? listener,
}) async {
  List<AddressModel> res = [];
  try {
    await FirebaseFirestore.instance
        .collection(fUserCollectionName)
        .doc(uid)
        .collection(fAddressCollectionName)
        .get()
        .then(
      (value) {
        listener?.call();
        for (var a in value.docs) {
          res.add(AddressModel.fromJson(a.data()));
        }
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
  return res;
}
