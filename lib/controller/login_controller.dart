import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginFirsTimeCheck {

  final String _isFirst = "isFirst";

  SharedPreferences? sharedPreferences;

  GetStorage storage = GetStorage();

  bool get isOne {
    return sharedPreferences?.getBool(_isFirst)  ?? false;
  }

  setOne() {
    sharedPreferences?.setBool(_isFirst, true);
  }
}