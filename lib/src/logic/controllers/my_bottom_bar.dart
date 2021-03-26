import 'package:get/get.dart';
import 'package:pigamers/src/views/ui/screens/main_screens/apps_screen.dart';
import 'package:pigamers/src/views/ui/screens/main_screens/home_screen.dart';
import 'package:pigamers/src/views/ui/screens/main_screens/profile_screen.dart';
import 'package:pigamers/src/views/ui/screens/main_screens/settings_screen.dart';
// import 'package:meta/meta.dart';


class MyBottomNavBarController extends GetxController {
  var curentPage = PageEnum.HOME.obs;
  get getCurentPage {
    switch (curentPage.value) {
      case PageEnum.PROFILE:
        return ProfileScreen();
      // break;
      case PageEnum.APPS:
        return AppsScreen();
      // break;
      case PageEnum.SETTINGS:
        return SettingsScreen();
      // break;
      default:
        return HomeScreen();
    }
  }

  @override
  void onInit() {
    curentPage.value = PageEnum.HOME;
    super.onInit();
  }

  void changeScreen({required PageEnum screen}) {
    try {
      curentPage.value = screen;
      update();
    } catch (e) {
      print(e);
    }
  }
}

enum PageEnum { HOME, PROFILE, SETTINGS, APPS }