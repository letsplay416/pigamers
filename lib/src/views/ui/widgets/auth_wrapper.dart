import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pigamers/src/views/ui/screens/main_screens.dart';
import 'package:pigamers/src/views/ui/screens/welcome_screen.dart';
import 'package:pigamers/src/views/utils/constants.dart';

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
            return LoadingScreen();
          }
        }
      },
    );
  }
}

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: SizedBox(
              width: double.infinity,
            ),
          ),
          Expanded(
            flex: 3,
            child: Image.asset(
              "lib/src/assets/logo/logo_transparent.png",
            ),
          ),
          CircularProgressIndicator(backgroundColor: kSecondaryColor,color: kContentColorDarkTheme.withOpacity(0.3),),
          Expanded(
            child: SizedBox(
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Pi'Gamers",
              style: GoogleFonts.almendra(fontSize: 30),
            ),
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}
