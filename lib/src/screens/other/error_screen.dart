



import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
class ErrorScreen extends StatelessWidget {
  final String texte;

  const ErrorScreen({Key? key, required this.texte}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: texte.text.make(),
      ),
    );
  }
}