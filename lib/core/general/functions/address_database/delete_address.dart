part of 'address_database_api.dart';

Future<void> _deleteAddress({
  required String uid,
  required String addressId,
  FirebaseCallbackListener? listener,
}) async {
  try {
    await FirebaseFirestore.instance
        .collection(fUserCollectionName)
        .doc(uid)
        .collection(fAddressCollectionName)
        .doc(addressId)
        .delete()
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
