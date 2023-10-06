import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_base/modals/fire_store_modal.dart';

import '../modals/create_user_modals.dart';
import '../modals/get_user_modals.dart';

class FireBaseHelper {

  FireBaseHelper._();
  static final FireBaseHelper fireBaseHelper = FireBaseHelper._();
  FirebaseFirestore firebasestore = FirebaseFirestore.instance;
  String collection = "User";

  // add user
  // addUser({required FireStoreModal fireStoreModal}) {
  //   Map<String,dynamic> data = {
  //     "name": fireStoreModal.name,
  //     "id": fireStoreModal.id,
  //     "password": fireStoreModal.password,
  //   };
  //
  //   firebasestore.collection(collection).doc("${fireStoreModal.id}").set(data);
  // }
  creteUser({required UserModal userModal})  {
    Map<String,dynamic> user = {
      "id": userModal.id,
      "password": userModal.password,
    };
    log("user: $user");
    firebasestore.collection(collection).doc("${userModal.id}").set(user);
  }

  // validate user
  // validateUser({required int id, required String password}) async {
  //   DocumentSnapshot doc =
  //   await firebasestore.collection(collection).doc(id.toString()).get();
  //
  //   if (doc["id"] == id) {
  //     log("ID Is fund");
  //     if(doc["password"] == password) {
  //       log("Password Check");
  //     }
  //   } else {
  //     log("Id Not Exist");
  //   }
  //   return doc.data();
  // }

//   // get credential
//
// getCredential({required int id}) async {
//     DocumentSnapshot snapshot = await firebasestore.collection(collection).doc(id.toString()).get();
//
//     Map<dynamic,dynamic> data = snapshot.data() as Map;
//     return data["password"];
// }


//

  Future<List<GetUserModal>> getAllUser() async {
    QuerySnapshot data = await firebasestore.collection(collection).get();

    List<QueryDocumentSnapshot> allData = data.docs;

    List<GetUserModal> allUser = allData.map((e) => GetUserModal.fromMap(data: e.data() as Map)).toList();
    log("User: [$allUser] $allUser");
    return allUser;
  }
}