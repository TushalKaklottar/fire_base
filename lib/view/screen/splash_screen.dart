import 'package:fire_base/export_app.dart';


class Splash extends StatelessWidget {
   const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height,
        width = MediaQuery.of(context).size.width;
    return GetBuilder(
      init: SplashController(),
      builder: (SplashController controller) {
        return Scaffold(
          backgroundColor: const Color(0xfff7f6fc),
          body: SafeArea(
            child: Center(
              child: Image.asset(
                  "assets/images/logo.png",
                  height: height / 4
              ),
            ),
          ),
        );
      },
    );
  }
}
