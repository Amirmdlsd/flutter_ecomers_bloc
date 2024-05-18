import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:untitled2/pages/profile_screen/data/user_model.dart';
import 'package:untitled2/utils/constant.dart';

abstract class IUserDataSource {
  Future<UserModel> getUserData();
}

class UserDataSource extends IUserDataSource {
  @override
  Future<UserModel> getUserData() async {
    try {
      final response = FirebaseFirestore.instance.collection('users');
      QuerySnapshot querySnapshot =await response.get();
    return querySnapshot.docs.map((e) {
       return UserModel(
           id: e.id,
           userName: e['username'],
           avatar: e['avatar'],
           location: e['location']);
     }).first;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
