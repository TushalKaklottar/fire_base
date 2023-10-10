import 'dart:async';

import 'package:fire_base/export_app.dart';

class SplashController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    Timer(
        const Duration(seconds: 5),
            () {
          Get.offNamed('/login');
        }
    );
  }
}
