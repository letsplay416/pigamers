import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthServices {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void signIn({required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Erreur de connexion", e.message.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void registration(
      {required String email,
      required String password,
      required String name,
      required String dadId,
      required double dadCroins}) async {
    try {
      _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        Get.snackbar("Ensuite", "Ajouter l'utilisateur a la base de donnée");
      });
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Erreur de connexion", e.message.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void signOut() async {
    try {
      await _firebaseAuth.signOut().then((value) => Get.snackbar(
          "Je suis déconnecté", "",
          snackPosition: SnackPosition.BOTTOM));
    } on FirebaseAuthException catch (e) {
      Get.snackbar("AppStrings.logoutFail", e.message.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
