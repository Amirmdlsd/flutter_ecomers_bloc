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
       );

      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      credential.user?.sendEmailVerification();
      credential.user?.updateDisplayName(name);
      AuthManager.saveUId(credential.user!.uid??'');

      //   add to db
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      users.doc(credential.user?.uid).set({
        'username': credential.user?.displayName,
        'email': credential.user?.email,
        'avatar': credential.user?.photoURL,
        'location': const GeoPoint(32.0, 31.2)
      });

      debugPrint('name is ${credential.user?.displayName}');
      AuthManager.setBool();
      EasyLoading.dismiss();
      ShowToast.ShowMessage("ثبت نام انجام شد.لطفا ایمیل خودتان را تایید کنید");
      Navigator.pushNamedAndRemoveUntil(context, '/mainScreen', (route) => false);
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      debugPrint(e.code);
      switch(e.code){
        case 'email-already-in-use':
          ShowToast.ShowMessage('این ایمیل قبلا ثبت نام شده است!');
          break;
          case 'invalid-email':
          ShowToast.ShowMessage('این ایمیل نامعتبر است!');
          break;
          case 'network-request-failed':
          ShowToast.ShowMessage('خطا در برقراری ارتباط');
          break;

      }

    } catch (e) {
      EasyLoading.dismiss();

      debugPrint(e.toString());
      ShowToast.ShowMessage("خطایی رخ داده است.لطفا بعدا تلاش کنید!");
    }
  }
}
