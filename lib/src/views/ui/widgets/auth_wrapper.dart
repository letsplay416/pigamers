import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pigamers/src/logic/controllers/auth_controller.dart';
import 'package:pigamers/src/views/ui/screens/auth_screens/login_screen.dart';
import 'package:pigamers/src/views/ui/screens/main_screens/home_screen.dart';

class AuthWrapper extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.user != null ? HomeScreen() : LoginScreen(),
    );
  }
}
