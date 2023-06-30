part of 'address_database_api.dart';

Future<void> _addAddress({
  required String uid,
  required AddressModel address,
  FirebaseCallbackListener? listener,
}) async {
  try {
    var data = address.toJson();
    var doc = FirebaseFirestore.instance
        .collection(fUserCollectionName)
        .doc(uid)
        .collection(fAddressCollectionName)
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
