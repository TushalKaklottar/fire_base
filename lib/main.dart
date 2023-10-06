import 'package:fire_base/export_app.dart';

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
    LoginFirsTimeCheck loginFirsTimeCheck = Get.put(LoginFirsTimeCheck());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      darkTheme: ThemeData.light(),
      themeMode: ThemeMode.system,
      getPages: [
        GetPage(
          name: "/",
          page: () => loginFirsTimeCheck.isOne ? HomePage() : LoginPage(),
        ),
        GetPage(
            name: "/home",
            page: () =>  HomePage(),
        ),
        GetPage(
          name: "/sign",
          page: () => const Sign_In(),
        ),
      ],
    );
  }
}