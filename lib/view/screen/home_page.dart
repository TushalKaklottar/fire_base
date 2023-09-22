import 'dart:developer';
import 'package:fire_base/helper_class/firestore_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomePage extends StatelessWidget {
   HomePage({super.key});

   int id =  Get.arguments;

   @override
  Widget build(BuildContext context) {

    Size s = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: FutureBuilder(
          future: FireStoreHelper.fireStoreHelper.getAllUser(),
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                  itemBuilder: (context,index) {

                  }
              );
            } else if (snapshot.hasError) {
              log("$snapshot.error");
              return Text("${snapshot.error}");
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
