import 'dart:developer';
import 'package:fire_base/export_app.dart';
import 'package:fire_base/modals/fire_store_modal.dart';

class FireBaseHelper {
  FireBaseHelper._();
  static final FireBaseHelper fireBaseHelper = FireBaseHelper._();
  FirebaseFirestore firebasestore = FirebaseFirestore.instance;
  String collection = "user";


  adduser({required FireStoreModal fireStoreModal}) {
    Map<String,dynamic> data = {
     "name": fireStoreModal.name,
     "id": fireStoreModal.id,
     "password": fireStoreModal.password,
     "contact": [
       00,
     ],
      "received": {
       "000": {
         "msg": ["Hello"],
         "time": ["9/10/2023-9:33:23"],
       }
      },
      "sent": {
       "000": {
         "msg": [""],
         "time": [""],
       }
      }
    };
  }


  creteUser({required UserModal userModal})  {
    Map<String,dynamic> user = {
      "id": userModal.id,
      "password": userModal.password,
    };
    log("user: $user");
    firebasestore.collection(collection).doc("${userModal.id}").set(user);
  }

  // validate user
  validateUser({required int id, required String password}) async {
    DocumentSnapshot doc =
    await firebasestore.collection(collection).doc(id.toString()).get();

    if (doc["id"] == id) {
      log("ID Is fund");
      if(doc["password"] == password) {
        log("Password Check");
      }
    } else {
      log("Id Not Exist");
    }
    return doc.data();
  }

//   // get credential
//
getCredential({required int id}) async {
    DocumentSnapshot snapshot = await firebasestore.collection(collection).doc(id.toString()).get();

    Map<dynamic,dynamic> data = snapshot.data() as Map;
    return data["password"];
}


  Future<Map<String, dynamic>?> getAllUser({required int id}) async {
    DocumentSnapshot<Map<String, dynamic>> data =
    await firebasestore.collection(collection).doc("$id").get();

    Map<String, dynamic>? allData = data.data();
    return allData;
  }
}