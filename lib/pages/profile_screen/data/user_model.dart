import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  String ?userName;
  GeoPoint? location;
  String? avatar;

  UserModel(
      { this.id,
       this.userName,
       this.location,
       this.avatar});
}
