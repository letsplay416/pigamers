


import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screens/authentication/auth_wrapper.dart';


class PiGamersApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthWrapper(),
      color: Theme.of(context).primaryColor,
      // theme: MyTheme().lightTheme,
      // title: AppStrings.appTitle,
      // darkTheme: MyTheme().darkTheme,
      // themeMode: ThemeService().getThemeMode(),
    );
  }
}
