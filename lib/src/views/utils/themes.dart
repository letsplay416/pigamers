import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pigamers/src/views/utils/constants.dart';

class MyTheme {
  final lightTheme = ThemeData.light().copyWith(
      primaryColor: kSecondaryColor,
      accentColor: kFourthColor,
      accentColorBrightness: Brightness.light,
      backgroundColor: kContentColorDarkTheme,
      brightness: Brightness.light,
      textTheme: TextTheme(
        headline1: GoogleFonts.aclonica(
          color: kPrimaryColor,
          fontSize: 26,
          fontWeight: FontWeight.bold,
        ),
        headline2: GoogleFonts.roboto(
          color: kContentColorLightTheme,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        headline3: GoogleFonts.abel(
          color: kThirdColor,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        subtitle1: GoogleFonts.aclonica(
          color: kContentColorLightTheme,
          fontSize: 12,
          fontWeight: FontWeight.w300,
        ),
      ),
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
      accentColor: kFourthColor,
      backgroundColor: kContentColorLightTheme,
      brightness: Brightness.dark,
      textTheme: TextTheme(
        headline1: GoogleFonts.aclonica(
          color: kPrimaryColor,
          fontSize: 26,
          fontWeight: FontWeight.bold,
        ),
        headline2: GoogleFonts.roboto(
          color: kContentColorDarkTheme,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        headline3: GoogleFonts.abel(
          color: kThirdColor,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        subtitle1: GoogleFonts.aclonica(
          color: kContentColorDarkTheme,
          fontSize: 12,
          fontWeight: FontWeight.w300,
        ),
      ),
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
