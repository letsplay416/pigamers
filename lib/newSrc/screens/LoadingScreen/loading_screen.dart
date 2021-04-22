

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pigamers/src/views/utils/constants.dart';

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
          CircularProgressIndicator(
            backgroundColor: kSecondaryColor,
            // color: kContentColorDarkTheme.withOpacity(0.3),
          ),
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
