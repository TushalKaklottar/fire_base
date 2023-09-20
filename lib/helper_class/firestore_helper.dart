import 'package:cloud_firestore/cloud_firestore.dart';

import '../modals/create_user_modals.dart';

class FireStoreHelper {

  FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;
  String collection = "user";


  FireStoreHelper._();
  static final FireStoreHelper fireStoreHelper = FireStoreHelper._();

  creteUser({required UserModal userModal})  {
    Map<String,dynamic> user = {
      "name": userModal.name,
      "id": userModal.id,
      "password": userModal.password,
    };
    firebaseFireStore.collection(collection).doc("${userModal.id}").set(user);
  }
}