import 'package:fire_base/export_app.dart';
import 'package:fire_base/modals/setting_model.dart';

class SettingController extends GetxController {

  SettingModel model = SettingModel();

  changeTheme() {
    model.theme.value = !model.theme.value;
  }
}