import 'package:flutter/cupertino.dart';

class LoginEvent{
  final String email;
  final String password;
  final BuildContext context;
  const LoginEvent(this.email,this.password,this.context);
}