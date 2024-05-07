import 'package:flutter/cupertino.dart';

class RegisterEvent{
  final String name;
  final String email;
  final String pass;
  final BuildContext context;

  RegisterEvent(this.name,this.email, this.pass,this.context);
}