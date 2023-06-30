part of 'address_database_api.dart';

Future<void> _updateAddress({
  required String uid,
  required AddressModel address,
  FirebaseCallbackListener? listener,
}) async {
  try {
    var data = address.toJson();
    await FirebaseFirestore.instance
        .collection(fUserCollectionName)
        .doc(uid)
        .collection(fAddressCollectionName)
        .doc(address.id)
        .update(data)
        .then(
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
