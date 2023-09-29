import 'package:fire_base/controller/login_controller.dart';
import 'package:fire_base/helper_class/firestore_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  String id = "";
  String password = "";

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    LoginFirsTimeCheck loginFirsTimeCheck = Get.put(LoginFirsTimeCheck());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text("Log In",
                style: GoogleFonts.andika(
                color: Colors.black,
                  fontSize: 30
              ),
              )
            ],
            ),
            const SizedBox(height: 25),
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
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        hintText: "ID",
                        helperStyle: GoogleFonts.aleo(
                            color: Colors.white60,
                          fontSize: 12
                        ),
                      ),

                      onSaved: (newValue) {
                        id = newValue!;
                      },
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    const SizedBox(height: 18),
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
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        hintText: "Password",
                        helperStyle: GoogleFonts.aleo(
                            color: Colors.white60,
                          fontSize: 12
                        ),
                      ),

                      onSaved: (newValue) {
                        password = newValue!;
                      },
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
                          primary: Colors.blue,
                        ),
                          onPressed: () {
                            if(
                            formKey.currentState!.validate()) {
                              formKey.currentState!.save();

                              FireStoreHelper.fireStoreHelper.validateUser(
                                  id: int.parse(id),
                                  password: password,
                              );
                              loginFirsTimeCheck.setOne();
                              FireStoreHelper.fireStoreHelper.getCredential(id: int.parse(id),);
                              Get.offNamed('/home',arguments: int.parse(id));
                            }
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
                    SizedBox(height: 15,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            height: 2,
                          width: 130,
                            color: Colors.black38,
                          ),
                          SizedBox(width: 10,),
                          Text("OR",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600
                          ),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            height: 2,
                            width: 140,
                            color: Colors.black38,
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Get.offNamed("/sign");
                        },
                        child: Text("Create new user",
                          style: GoogleFonts.poppins(
                            color:  Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                    )
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}
