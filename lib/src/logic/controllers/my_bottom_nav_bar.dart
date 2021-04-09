import 'package:get/get.dart';
import 'package:pigamers/src/views/ui/screens/main_screens/home_screen.dart';
import 'package:pigamers/src/views/ui/screens/main_screens/ranking_screen.dart';
import 'package:pigamers/src/views/ui/screens/main_screens/profile_screen.dart';

class MyBottomNavBarController extends GetxController {
  var curentPage = PageEnum.HOME.obs;
  RxBool showIt = true.obs;
  get getCurentPage {
    switch (curentPage.value) {
      case PageEnum.RANKING:
        return RankingScreen();
      case PageEnum.PROFILE:
        return SettingsScreen();
      default:
        return HomeScreen();
    }
  }

  bool get isShowen => showIt.value;
  @override
  void onInit() {
    curentPage.value = PageEnum.HOME;
    super.onInit();
  }

  void changeShowIt(bool val) {
    showIt.value = showIt.value = val;
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

enum PageEnum { HOME, RANKING, PROFILE }
