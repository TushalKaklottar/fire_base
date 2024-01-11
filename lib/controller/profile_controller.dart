import 'dart:developer';

import 'package:fire_base/export_app.dart';

class ProfileController extends GetxController {
  RxBool showPassword = false.obs;

  changeShow() {
    showPassword(!showPassword.value);
    log("$showPassword");

    update();
  }
}