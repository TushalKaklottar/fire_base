import 'package:fire_base/view/screen/home_page.dart';
import 'package:fire_base/view/screen/login_page.dart';
import 'package:fire_base/view/screen/sign_in_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      getPages: [
        GetPage(
          name: '/',
          page: () => LoginPage(),
        ),
        GetPage(
            name: '/home',
            page: () =>  HomePage(),
        ),
        GetPage(
          name: '/sign',
          page: () => const Sign_In(),
        ),
      ],
    );
  }
}