import 'package:fire_base/export_app.dart';
import 'package:fire_base/modals/fire_store_modal.dart';

class Sign_In extends StatelessWidget {
   Sign_In({super.key});

  late int id;
  late String name;
  late String password;
  List contacts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                const SizedBox(height: 10),
                Text("Sing In",
                style: GoogleFonts.arvo(
                  color: const Color(0xFF27447C),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                ),
                const SizedBox(height: 20),
                TextField(
                  onSubmitted: (value) {
                    id = int.parse(value);
                  },
                  decoration: InputDecoration(
                    enabled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    fillColor: Colors.grey.shade200,
                      filled: true,
                      hintText: "Enter Id",
                    helperStyle: GoogleFonts.aleo(
                            color: Colors.white60,
                            fontSize: 12
                        ),
                      ),
                  ),
                const SizedBox(height: 25),
                TextField(
                  onSubmitted: (value) {
                    name = value;
                  },
                  decoration: InputDecoration(
                    enabled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    hintText: "Enter name",
                    helperStyle: GoogleFonts.aleo(
                        color: Colors.white60,
                        fontSize: 12
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                TextField(
                  onSubmitted: (value) {
                    password = value;
                  },
                  decoration: InputDecoration(
                    enabled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    hintText: "Enter Password",
                    helperStyle: GoogleFonts.aleo(
                        color: Colors.white60,
                        fontSize: 12
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: 180,
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: () {
                      FireStoreModal fireStoreModal = FireStoreModal(
                        id,
                        name,
                        password,
                      );
                      FireBaseHelper.fireBaseHelper.adduser(fireStoreModal: fireStoreModal);
                      Get.offNamed("/home",arguments: id);
                    },
                    child: Text("Log In",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.white
                      ),
                    ),
                  ),
                ),
              ],
            ),
            )
          ],
        ),
      ),
    );
  }
}
