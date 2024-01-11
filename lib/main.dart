import 'package:fire_base/export_app.dart';
import 'package:fire_base/view/screen/chat_page.dart';

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
    LoginFirstTimeCheck loginFirstTimeCheck = Get.put(LoginFirstTimeCheck());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      getPages: [
        GetPage(
          name: "/",
          page: () => loginFirstTimeCheck.isOne ? LoginPage() :  const Splash(),
        ),
        GetPage(
            name: "/home",
            page: () =>  const HomePage(),
        ),
        GetPage(
            name: '/login',
            page: () => LoginPage(),
        ),
        GetPage(
          name: "/sign",
          page: () =>  Sign_In(),
        ),
        GetPage(
            name: "/ChatPage",
            page: () => const ChatPage(),
        ),
      ],
    );
  }
}