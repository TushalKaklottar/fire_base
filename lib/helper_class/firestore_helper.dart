import 'dart:developer';
import 'package:fire_base/export_app.dart';

class FireBaseHelper {
  FireBaseHelper._();
  static final FireBaseHelper fireBaseHelper = FireBaseHelper._();
  FirebaseFirestore firebasestore = FirebaseFirestore.instance;
  String collection = "user";



  validateUser({required int id, required String password}) async {
    DocumentSnapshot doc = await firebasestore.collection(collection).doc(id.toString()).get();

    if(doc["id"] == id) {
      log("Id Is fund");
      if(doc["password"] == password) {
        log("Password Check");
      }
    } else {
      Get.snackbar("Failed", "User Can't Axis..");
      log("Id not exists");
    }
    return doc.data();
  }


  getCredential({required int id}) async {
    DocumentSnapshot snapshot = await firebasestore.collection(collection).doc(id.toString()).get();

    Map<dynamic,dynamic> data = snapshot.data() as Map;
    return data["password"];
  }


  Future<Map<String, dynamic>?> getAllUser({required int id}) async {
    DocumentSnapshot<Map< String, dynamic >> data =
        await firebasestore.collection(collection).doc("$id").get();

    Map<String,dynamic>? allData = data.data();

    return allData;
  }


  addUser({required FireStoreModal fireStoreModal}) {
    Map<String,dynamic> data = {
      "name": fireStoreModal.name,
      "id": fireStoreModal.id,
      "password": fireStoreModal.password,

    };
    firebasestore.collection(collection).doc("${fireStoreModal.id}").set(data);
  }
}
