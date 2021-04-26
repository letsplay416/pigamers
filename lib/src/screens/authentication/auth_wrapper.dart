import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pigamers/src/screens/authentication/auth_services.dart';
import 'package:pigamers/src/screens/main_screen/main_screen.dart';

import 'package:velocity_x/velocity_x.dart';

import '../other/error_screen.dart';
import '../other/loading_screen.dart';
import 'login_screen.dart';

class AuthWrapper extends StatefulWidget {
  @override
  _AuthWrapperState createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  void initState() {
    AuthServices().updateRessources();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      initialData: CircularProgressIndicator(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return ErrorScreen(
            texte: 'Erreur D\'autentification',
          );
        } else {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.data != null) {
              return MainScreen();
            } else {
              return LoginScreen();
            }
          } else {
            return LoadingScreen();
          }
        }
      },
    );
  }
}

class WebLoginScreen extends StatelessWidget {
  const WebLoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: "Web Welcome Screen".text.make(),
      ),
    );
  }
}
