


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:pigamers/src/logic/models/pi_news_model.dart';
import 'package:pigamers/src/logic/models/user_model.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> createNewUser({required UserModel user}) async {
    try {
      await _firestore
          .collection("users")
          .doc(user.id.toString())
          .set({
            "name": user.name,
            "email": user.email,
            "uid": user.id,
          })
          .then(
            (value) => Get.snackbar(
                "User created", "L'utilisateur ${user.name} a été créé"),
          )
          .catchError(
            (error) {
              printError(info: error.toString());
              Get.snackbar("Error Firestore", error.toString());
            },
          );
      return true;
    } catch (e) {
      Get.snackbar("Error User Creation", e.toString());
      return false;
    }
  }

  Future<UserModel> getUser({required String uid}) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection("users").doc(uid).get();
      Get.snackbar("Bienvenue à toi", doc["name"]);
      return UserModel.fromDocumentSnapshot(doc: doc);
    } catch (e) {
      Get.snackbar("Error getting User", e.toString());
      rethrow;
    }
  }

  Future<bool> addNews() async {
    try {
      await _firestore
          .collection("piNews")
          .add({
            "timeStamp": Timestamp.now(),
            "title": "Cottoumbro",
            "imgUrl":
                "https://images.pexels.com/photos/3945683/pexels-photo-3945683.jpeg?cs=srgb&dl=pexels-cottonbro-3945683.jpg&fm=jpg",
          })
          .then(
            (value) => Get.snackbar(
              "Success",
              "Pi'News Added",
            ),
          )
          .catchError(
            (error) {
              printError(info: error.toString());
              Get.snackbar("Error Firestore", error.toString());
            },
          );
      return true;
    } catch (e) {
      Get.snackbar("Error User Creation", e.toString());
      return false;
    }
  }

  Stream<List<PiNewsModel>> piNewsStream() {
    return _firestore
        .collection("piNews")
        .orderBy("timeStamp", descending: true)
        .snapshots()
        .map((QuerySnapshot piNews) {
      List<PiNewsModel> retVal = [];
      piNews.docs.forEach((element) {
        retVal.add(PiNewsModel.fromSnapshot(element));
      });
      return retVal;
    });
  }
}