import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      backgroundColor: context.primaryColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: context.backgroundColor,
                  borderRadius: BorderRadius.circular(20)),
              width: 423,
              height: 500,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),
                  "Se connecter"
                      .text
                      .xl5
                      .bold
                      .color(context.theme.primaryColor)
                      .make(),
                  "Ravis de te revoir".text.color(textColor).xl2.make(),
                  Spacer(
                    flex: 2,
                  ),
                  CupertinoFormSection(
                    header: "Identifiants"
                        .text
                        .color(context.primaryColor.withOpacity(0.7))
                        .make(),
                    backgroundColor: Colors.transparent,
                    children: [
                      CupertinoFormRow(
                        child: CupertinoTextFormFieldRow(
                          placeholder: "Entrez l'adresse email",
                          keyboardType: TextInputType.emailAddress,
                          controller: _mailCtrl,
                        ),
                        prefix: "Email".text.color(textColor).make(),
                      ),
                      CupertinoFormRow(
                        child: CupertinoTextFormFieldRow(
                          placeholder: "Mots de passe",
                          controller: _passwordCtrl,
                          obscureText: true,
                          keyboardType: TextInputType.name,
                        ),
                        prefix: "Mots de passe".text.color(textColor).make(),
                      ),
                    ],
                  ),
                  Container(
                    child: TextButton(
                      onPressed: () => AuthServices().signIn(
                        email: _mailCtrl.text.trim(),
                        password: _passwordCtrl.text.trim(),
                      ),
                      child: Text("Se connecter"),
                      style: TextButton.styleFrom(primary: Colors.white),
                    ),
                    width: context.screenWidth * 0.6,
                    decoration: BoxDecoration(
                        color: context.primaryColor.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(30)),
                  ).p32().centered(),
                  Padding(
                    padding: const EdgeInsets.only(top: 35),
                    child: Row(
                      children: [
                        "Tu n'as pas de compte?".text.color(textColor).make(),
                        GestureDetector(
                          onTap: () => context.nextPage(RegistrationScreen()),
                          child: "Créer un compte"
                              .text
                              .color(context.primaryColor)
                              .make()
                              .px12(),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                  ),
                  Spacer(
                    flex: 3,
                  ),
                ],
              ).p24(),
            ),
          ),
        ),
      ),
    );
  }
}
