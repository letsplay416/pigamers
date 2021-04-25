import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
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
  bool showDad = false;
  String dadPseudo = "";
  TextEditingController _mailCtrl = TextEditingController();
  TextEditingController _pseudoCtrl = TextEditingController();
  TextEditingController _passwordCtrl = TextEditingController();
  TextEditingController _phoneCtrl = TextEditingController();
  TextEditingController _dadCtrl = TextEditingController();
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
              height: 860,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),
                  "Bienvenue Pi'Gamers"
                      .text
                      .xl4
                      .bold
                      .color(context.primaryColor)
                      .make(),
                  "Crée un compte pour commencer ton aventure"
                      .text
                      .color(textColor)
                      .xl2
                      .make(),
                  Spacer(
                    flex: 2,
                  ),
                  CupertinoFormSection(
                    header: "Infos personnelles"
                        .text
                        .color(context.primaryColor.withOpacity(0.7))
                        .make(),
                    backgroundColor: Colors.transparent,
                    children: [
                      CupertinoFormRow(
                        child: CupertinoTextFormFieldRow(
                          controller: _pseudoCtrl,
                          placeholder: "Choisi un nom d'utilisateur",
                          keyboardType: TextInputType.emailAddress,
                        ),
                        prefix: "Pseudo".text.color(textColor).make(),
                      ),
                      CupertinoFormRow(
                        child: CupertinoTextFormFieldRow(
                          controller: _phoneCtrl,
                          placeholder: "Ex: +33 ** ** ** **",
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
                          obscureText: true,
                          keyboardType: TextInputType.name,
                          controller: _passwordCtrl,
                        ),
                        prefix: "Mots de passe".text.color(textColor).make(),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CupertinoFormSection(
                    header: "Affiliation"
                        .text
                        .color(context.primaryColor.withOpacity(0.7))
                        .make(),
                    backgroundColor: Colors.transparent,
                    children: [
                      CupertinoFormRow(
                        child: CupertinoSwitch(
                            activeColor: context.primaryColor,
                            value: showDad,
                            onChanged: (z) {
                              setState(() {
                                showDad = z;
                              });
                            }),
                        prefix:
                            "As-tu un parrain?".text.color(textColor).make(),
                        helper: "Gagne un bonus!"
                            .text
                            .color(context.accentColor)
                            .sm
                            .make(),
                      ),
                      if (showDad)
                        CupertinoFormRow(
                          child: CupertinoTextFormFieldRow(
                            placeholder: "Id du parrain",
                            keyboardType: TextInputType.name,
                            controller: _dadCtrl,
                            onChanged: (value) async {
                              CollectionReference users = FirebaseFirestore
                                  .instance
                                  .collection('users');

                              await users
                                  .doc(_dadCtrl.text.trim())
                                  .get()
                                  .then((value) {
                                if (value.exists) {
                                  setState(() {
                                    dadPseudo = value.data()!['name'];
                                  });
                                } else {
                                  setState(() {
                                    dadPseudo = "";
                                  });
                                }
                              });
                            },
                          ),
                          prefix: "Id du parrain".text.color(textColor).make(),
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
                                    "et ".text.sm.make(),
                                    "$dadPseudo "
                                        .text
                                        .color(context.primaryColor)
                                        .sm
                                        .make(),
                                    "recevez 1 Croin chacun".text.sm.make(),
                                  ],
                                ),
                        ),
                    ],
                  ),
                  Container(
                    child: TextButton(
                      onPressed: () => AuthServices().registration(
                          email: _mailCtrl.text.trim(),
                          password: _passwordCtrl.text.trim(),
                          name: _pseudoCtrl.text.trim(),
                          dadId: "dadId",
                          dadCroins: showDad ? 1 : 0),
                      child: Text("Créer le compte"),
                      style: TextButton.styleFrom(primary: Colors.white),
                    ),
                    width: context.screenWidth * 0.6,
                    decoration: BoxDecoration(
                        color: context.primaryColor,
                        borderRadius: BorderRadius.circular(30)),
                  ).p32().centered(),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        "Tu n'es pas nouveau ici?".text.color(textColor).make(),
                        GestureDetector(
                          onTap: () => context.pop(),
                          child: "Connectes-toi"
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
