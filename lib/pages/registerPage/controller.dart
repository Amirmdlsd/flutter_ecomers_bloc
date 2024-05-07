import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:random_string/random_string.dart';
import 'package:untitled2/pages/home_page/home_screen.dart';
import 'package:untitled2/utils/auth_manager.dart';
import 'package:untitled2/widget/flutter_toast_widget.dart';

class RegisterController {
  static register(
      {required String name,
      required String email,
      required String password,
      required BuildContext context}) async {
    try {
      EasyLoading.show(
          dismissOnTap: true,
          indicator: const CircularProgressIndicator(color: Colors.white));

      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      credential.user?.sendEmailVerification();
      credential.user?.updateDisplayName(name);

      //   add to db
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      users.add({
        "id": randomString(10),
        'username': name,
        'email': email,
      });

      debugPrint('name is ${credential.user?.displayName}');
      AuthManager.setBool();
      EasyLoading.dismiss();
      ShowToast.ShowMessage("ثبت نام انجام شد.لطفا ایمیل خودتان را تایید کنید");
      Navigator.pushNamedAndRemoveUntil(context, '/homePage', (route) => false);
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      debugPrint(e.code);
      ShowToast.ShowMessage(e.code);
    } catch (e) {
      EasyLoading.dismiss();

      debugPrint(e.toString());
      ShowToast.ShowMessage("خطایی رخ داده است.لطفا بعدا تلاش کنید!");
    }
  }
}
