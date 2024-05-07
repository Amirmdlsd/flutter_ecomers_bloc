import 'package:fluttertoast/fluttertoast.dart';

class ShowToast {
  static ShowMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
    );
  }
}
