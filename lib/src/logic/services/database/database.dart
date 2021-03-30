import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:pigamers/src/logic/models/pi_ads_model.dart';
import 'package:pigamers/src/logic/models/pi_events_model.dart';
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
            "exp": user.exp,
            "profilPic": user.profilPic,
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
      Get.back();
      // Get.snackbar("Bienvenue à toi", doc["name"]);
      return UserModel.fromDocumentSnapshot(doc: doc);
    } catch (e) {
      Get.snackbar("Error getting User", e.toString());
      rethrow;
    }
  }

  Future<bool> addNews() async {
    try {
      await _firestore
          .collection("piAds")
          .add({
            "timeStamp": Timestamp.now(),
            "title": "Sherina",
            "imgUrl":
                "https://image.freepik.com/free-psd/luxury-minimalist-logo-mockup-dark-business-card_225928-113.jpg",
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

  Stream<List<PiAdsModel>> piAdsStream() {
    return _firestore
        .collection("piAds")
        .orderBy("timeStamp", descending: true)
        .snapshots()
        .map((QuerySnapshot piNews) {
      List<PiAdsModel> retVal = [];
      piNews.docs.forEach((element) {
        retVal.add(PiAdsModel.fromSnapshot(element));
      });
      return retVal;
    });
  }

  Stream<List<PiEventsModel>> piEventsStream() {
    return _firestore
        .collection("piEvents")
        .orderBy("timeStamp", descending: true)
        .snapshots()
        .map((QuerySnapshot piNews) {
      List<PiEventsModel> retVal = [];
      piNews.docs.forEach((element) {
        retVal.add(PiEventsModel.fromSnapshot(element));
      });
      return retVal;
    });
  }
}
