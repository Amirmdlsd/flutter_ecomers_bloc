import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled2/utils/auth_manager.dart';

abstract class IEditUserDataSource {
  Future<void> editUser(File file, String name, String email);
}

class UserEditeRemoteDataSource extends IEditUserDataSource {
  @override
  Future<void> editUser(File file, String name, String email) async {
    try {
      var response = FirebaseFirestore.instance.collection('users');
      QuerySnapshot querySnapshot = await response.get();
      querySnapshot.docs
          .where((element) => element.id == AuthManager.getUId(),)
          .first
          .reference
    .update({
    'avatar': file.path,
    'username': name,
    'email': email,
    });

    } catch (e) {
    throw Exception(e.toString());
    }
  }
}
