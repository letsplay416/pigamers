import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pigamers/src/logic/models/user_model.dart';
import 'package:pigamers/src/logic/services/database/database.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'user_controller.dart';

class AuthController extends GetxController {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Rx<User> _firebaseUser = Rx<User>();

  // set obj(value) => this._obj.value = value;
  get user => this._firebaseUser.value;
  @override
  void onInit() {
    _firebaseUser.bindStream(_firebaseAuth.authStateChanges());
    super.onInit();
  }

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
      Get.back();
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Echec de connexion", e.message.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void registration(
      {required String email,
      required String password,
      required String name}) async {
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
        );
        if (await Database().createNewUser(user: _user)) {
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

  Future<void> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount googleUser = (await GoogleSignIn().signIn())!;

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      UserCredential authResult =
          await FirebaseAuth.instance.signInWithCredential(credential);
      Get.find<UserController>().user =
          await Database().getUser(uid: authResult.user!.uid);
      Get.snackbar("Connexion", "Vous êtes connecté",
          snackPosition: SnackPosition.BOTTOM);
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Echec de connexion", e.message.toString(),
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
