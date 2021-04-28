import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pigamers/src/constants.dart';
import 'package:pigamers/src/screens/authentication/auth_services.dart';
import 'package:velocity_x/velocity_x.dart';

import 'registration_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _mailCtrl = TextEditingController();
  TextEditingController _passwordCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var textColor = context.brightness == Brightness.light
        ? kContentColorLightTheme
        : kContentColorDarkTheme;
    return Scaffold(
      // backgroundColor: context.primaryColor,
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
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  "lib/src/assets/logo/logo_transparent.png",
                  height: 200,
                ),
                Text(
                  "Pi'Gamers",
                  style: GoogleFonts.newRocker(fontSize: 20),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: context.backgroundColor,
                      borderRadius: BorderRadius.circular(20)),
                  width: 423,
                  height: 400,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Spacer(),
                      "Se connecter"
                          .text
                          .textStyle(GoogleFonts.righteous(fontSize: 30))
                          .bold
                          .color(kPrimaryColor)
                          .make(),
                      "Ravi de te revoir"
                          .text
                          .color(textColor)
                          .textStyle(
                            GoogleFonts.barlow(fontSize: 15),
                          )
                          .make(),
                      Spacer(
                        flex: 2,
                      ),
                      CupertinoFormSection(
                        header: "Identifiants"
                            .text
                            .color(kPrimaryColor.withOpacity(0.7))
                            .make(),
                        backgroundColor: Colors.transparent,
                        children: [
                          CupertinoFormRow(
                            child: CupertinoTextFormFieldRow(
                              placeholder: "Entrez l'adresse email",
                              keyboardType: TextInputType.emailAddress,
                              controller: _mailCtrl,
                              style: GoogleFonts.barlow(
                                  fontSize: 15, color: textColor),
                            ),
                            prefix: "Email".text.color(textColor).make(),
                          ),
                          CupertinoFormRow(
                            child: CupertinoTextFormFieldRow(
                              placeholder: "mot de passe",
                              controller: _passwordCtrl,
                              obscureText: true,
                              keyboardType: TextInputType.name,
                              style: GoogleFonts.barlow(
                                  fontSize: 15, color: textColor),
                            ),
                            prefix: "mot de passe".text.color(textColor).make(),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () => AuthServices().signIn(
                          email: _mailCtrl.text.trim(),
                          password: _passwordCtrl.text.trim(),
                        ),
                        child: Container(
                          child: Text(
                            "Se connecter",
                            style: GoogleFonts.newRocker(fontSize: 20),
                          ).p12().centered(),
                          width: context.screenWidth * 0.6,
                          decoration: BoxDecoration(
                              color: kPrimaryColor.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(30)),
                        ).p20().centered(),
                      ),
                      Row(
                        children: [
                          "Tu n'as pas de compte?".text.color(textColor).make(),
                          GestureDetector(
                            onTap: () => context.nextPage(RegistrationScreen()),
                            child: "Créer un compte"
                                .text
                                .color(kFourthColor)
                                .make()
                                .px12(),
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                      Spacer(
                        flex: 3,
                      ),
                    ],
                  ).p24(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
