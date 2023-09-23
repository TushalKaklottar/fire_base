import 'package:fire_base/helper_class/firestore_helper.dart';
import 'package:fire_base/modals/create_user_modals.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  String? id;
  String? name;
  String? password;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Login_screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if(value!.isEmpty) {
                        return "enter the value";
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                        label: Text("Id")
                    ),
                    onSaved: (newValue) {
                      id = newValue!;
                    },
                    initialValue: id,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    initialValue: name,
                    validator: (value) {
                      if(value!.isEmpty) {
                        return "enter the value";
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                        label: Text("name")
                    ),
                    onSaved: (newValue) {
                      name = newValue;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    initialValue: password,
                    validator: (value) {
                      if(value!.isEmpty) {
                        return "enter the value";
                      } else {
                        return null;
                      }
                    },
                    onSaved: (newValue) {
                      password = newValue;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("password")

                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if(formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          UserModal user = UserModal(int.parse(id!), name!, password!);
                          FireStoreHelper.fireStoreHelper.creteUser(userModal: user);
                          Get.offNamed('/home',arguments: int.parse(id!));
                        }
                      },
                      child: const Text("Submit"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
