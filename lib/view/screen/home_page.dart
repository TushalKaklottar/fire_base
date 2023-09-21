import 'dart:developer';
import 'package:fire_base/helper_class/firestore_helper.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
