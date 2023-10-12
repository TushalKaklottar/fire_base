import 'dart:async';

import 'package:fire_base/export_app.dart';

class SplashController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    Timer(
        const Duration(seconds: 2),
            () {
          Get.offNamed('/login');
        }
    );
  }
}
