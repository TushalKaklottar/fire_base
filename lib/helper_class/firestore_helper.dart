import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_base/modals/get_user_modals.dart';
import '../modals/create_user_modals.dart';

class FireStoreHelper {

  FireStoreHelper._();
  static final FireStoreHelper fireStoreHelper = FireStoreHelper._();



  FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;
  String collection = "user";

// add user
  creteUser({required UserModal userModal})  {
    Map<String,dynamic> user = {
      "name": userModal.name,
      "id": userModal.id,
      "password": userModal.password,
    };
    log("user: $user");
    firebaseFireStore.collection(collection).doc("${userModal.id}").set(user);
  }


  // Get allUser
  Future<List<GetUserModal>> getAllUser() async {
    QuerySnapshot data = await firebaseFireStore.collection(collection).get();

    List<QueryDocumentSnapshot> allData = data.docs;

    List<GetUserModal> allUser = allData.map((e) => GetUserModal.fromMap(data: e.data() as Map)).toList();
    log("User: [$allUser] $allUser");
    return allUser;
   }
}