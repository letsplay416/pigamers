import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:pigamers/src/logic/models/user_model.dart';
import 'package:pigamers/src/logic/services/database/database.dart';
import 'package:pigamers/src/views/utils/app_strings.dart';
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
    } on FirebaseAuthException catch (e) {
      Get.snackbar(AppStrings.echeConnection, e.message.toString(),
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
        UserModel _user = UserModel(
            email: email,
            id: value.user!.uid,
            name: name,
            exp: 100,
            profilPic: '');
        if (await Database()
            .createNewUser(user: _user, dadId: dadId, dadCroins: dadCroins)) {
          Get.find<UserController>().user = _user;
        } else {}
      });
    } on FirebaseAuthException catch (e) {
      Get.snackbar(AppStrings.echeCountCreation, e.message.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void signOut() async {
    try {
      await _firebaseAuth.signOut();
      Get.find<UserController>().clear();
    } on FirebaseAuthException catch (e) {
      Get.snackbar(AppStrings.logoutFail, e.message.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
