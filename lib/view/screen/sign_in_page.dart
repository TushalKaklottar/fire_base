import 'package:fire_base/export_app.dart';
import 'package:fire_base/modals/fire_store_modal.dart';

class Sign_In extends StatelessWidget {
   Sign_In({super.key});

  late int id;
  late String name;
  late String password;
  List contacts = [];

   GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.toNamed('/login');
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
          padding: EdgeInsets.all(14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Sing In",
                  style: GoogleFonts.andika(
                      color: Colors.black,
                      fontSize: 30
                  ),
                )
              ],
            ),
            const SizedBox(height: 30),
            Form(
              key: formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // id
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if(value!.isEmpty) {
                          return "Enter the User-Id";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                      id = int.parse(value!);
                    },

                      decoration: InputDecoration(
                        enabled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        hintText: "ID",
                        helperStyle: GoogleFonts.aleo(
                            color: Colors.white60,
                            fontSize: 12
                        ),
                      ),

                      style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.w600
                      ),
                    ),

                    const SizedBox(height: 25),

                    // name
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if(value!.isEmpty) {
                          return "Enter the User-Name";
                        } else {
                          return null;
                        }
                      },

                      onSaved: (value) {
                        name = value!;
                      },

                      decoration: InputDecoration(
                        enabled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        hintText: "User-Name",
                        helperStyle: GoogleFonts.aleo(
                            color: Colors.white60,
                            fontSize: 12
                        ),
                      ),

                      style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.w600
                      ),
                    ),

                    const SizedBox(height: 25),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if(value!.isEmpty) {
                          return "Enter the Password";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        password = value!;
                      },
                      decoration: InputDecoration(
                        enabled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        hintText: "Password",
                        helperStyle: GoogleFonts.aleo(
                            color: Colors.white60,
                            fontSize: 12
                        ),
                      ),
                      style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: 180,
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                          onPressed: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                          }
                          },
                          child:  Text("Log In",
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
            ),
          ],
        ),
      ),
      // body: SingleChildScrollView(
      //   scrollDirection: Axis.vertical,
      //   child: Column(
      //     children: [
      //       Padding(
      //         padding: const EdgeInsets.all(16),
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children:  [
      //           const SizedBox(height: 10),
      //           Text("Sing In",
      //           style: GoogleFonts.arvo(
      //             color: const Color(0xFF27447C),
      //             fontSize: 30,
      //             fontWeight: FontWeight.bold,
      //           ),
      //           ),
      //           const SizedBox(height: 20),
      //
      //           // id
      //           TextField(
      //             onSubmitted: (value) {
      //               id = int.parse(value);
      //             },
      //             decoration: InputDecoration(
      //               enabled: true,
      //                 border: OutlineInputBorder(
      //                   borderRadius: BorderRadius.circular(12),
      //                 ),
      //               fillColor: Colors.grey.shade200,
      //                 filled: true,
      //                 hintText: "Enter Id",
      //               helperStyle: GoogleFonts.aleo(
      //                       color: Colors.white60,
      //                       fontSize: 12
      //                   ),
      //                 ),
      //             ),
      //           const SizedBox(height: 25),
      //
      //
      //           // name
      //           TextField(
      //             onSubmitted: (value) {
      //               name = value;
      //             },
      //             decoration: InputDecoration(
      //               enabled: true,
      //               border: OutlineInputBorder(
      //                 borderRadius: BorderRadius.circular(12),
      //               ),
      //               fillColor: Colors.grey.shade200,
      //               filled: true,
      //               hintText: "Enter name",
      //               helperStyle: GoogleFonts.aleo(
      //                   color: Colors.white60,
      //                   fontSize: 12
      //               ),
      //             ),
      //           ),
      //           const SizedBox(height: 25),
      //           TextField(
      //             onSubmitted: (value) {
      //               password = value;
      //             },
      //             decoration: InputDecoration(
      //               enabled: true,
      //               border: OutlineInputBorder(
      //                 borderRadius: BorderRadius.circular(12),
      //               ),
      //               fillColor: Colors.grey.shade200,
      //               filled: true,
      //               hintText: "Enter Password",
      //               helperStyle: GoogleFonts.aleo(
      //                   color: Colors.white60,
      //                   fontSize: 12
      //               ),
      //             ),
      //           ),
      //           const SizedBox(height: 40),
      //           SizedBox(
      //             width: 180,
      //             height: 40,
      //             child: ElevatedButton(
      //               style: ElevatedButton.styleFrom(
      //                 backgroundColor: Colors.blue,
      //               ),
      //               onPressed: () async {
      //                 FireStoreModal fireStoreModal = FireStoreModal(
      //                     id,
      //                     name,
      //                     password
      //                 );
      //                 FireBaseHelper.fireBaseHelper.addUser(
      //                     fireStoreModal: fireStoreModal
      //                 );
      //                 Get.offNamed("/home",arguments: id);
      //               },
      //               child: Text("Log In",
      //                 style: GoogleFonts.poppins(
      //                     fontWeight: FontWeight.bold,
      //                     fontSize: 12,
      //                     color: Colors.white
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
