import 'dart:developer';
import 'package:fire_base/export_app.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  String id = "";
  String password = "";

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    LoginFirstTimeCheck loginFirsTimeCheck = Get.put(LoginFirstTimeCheck());
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Stack(
        children: [
          ClipPath(
            clipper: BackgroundClipper(),
            child: Container(
              color: AppColor.blue,
              height: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Log In",
                        style: GoogleFonts.andika(
                          color: AppColor.white,
                          fontSize: 28,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 25),
                Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        initialValue: id,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if(value!.isEmpty) {
                            return "Enter the User-Id";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (newValue) {
                          id = newValue!;
                        },
                        decoration: InputDecoration(
                          enabled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          fillColor: AppColor.grey200,
                          filled: true,
                          hintText: "ID",
                          helperStyle: GoogleFonts.aleo(
                              color: AppColor.white60,
                              fontSize: 12
                          ),
                        ),
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: AppColor.black,
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
                          fillColor: AppColor.grey200,
                          filled: true,
                          hintText: "Password",
                          helperStyle: GoogleFonts.aleo(
                              color: AppColor.white60,
                              fontSize: 12
                          ),
                        ),
                        onSaved: (newValue) {
                          password = newValue!;
                        },
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: AppColor.black,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: 180,
                        height: 40,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.blue,
                          ),
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();

                              FireBaseHelper.fireBaseHelper.validateUser(
                                id: int.parse(id),
                                password: password,
                              );

                              loginFirsTimeCheck.setOne();

                              FireBaseHelper.fireBaseHelper.getCredential(
                                id: int.parse(id),
                              );

                              Map<String, dynamic>? data =
                              await FireBaseHelper.fireBaseHelper.getAllUser(
                                  id: int.parse(id)
                              );

                              String checkPassword = data?['password'];
                              int checkID = data?['id'];
                              log(checkPassword);

                              if (password == checkPassword &&
                                  int.parse(id) == checkID) {
                                Get.offNamed(
                                  "/home",
                                  arguments: int.parse(id),
                                );
                              } else {
                                Get.snackbar(
                                  "Password or Id",
                                  "Id or Password Wrong!!",
                                );
                              }
                            } else {
                              Get.snackbar("Failed", "User Can't Axis..");
                            }
                          },
                          child: Text("Log In",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: AppColor.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Expanded(
                              child: Divider(
                                thickness: 1,
                                color: AppColor.black3,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "OR",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Expanded(
                              child: Divider(
                                thickness: 1,
                                color: AppColor.black3,
                              ),
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
                              color: AppColor.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}