import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pigamers/src/screens/authentication/auth_services.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter/material.dart';

import '../../constants.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({
    Key? key,
  }) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String dadPseudo = "";
  String dadId = "";
  double dadCroins = 0;
  TextEditingController _mailCtrl = TextEditingController();
  TextEditingController _pseudoCtrl = TextEditingController();
  TextEditingController _passwordCtrl = TextEditingController();
  TextEditingController _phoneCtrl = TextEditingController();
  TextEditingController _dadCtrl = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var textColor = context.brightness == Brightness.light
        ? kContentColorLightTheme
        : kContentColorDarkTheme;
    return Scaffold(
      backgroundColor: context.primaryColor,
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
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: context.backgroundColor,
                      borderRadius: BorderRadius.circular(20)),
                  width: 423,
                  height: 850,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Spacer(),
                      "Bienvenue Pi'Gamers"
                          .text
                          .xl4
                          .bold
                          .textStyle(GoogleFonts.righteous(fontSize: 30))
                          .color(kPrimaryColor)
                          .make(),
                      "Crée un compte pour commencer ton aventure"
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
                        header: "Infos personnelles"
                            .text
                            .color(kPrimaryColor.withOpacity(0.7))
                            .textStyle(
                              GoogleFonts.barlow(fontSize: 15),
                            )
                            .make(),
                        backgroundColor: Colors.transparent,
                        children: [
                          CupertinoFormRow(
                            child: CupertinoTextFormFieldRow(
                              controller: _pseudoCtrl,
                              placeholder: "Choisi un nom d'utilisateur",
                              style: GoogleFonts.barlow(
                                  fontSize: 15, color: textColor),
                              validator: (value) {
                                if (value!.isNotEmpty) {
                                  return null;
                                } else {
                                  return "Renseigne un pseudo";
                                }
                              },
                              keyboardType: TextInputType.emailAddress,
                            ),
                            prefix: "Pseudo".text.color(textColor).make(),
                          ),
                          CupertinoFormRow(
                            child: CupertinoTextFormFieldRow(
                              controller: _phoneCtrl,
                              placeholder: "Ex: +33 ** ** ** **",
                              style: GoogleFonts.barlow(
                                  fontSize: 15, color: textColor),
                              keyboardType: TextInputType.phone,
                            ),
                            prefix: "Numéro".text.color(textColor).make(),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      CupertinoFormSection(
                        header: "Identifiants"
                            .text
                            .color(kPrimaryColor.withOpacity(0.7))
                            .textStyle(
                              GoogleFonts.barlow(fontSize: 15),
                            )
                            .make(),
                        backgroundColor: Colors.transparent,
                        children: [
                          CupertinoFormRow(
                            child: CupertinoTextFormFieldRow(
                              placeholder: "Entrez l'adresse email",
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value!.isNotEmpty && value.contains("@")) {
                                  return null;
                                } else {
                                  return "Renseigne un bon mail";
                                }
                              },
                              style: GoogleFonts.barlow(
                                  fontSize: 15, color: textColor),
                              controller: _mailCtrl,
                            ),
                            prefix: "Email".text.color(textColor).make(),
                          ),
                          CupertinoFormRow(
                            child: CupertinoTextFormFieldRow(
                              placeholder: "mot de passe",
                              obscureText: true,
                              validator: (value) {
                                if (value!.isNotEmpty && value.length > 4) {
                                  return null;
                                } else {
                                  return "Renseigne un bon mot de passe";
                                }
                              },
                              style: GoogleFonts.barlow(
                                  fontSize: 15, color: textColor),
                              keyboardType: TextInputType.name,
                              controller: _passwordCtrl,
                            ),
                            prefix: "mot de passe".text.color(textColor).make(),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      CupertinoFormSection(
                        header: "Affiliation"
                            .text
                            .color(kPrimaryColor.withOpacity(0.7))
                            .textStyle(
                              GoogleFonts.barlow(fontSize: 15),
                            )
                            .make(),
                        backgroundColor: Colors.transparent,
                        children: [
                          CupertinoFormRow(
                            child: CupertinoTextFormFieldRow(
                              placeholder: "Id du parrain",
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value!.isNotEmpty) {
                                  return null;
                                } else {
                                  return "Tu es obligé d'avoir un parrain";
                                }
                              },
                              controller: _dadCtrl,
                              style: GoogleFonts.barlow(
                                  fontSize: 15, color: textColor),
                              onChanged: (value) async {
                                CollectionReference users = FirebaseFirestore
                                    .instance
                                    .collection('users');

                                if (_dadCtrl.text.isNotEmpty)
                                  await users
                                      .doc(_dadCtrl.text.trim())
                                      .get()
                                      .then((value) {
                                    if (value.exists) {
                                      setState(() {
                                        dadPseudo = value.data()!['name'];
                                        dadId = value.data()!['uid'];
                                        dadCroins =
                                            value.data()!['croins'].toDouble();
                                      });
                                    } else {
                                      setState(() {
                                        dadPseudo = "";
                                        dadCroins = 0;
                                      });
                                    }
                                  });
                              },
                            ),
                            prefix:
                                "Id du parrain".text.color(textColor).make(),
                            helper: dadPseudo == ""
                                ? "Pas de Parrain"
                                    .text
                                    .color(Colors.red)
                                    .sm
                                    .make()
                                : Wrap(
                                    children: [
                                      "Vous "
                                          .text
                                          .color(context.primaryColor)
                                          .sm
                                          .make(),
                                      "et ".text.color(textColor).sm.make(),
                                      "$dadPseudo "
                                          .text
                                          .color(context.primaryColor)
                                          .sm
                                          .make(),
                                      "recevez votre récompense"
                                          .text
                                          .color(textColor)
                                          .sm
                                          .make(),
                                    ],
                                  ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            AuthServices().registration(
                                email: _mailCtrl.text.trim(),
                                password: _passwordCtrl.text.trim(),
                                number: _phoneCtrl.text.trim(),
                                name: _pseudoCtrl.text.trim(),
                                dadId: dadId,
                                dadCroins: dadCroins);
                          } else {}
                        },
                        child: Container(
                          child: Text(
                            "C'est parti !",
                            style: GoogleFonts.newRocker(fontSize: 20),
                          ).p12().centered(),
                          width: context.screenWidth * 0.6,
                          decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(30)),
                        ).p32().centered(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          children: [
                            "Tu n'es pas nouveau ici?"
                                .text
                                .color(textColor)
                                .make(),
                            GestureDetector(
                              onTap: () => context.pop(),
                              child: "Connectes-toi"
                                  .text
                                  .color(kFourthColor)
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
        ),
      ),
    );
  }
}
