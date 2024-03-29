import 'dart:developer';
import 'package:fire_base/export_app.dart';

class FireBaseHelper {
  FireBaseHelper._();
  static final FireBaseHelper fireBaseHelper = FireBaseHelper._();
  FirebaseFirestore firebaseStore = FirebaseFirestore.instance;
  String collection = "user";


  Future<Map<String,dynamic>> getUser({required int id}) async {
    DocumentSnapshot doc =
        await firebaseStore.collection(collection).doc('$id').get();

    return doc.data() as Map<String,dynamic>;
  }

  getUserNameUsingContact({required int contact}) async {
    Map<String,dynamic>? user = await getUser(id: contact);

    log('{[${user['name']}]}');
    return user;
  }

  Future<Map<String, dynamic>?> getAllUser({required int id}) async {
    DocumentSnapshot<Map< String, dynamic >> data =
    await firebaseStore.collection(collection).doc("$id").get();

    Map<String,dynamic>? allData = data.data();
    return allData;
  }

  getAllUserStream({required int id}) {
    Stream<DocumentSnapshot<Map<String,dynamic>>> data =
        firebaseStore.collection(collection).doc("$id").snapshots();

    Stream<dynamic> allData = data.map((event) => event.data());

    return allData;
  }

  validateUser({required int id, required String password}) async {
    DocumentSnapshot doc =
    await firebaseStore.collection(collection).doc(id.toString()).get();

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
    DocumentSnapshot snapshot = await firebaseStore.collection(collection).doc(id.toString()).get();

    Map<dynamic,dynamic> data = snapshot.data() as Map;
    return data["password"];
  }


  Stream allUserId() {
    Stream<QuerySnapshot<Map<String,dynamic>>> data =
        firebaseStore.collection(collection).snapshots();

    Stream<dynamic>  allData = data.map((event) => event.docs);
    return allData;
  }

  // addUser
  addUser({required FireStoreModal fireStoreModal}) {
    Map<String,dynamic> data = {
      "name": fireStoreModal.name,
      "id": fireStoreModal.id,
      "password": fireStoreModal.password,
      "contacts": [],
      "received" : {
        "001" : {
          "msg": ["Hi"],
          "time": ["18/01/24-02:10:10"],
        }
      },
      "sent": {
        "001": {
          "msg": ["Hello"],
          "time": ["18/01/24-02:10:11"],
        }
      }
    };
    firebaseStore.collection(collection).doc("${fireStoreModal.id}").set(data);
  }

  Stream<dynamic> userStream({required int receivedId}) {
    Stream<DocumentSnapshot<Map<String,dynamic>>> data =
    firebaseStore.collection(collection).doc("$receivedId").snapshots();

    Stream allData = data.map((event) => event.data());
    return allData;
  }

}
