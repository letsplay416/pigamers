


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class DatabaseProfile {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> changeProfilData(
      {required String newData, required String type}) async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    try {
      await _firestore.collection("users").doc(uid).update({
        type: newData,
      });
    } catch (e) {
      Get.snackbar("Error getting User", e.toString());
      rethrow;
    }
  }
  
}