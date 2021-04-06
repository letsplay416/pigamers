import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:pigamers/src/logic/models/user_model.dart';
import 'package:pigamers/src/logic/services/database/database.dart';
import 'user_controller.dart';

class AuthController extends GetxController {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void signIn({required String email, required String password}) async {
    try {
      UserCredential authResult =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      Get.find<UserController>().user =
          await Database().getUser(uid: authResult.user!.uid);
      Get.snackbar("Connexion", "Vous êtes connecté",
          snackPosition: SnackPosition.BOTTOM);
      // Get.back();
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Echec de connexion", e.message.toString(),
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
      await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        Get.back();
        Get.snackbar(
          "Compte créé",
          value.user!.uid,
          snackPosition: SnackPosition.BOTTOM,
        );
        UserModel _user = UserModel(
            email: email,
            id: value.user!.uid,
            name: name,
            exp: 100,
            profilPic: '');
        if (await Database()
            .createNewUser(user: _user, dadId: dadId, dadCroins: dadCroins)) {
          Get.find<UserController>().user = _user;
          Get.snackbar(
            "User mis à jour",
            value.user!.uid,
            snackPosition: SnackPosition.BOTTOM,
          );
        } else {
          Get.snackbar(
            "Echec",
            "une erreur s'est produite",
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      });
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Echec de création de compte", e.message.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void signOut() async {
    try {
      await _firebaseAuth.signOut();
      Get.snackbar("Déconnexion", "Vous êtes déconnecté",
          snackPosition: SnackPosition.BOTTOM);
      Get.find<UserController>().clear();
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Echec de déconnexion", e.message.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
