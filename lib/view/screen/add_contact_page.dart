import 'package:fire_base/export_app.dart';

class AddContact extends StatelessWidget {
   AddContact({super.key});

  int argId = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
            )
        ),
        title: Text(
          "Add Friend",
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.w500
          ),
        ),
        backgroundColor: Colors.grey.shade100,
      ),
      body: Padding(
          padding: const EdgeInsets.all(12),
        child: StreamBuilder(
          stream: FireBaseHelper.fireBaseHelper.getAllUserStream(id: argId),
          builder: (context,snap) {
            if(snap.hasData) {
              return StreamBuilder(
                  stream: FireBaseHelper.fireBaseHelper.allUserId(),
                builder: (context,snapshot) {
                    if(snapshot.hasData) {
                      List allId = snapshot.data;
                      return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context,index) {
                          return Container(

                          );
                        },
                      );
                    }
                    else {
                      return const CircularProgressIndicator();
                    }

                }
              );
            } else if(snap.hasError){
              return Center(
                child: Text("${snap.error}"),
              );
            }
            else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }
        ),
      ),
    );
  }
}
