import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screens/authentication/auth_wrapper.dart';
import 'services/theme_service.dart';
import 'theme.dart';

class PiGamersApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthWrapper(),
      color: Theme.of(context).primaryColor,
      theme: MyTheme().lightTheme,
      title: "PiGamers 🐽",
      darkTheme: MyTheme().darkTheme,
      themeMode: ThemeService().getThemeMode(),
    );
  }
}
