import 'package:get/get.dart';
import 'package:pigamers/src/logic/models/user_model.dart';

class UserController extends GetxController {
  Rx<UserModel> _user = UserModel(email: "", id: "", name: "Newbie").obs;
  set user(UserModel theUser) => this._user.value = theUser;
  UserModel get user =>
      _user.value ?? UserModel(email: "", id: "", name: "Newbie");
  void clear() {
    _user.value = UserModel(email: "", id: "", name: "");
  }
}
