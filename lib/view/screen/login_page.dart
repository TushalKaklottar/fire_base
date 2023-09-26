import 'package:fire_base/helper_class/firestore_helper.dart';
import 'package:fire_base/modals/create_user_modals.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  String? id;
  String? name;
  String? password;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text("Sing In",
                style: GoogleFonts.andika(
                color: Colors.white,
                  fontSize: 30
              ),
              )
            ],
            ),
            const SizedBox(height: 30),
            Form(
              key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      initialValue: id,
                      keyboardType: TextInputType.number,

                      validator: (value) {
                        if(value!.isEmpty) {
                          return "enter the value";
                        } else {
                          return null;
                        }
                      },

                      decoration: InputDecoration(
                        enabled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        fillColor: Colors.white60,
                        filled: true,
                        hintText: "ID",
                        helperStyle: GoogleFonts.aleo(
                            color: Colors.black45
                        ),
                      ),

                      onSaved: (newValue) {
                        id = newValue!;
                      },
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w600
                      ),
                    ),

                    const SizedBox(height: 20),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      initialValue: name,

                      validator: (value) {
                        if(value!.isEmpty) {
                          return "enter the value";
                        } else {
                          return null;
                        }
                      },

                      decoration: InputDecoration(
                        enabled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        fillColor: Colors.white60,
                        filled: true,
                        hintText: "Name",
                        helperStyle: GoogleFonts.aleo(
                            color: Colors.black45
                        ),
                      ),

                      onSaved: (newValue) {
                        name = newValue!;
                      },
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.visiblePassword,
                      initialValue: password,

                      validator: (value) {
                        if(value!.isEmpty) {
                          return "enter the value";
                        } else {
                          return null;
                        }
                      },

                      decoration: InputDecoration(
                        enabled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        fillColor: Colors.white60,
                        filled: true,
                        hintText: "Password",
                        helperStyle: GoogleFonts.aleo(
                            color: Colors.black45
                        ),
                      ),

                      onSaved: (newValue) {
                        password = newValue!;
                      },
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w600
                      ),
                    ),

                    const SizedBox(height: 40),

                    

                  ],
                )
            )
            // Form(
            //   key: formKey,
            //   autovalidateMode: AutovalidateMode.onUserInteraction,
            //   child: Column(
            //     children: [
            //       TextFormField(
            //       TextFormField(
            //         initialValue: password,
            //         validator: (value) {
            //           if(value!.isEmpty) {
            //             return "enter the value";
            //           } else {
            //             return null;
            //           }
            //         },
            //         onSaved: (newValue) {
            //           password = newValue;
            //         },
            //         decoration: const InputDecoration(
            //           border: OutlineInputBorder(),
            //           label: Text("password")
            //
            //         ),
            //       ),
            //       SizedBox(
            //         height: 20,
            //       ),
            //       ElevatedButton(
            //           onPressed: () {
            //             if(formKey.currentState!.validate()) {
            //               formKey.currentState!.save();
            //               UserModal user = UserModal(int.parse(id!), name!, password!);
            //               FireStoreHelper.fireStoreHelper.creteUser(userModal: user);
            //               Get.offNamed('/home',arguments: int.parse(id!));
            //             }
            //           },
            //           child: const Text("Submit"),
            //       )
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
