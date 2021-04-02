import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pigamers/src/views/utils/constants.dart';

class MyTheme {
  final lightTheme = ThemeData.light().copyWith(
      primaryColor: kSecondaryColor,
      accentColor: kFourthColor,
      accentColorBrightness: Brightness.light,
      backgroundColor: kContentColorLightTheme,
      brightness: Brightness.light,
      textTheme: GoogleFonts.aclonicaTextTheme()
          .copyWith(headline1: TextStyle(color: kFourthColor)),
      appBarTheme: AppBarTheme(
        brightness: Brightness.light,
        textTheme: TextTheme(
          headline1: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      buttonColor: kSecondaryColor);
  final darkTheme = ThemeData.dark().copyWith(
      primaryColor: kPrimaryColor,
      appBarTheme: AppBarTheme(
        brightness: Brightness.dark,
        textTheme: TextTheme(
          headline1: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      buttonColor: kPrimaryColor);
}
