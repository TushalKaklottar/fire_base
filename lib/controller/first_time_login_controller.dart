import 'package:fire_base/export_app.dart';

class FirstTimeCheck {
  final String _isFirst = "isFirst";

  SharedPreferences? sharedPreferences;
  GetStorage getStorage = GetStorage();

  bool get isOne {
    return sharedPreferences?.getBool(_isFirst) ?? false;
  }
  setOne() {
    sharedPreferences?.setBool(_isFirst, true);
  }
}