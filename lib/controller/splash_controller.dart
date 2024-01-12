import 'dart:async';

import 'package:fire_base/export_app.dart';

class SplashController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    Timer.periodic(
        const Duration(seconds: 2),
            (timer) {
          Get.offNamed('/login');
          timer.cancel();
        }
    );
  }
}
