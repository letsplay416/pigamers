import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../constants.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: context.screenHeight,
        width: context.screenWidth,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              kPrimaryColor,
              kContentColorLightTheme,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Image.asset(
            "lib/src/assets/logo/logo_transparent.png",
            height: 200,
          ),
        ),
      ),
    );
  }
}
