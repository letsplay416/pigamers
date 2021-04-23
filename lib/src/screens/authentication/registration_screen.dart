import 'package:flutter/cupertino.dart';
import 'package:pigamers/src/screens/authentication/auth_services.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({
    Key? key,
  }) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool showDad = false;
  TextEditingController _mailCtrl = TextEditingController();
  TextEditingController _pseudoCtrl = TextEditingController();
  TextEditingController _passwordCtrl = TextEditingController();
  TextEditingController _phoneCtrl = TextEditingController();
  TextEditingController _dadCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: Vx.m32,
            height: context.screenHeight - context.safePercentHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                "Bienvenue Pi'Gamers"
                    .text
                    .xl4
                    .bold
                    .color(context.theme.primaryColor)
                    .make(),
                "Crée un compte pour commencer ton aventure".text.xl2.make(),
                Spacer(
                  flex: 2,
                ),
                CupertinoFormSection(
                  header: "Infos personnelles".text.make(),
                  children: [
                    CupertinoFormRow(
                      child: CupertinoTextFormFieldRow(
                        controller: _pseudoCtrl,
                        placeholder: "Choisi un nom d'utilisateur",
                        keyboardType: TextInputType.emailAddress,
                      ),
                      prefix: "Pseudo".text.make(),
                    ),
                    CupertinoFormRow(
                      child: CupertinoTextFormFieldRow(
                        controller: _phoneCtrl,
                        placeholder: "Ex: +33 ** ** ** **",
                        keyboardType: TextInputType.phone,
                      ),
                      prefix: "Numéro".text.make(),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                CupertinoFormSection(
                  header: "Identifiants".text.make(),
                  children: [
                    CupertinoFormRow(
                      child: CupertinoTextFormFieldRow(
                        placeholder: "Entrez l'adresse email",
                        keyboardType: TextInputType.emailAddress,
                        controller: _mailCtrl,
                      ),
                      prefix: "Email".text.make(),
                    ),
                    CupertinoFormRow(
                      child: CupertinoTextFormFieldRow(
                        placeholder: "Mots de passe",
                        obscureText: true,
                        keyboardType: TextInputType.name,
                        controller: _passwordCtrl,
                      ),
                      prefix: "Mots de passe".text.make(),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                CupertinoFormSection(
                  header: "Affiliation".text.make(),
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
                      prefix: "As-tu un parrain?".text.make(),
                      helper: "Gagne un bonus!"
                          .text
                          .color(context.primaryColor)
                          .sm
                          .make(),
                    ),
                    if (showDad)
                      CupertinoFormRow(
                        child: CupertinoTextFormFieldRow(
                          placeholder: "Id du parrain",
                          keyboardType: TextInputType.name,
                          controller: _dadCtrl,
                          onChanged: (value) {
                            setState(() {});
                          },
                        ),
                        prefix: "Id du parrain".text.make(),
                        helper: _dadCtrl.text.isEmpty
                            ? "Pas de Parrain".text.color(Colors.red).sm.make()
                            : "Vous et Pseudo recevez 1 Croin chacun"
                                .text
                                .color(context.primaryColor)
                                .sm
                                .make(),
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
                      "Tu n'es pas nouveau ici?".text.make(),
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
            ),
          ),
        ),
      ),
    );
  }
}
