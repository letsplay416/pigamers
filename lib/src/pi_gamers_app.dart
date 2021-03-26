import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pigamers/src/views/ui/widgets/auth_wrapper.dart';
import 'package:pigamers/src/views/utils/app_strings.dart';

import 'logic/controllers/auth_controller.dart';
import 'logic/controllers/user_controller.dart';

class PiGamersApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Get.put(AuthController());
    // Get.put(MyBottomNavBarController());
    Get.put(UserController());
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
