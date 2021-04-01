import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:pigamers/src/logic/models/user_model.dart';
import 'package:pigamers/src/logic/services/database/database.dart';

class UserController extends GetxController {
  Rx<UserModel> _user =
      UserModel(email: "", id: "", name: "Newbie", exp: 0, profilPic: '').obs;
  set user(UserModel theUser) => this._user.value = theUser;
  UserModel get user =>
      _user.value;
  @override
  Future<void> onInit() async {
    _user.value =
        await Database().getUser(uid: FirebaseAuth.instance.currentUser!.uid);
    super.onInit();
  }

  void clear() {
    _user.value = UserModel(email: "", id: "", name: "", exp: 0, profilPic: '');
  }
}
