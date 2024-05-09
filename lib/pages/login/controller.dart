import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:untitled2/pages/home_page/home_screen.dart';
import 'package:untitled2/utils/auth_manager.dart';
import 'package:untitled2/widget/flutter_toast_widget.dart';

class LoginController {
  static login(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      EasyLoading.show();
      UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      AuthManager.setBool();
      AuthManager.saveUId(credential.user!.uid ?? '');

      EasyLoading.dismiss();
      ShowToast.ShowMessage('با موفقیت وارد شدید');
      Navigator.pushNamedAndRemoveUntil(
          context, '/mainScreen', (route) => false);
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      debugPrint(e.code);
      switch (e.code) {
        case 'network-request-failed':
          ShowToast.ShowMessage('خطا در برقراری ارتیاط');
          break;
        case 'invalid-email':
          ShowToast.ShowMessage('این ایمیل نامعتبر است!');
          break;
      }
    } catch (e) {
      EasyLoading.dismiss();

      debugPrint(e.toString());
      ShowToast.ShowMessage("خطایی رخ داده است.لطفا بعدا تلاش کنید!");
    }
  }
}
