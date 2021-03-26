import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pigamers/src/logic/controllers/pi_ads_controller.dart';
import 'package:pigamers/src/logic/controllers/pi_events_controller.dart';
import 'package:pigamers/src/logic/controllers/pi_news_controller.dart';
import 'package:pigamers/src/views/ui/widgets/auth_wrapper.dart';
import 'package:pigamers/src/views/utils/app_strings.dart';

import 'logic/controllers/auth_controller.dart';
import 'logic/controllers/my_bottom_nav_bar.dart';
import 'logic/controllers/user_controller.dart';

class PiGamersApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());
    Get.put(PiEventsController());
    Get.put(PiAdsController());
    Get.put(MyBottomNavBarController());
    Get.put(UserController());
    Get.put(PiNewsController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthWrapper(),
      title: AppStrings.appTitle,
      // initialBinding: AuthBinding(),
      // theme: lightThemeData(context),
      // darkTheme: darkThemeData(context),
      themeMode: ThemeMode.system,
    );
  }
}
