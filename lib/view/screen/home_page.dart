import 'package:fire_base/export_app.dart';
import 'package:fire_base/view/screen/chat_page.dart';

class HomePage extends StatefulWidget {
   const HomePage({super.key});

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
                itemCount: snapshot.data?['contacts']?.length,
                  itemBuilder: (context,index) {

                    Map<String,dynamic>? allUser = snapshot.data;
                    Map data = {
                      'sender': allUser?['contacts'][index],
                      'received': allUser,
                    };

                    if(snapshot.data?['contacts'].length > 0) {
                      return Container(
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColor.white,
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(1.6, 1.1),
                              color: Colors.black26,
                            ),
                          ],
                        ),
                        child: ListTile(
                          onTap: () {
                            Get.toNamed(
                                "/ChatPage",
                              arguments: data,
                            );
                          },
                          title: StreamBuilder(
                            stream: FireBaseHelper.fireBaseHelper.userStream(
                                receivedId: data['sender'],
                            ),
                            builder: (context,snapshot) {
                              if(snapshot.hasData) {
                                var name = snapshot.data;
                                return  Text(
                                    "${name['name']}",
                                  style: TextStyle(
                                    color: AppColor.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              } else {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            }
                          ),
                          subtitle: Text(
                              ""
                          ),
                          trailing: IconButton(onPressed: onPressed, icon: icon),
                        ),
                      );
                    }
                    return null;
                  },
              );
            } else if (snapshot.hasError) {

            } else {
              return Center(child: CircularProgressIndicator(),);
            }
          }
      )
      ),
    );
   }
}
