import 'package:fire_base/export_app.dart';

class LoginFirstTimeCheck {

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