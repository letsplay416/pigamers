



import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
class LoadingScreen extends StatelessWidget {
  const LoadingScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      body: Center(
        child: "Loading".text.make(),
      ),
    );
  }
}