import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class ImageHandler{
   File ? _file;

   Future<void>getUserImage({ ImageSource? source})async{
 try{
   final imagePicker =await ImagePicker.platform.getImageFromSource(source: source!);
   if(imagePicker ==null)return;
   File image =File(imagePicker.path);
   _file =image;
 }catch(e){
   debugPrint(e.toString());
 }
  }

   File? get getImageFile=>_file;
}
