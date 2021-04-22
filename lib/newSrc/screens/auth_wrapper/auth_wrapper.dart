import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pigamers/newSrc/screens/LoadingScreen/loading_screen.dart';
import 'package:pigamers/newSrc/screens/WelcomeScreen/wecome_screen.dart';

import '../main_screen.dart';

class AuthWrapper extends StatefulWidget {
  @override
  _AuthWrapperState createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  void initState() {
    // Database().updateRessources();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream:  FirebaseAuth.instance.authStateChanges(),
     initialData: CircularProgressIndicator(),
  builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text("Something went wrong"));
        } else {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.data != null) {
              return MainScreen();
            } else {
              return WelcomeScreen();
            }
          } else {
            return 
            LoadingScreen();
          }
        }
      },
    );
  }
}
