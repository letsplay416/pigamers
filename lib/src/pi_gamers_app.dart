import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pigamers/src/logic/controllers/pi_ads_controller.dart';
import 'package:pigamers/src/logic/controllers/pi_events_controller.dart';
import 'package:pigamers/src/logic/controllers/pi_news_controller.dart';
import 'package:pigamers/src/logic/services/theme_service.dart';
import 'package:pigamers/src/views/ui/widgets/auth_wrapper.dart';
import 'package:pigamers/src/views/utils/app_strings.dart';
import 'package:pigamers/src/views/utils/themes.dart';

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
      color: Theme.of(context).primaryColor,
      theme: MyTheme().lightTheme,
      title: AppStrings.appTitle,
      darkTheme: MyTheme().darkTheme,
      themeMode: ThemeService().getThemeMode(),
    );
  }
}
