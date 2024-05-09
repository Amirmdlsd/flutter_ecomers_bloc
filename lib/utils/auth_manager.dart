import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled2/locator.dart';
import 'package:untitled2/utils/constant.dart';

class AuthManager {
  static final SharedPreferences _sharedPreferences = locator.get();

  static Future<void> setBool() async {
    _sharedPreferences.setBool(AppConstant.USER_API_LOGIN_REGISTER, true);
  }

  static Future<bool> checkUserIsLoginOrRegister() async {
    return _sharedPreferences.getBool(AppConstant.USER_API_LOGIN_REGISTER) ??
        false;
  }

  static Future<void> deleteLoginData() async {
    _sharedPreferences.remove(AppConstant.USER_API_LOGIN_REGISTER);
  }
  static Future<void>saveUId(String id)async{
    _sharedPreferences.setString(AppConstant.USER_API_USER_ID, id);
  }
  static String getUId(){
   return _sharedPreferences.getString(AppConstant.USER_API_USER_ID)??'';
  }
}
