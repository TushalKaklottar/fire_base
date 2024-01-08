import 'package:fire_base/export_app.dart';

class HomePage extends StatefulWidget {
   HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
   int argId = Get.arguments;
   late int id;

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "User",
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
            color: AppColor.black,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          )
        ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
      child: FutureBuilder(
        future: FireBaseHelper.fireBaseHelper.getAllUser(id: argId),
          builder: (context,snapshot) {
            if(snapshot.hasData) {
              return ListView.builder(
                  itemBuilder: (context,index) {

                  }
              );
            }
          }
      )
      ),
    );
   }
}
