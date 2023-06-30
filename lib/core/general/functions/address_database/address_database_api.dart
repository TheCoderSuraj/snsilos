import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:sn_silos/core/auth/functions/auth.dart';

import '../../../../models/address_model.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/firebase_callback_listener.dart';

part 'add_address.dart';
part 'get_address.dart';
part 'update_address.dart';
part 'delete_address.dart';

class AddressDatabaseApi {
  static Future<void> addAddress({
    required AddressModel address,
    FirebaseCallbackListener? listener,
  }) async {
    if (!AuthApi.isUserLoggedIn()) {
      listener?.call(error: "User Not logged in");
      return;
    }
    return _addAddress(
      uid: AuthApi.getCurrentUser()!.uid,
      address: address,
      listener: listener,
    );
  }

  static Future<void> updateAddress({
    required AddressModel address,
    FirebaseCallbackListener? listener,
  }) async {
    if (!AuthApi.isUserLoggedIn()) {
      listener?.call(error: "User Not logged in");
      return;
    }
    return _updateAddress(
      uid: AuthApi.getCurrentUser()!.uid,
      address: address,
      listener: listener,
    );
  }

  static Future<void> deleteAddress({
    required String addressId,
    FirebaseCallbackListener? listener,
  }) async {
    if (!AuthApi.isUserLoggedIn()) {
      listener?.call(error: "User Not logged in");
      return;
    }
    return _deleteAddress(
      uid: AuthApi.getCurrentUser()!.uid,
      addressId: addressId,
      listener: listener,
    );
  }

  static Future<List<AddressModel>> getAllAddress({
    required String uid,
    FirebaseCallbackListener? listener,
  }) async {
    if (!AuthApi.isUserLoggedIn()) {
      listener?.call(error: "User Not logged in");
      return [];
    }
    return _getAllAddress(
      uid: AuthApi.getCurrentUser()!.uid,
      listener: listener,
    );
  }
}
