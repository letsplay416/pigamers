import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/sockets/src/sockets_io.dart';
import 'package:pigamers/src/logic/controllers/auth_controller.dart';
import 'package:pigamers/src/views/ui/screens/main_screens.dart';
import 'package:pigamers/src/views/ui/screens/welcome_screen.dart';

class AuthWrapper extends StatefulWidget {
  @override
  _AuthWrapperState createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      initialData: CircularProgressIndicator(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text("Something went wrong"));
        } else {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.data != null) {
              return MainScreens();
            } else {
              return WelcomeScreen();
            }
          } else {
            return Center(child: Text("Loading"));
          }
        }
      },
    );

    // return Obx(
    //   () => controller.user != null ? MainScreens() : WelcomeScreen(),
    // );
  }
}
