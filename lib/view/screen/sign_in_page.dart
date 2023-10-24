import 'package:fire_base/export_app.dart';

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
          padding: const EdgeInsets.all(14),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Sing In",
                    style: GoogleFonts.andika(
                        color: AppColor.black,
                        fontSize: 30
                    ),
                  )
                ],
              ),
              const SizedBox(height: 25),
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
                          fillColor: AppColor.grey200,
                          filled: true,
                          hintText: "User-Name",
                          helperStyle: GoogleFonts.aleo(
                              color: AppColor.white60,
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
                          fillColor: AppColor.grey200,
                          filled: true,
                          hintText: "Password",
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
                      const SizedBox(height: 30),
                      SizedBox(
                        width: 180,
                        height: 40,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.blue,
                          ),
                            onPressed: () {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();

                              FireStoreModal firebaseModal = FireStoreModal(
                                  id,
                                  name,
                                  password,
                              );
                              FireBaseHelper.fireBaseHelper.addUser(fireStoreModal: firebaseModal);

                            } else {
                              Get.snackbar("Failed", "User Can't Axis..");
                            }
                            Get.offNamed("/home",arguments: id);
                            },
                            child: Text("Sing In",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: AppColor.white,
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
      ),
    );
  }
}
