import 'package:flutter/material.dart';
import 'package:pigamers/src/screens/authentication/auth_services.dart';
import 'package:velocity_x/velocity_x.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () => AuthServices().signOut(),
          child: "Déconnexion".text.color(Colors.red).make().px12(),
        ),
      ),
    );
  }
}
