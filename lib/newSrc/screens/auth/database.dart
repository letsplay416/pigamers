



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:pigamers/newSrc/models/user_model.dart';
import 'package:pigamers/src/views/utils/app_strings.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> createNewUser(
      {required UserModel user,
      required double dadCroins,
      required String dadId}) async {
    try {
      await _firestore.collection("users").doc(user.id.toString()).set({
        "name": user.name,
        "email": user.email,
        "uid": user.id,
        "exp": user.exp,
        "profilPic": user.profilPic,
        "phoneNumber": "",
        "croins": 0.5,
        "flame": 100,
        "like": 0,
        "lastConnect": {
          "lastConnect": DateTime.now().millisecondsSinceEpoch,
          "onDay": 1
        },
      }).then((value) async {
        if (dadId != "") {
          await _firestore
              .collection("users")
              .doc(dadId)
              .update({"croins": dadCroins + 0.5}).catchError((errorr) {
            Get.snackbar(AppStrings.erreurParrain, errorr.toString());
          });
        } else {
          Get.snackbar(AppStrings.erreurParrain, dadId.length.toString());
        }
      }).catchError(
        (error) {
          printError(info: error.toString());
        },
      );
      return true;
    } catch (e) {
      Get.snackbar(AppStrings.errorUserCreate, e.toString());
      return false;
    }
  }

}
