import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_base/modals/fire_store_modal.dart';
import 'package:fire_base/modals/get_user_modals.dart';
import '../modals/create_user_modals.dart';

class FireStoreHelper {

  FireStoreHelper._();
  static final FireStoreHelper fireStoreHelper = FireStoreHelper._();



  FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;
  String collection = "user";

// add user
addUser({required FireStoreModal fireStoreModal}) {
  Map<String,dynamic> data = {
    "name": fireStoreModal.name,
    "id": fireStoreModal.id,
    "password": fireStoreModal.password,
  };
  firebaseFireStore.collection(collection).doc("$fireStoreModal.id").set(data);
}


  // Get allUser
  Future<List<GetUserModal>> getAllUser() async {
    QuerySnapshot data = await firebaseFireStore.collection(collection).get();

    List<QueryDocumentSnapshot> allData = data.docs;

    List<GetUserModal> allUser = allData.map((e) => GetUserModal.fromMap(data: e.data() as Map)).toList();
    log("User: [$allUser] $allUser");
    return allUser;
   }





   validateUser({required int id, required String password}) async {
    DocumentSnapshot doc = await firebaseFireStore.collection(collection).doc(id.toString()).get();

    if (doc["id"] == id) {
      log("Id Is Fund");
      if(doc["password"] == password) {
        log("password check");
      }
    } else {
     log("ID Not Exist");
    }
    return doc.data();
   }

   getCredential({required int id}) async {
  DocumentSnapshot snapshot = await firebaseFireStore.collection(collection).doc(id.toString()).get();

  Map<dynamic,dynamic> data = snapshot.data() as Map;

  return data["password"];

   }
}