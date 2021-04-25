import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pigamers/src/screens/authentication/auth_services.dart';

class WebMode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Web Mode"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => AuthServices().signOut(),
        child: FaIcon(FontAwesomeIcons.signOutAlt),
      ),
    );
  }
}