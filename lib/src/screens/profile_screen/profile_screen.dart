import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pigamers/src/screens/authentication/auth_services.dart';
import 'package:pigamers/src/screens/profile_screen/database.dart';
import 'package:pigamers/src/services/theme_service.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../constants.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DocumentReference user = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () => ThemeService().changeThemeMode(),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Builder(
                builder: (context) => !Get.isDarkMode
                    ? FaIcon(
                        FontAwesomeIcons.lightbulb,
                        size: 30,
                        color: kContentColorLightTheme,
                      )
                    : FaIcon(
                        FontAwesomeIcons.solidLightbulb,
                        size: 30,
                        color: kThirdColor,
                      ),
              ),
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Profile Screen",
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: FutureBuilder(
        future: user.get(),
        initialData: Container(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                  width: 150,
                  child: Stack(
                    fit: StackFit.expand,
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: kPrimaryColor, shape: BoxShape.circle),
                        padding: const EdgeInsets.all(3),
                        child: CircleAvatar(
                          backgroundImage:
                              NetworkImage(snapshot.data["profilPic"]),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 3,
                        child: SizedBox(
                          height: 40,
                          width: 40,
                          child: TextButton(
                            onPressed: () => Get.snackbar("Statut V.I.P requis",
                                "Besoin du statut V.I.P pour modifier sa photo de profile",
                                duration: Duration(seconds: 5)),
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<OutlinedBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50))),
                              side: MaterialStateProperty.all<BorderSide>(
                                  BorderSide(width: 1, color: kPrimaryColor)),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Theme.of(context).backgroundColor,
                              ),
                            ),
                            child: WebsafeSvg.asset(
                              "lib/src/assets/svg/fi-br-mode-portrait.svg",
                              // height: 17,
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RessourceWidget(
                        number: snapshot.data["flame"].toString(),
                        title: "Les Flames",
                        desc:
                            "Flammes en anglais, tu les gagnes en te connectant quotidiennement. Elles te font grimper dans le classement et te rendent visible par tous",
                        icon: FontAwesomeIcons.fire,
                        color: Colors.redAccent),
                    RessourceWidget(
                        number: snapshot.data["croins"].toString(),
                        title: "Les Croins",
                        desc:
                            "Les Croins???Ils sont la devise principale de Pi'Gamers,Grâce à eux tu peux participer à nos lives,et aussi les gagner tout en parrainant d'autres personnes, ",
                        icon: FontAwesomeIcons.coins,
                        color: Colors.yellow),
                    RessourceWidget(
                        title: "Les Exp",
                        desc:
                            "Gagne les en effectuant des activités. Leur valeur est faible mais grimpe assez vite",
                        number: snapshot.data["exp"].toString(),
                        icon: FontAwesomeIcons.chartLine,
                        color: Get.isDarkMode
                            ? Colors.white
                            : kContentColorLightTheme),
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  height: 20,
                ),
                SettingBtn(
                  action: () {
                    TextEditingController _textFieldController =
                        TextEditingController();
                    Get.dialog(
                      AlertDialog(
                        actions: [
                          OutlinedButton(
                            style: ButtonStyle(
                              overlayColor: MaterialStateProperty.all<Color>(
                                Theme.of(context).primaryColor,
                              ),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                Colors.red,
                              ),
                              shadowColor: MaterialStateProperty.all<Color>(
                                Colors.red,
                              ),
                            ),
                            onPressed: () => Get.back(),
                            child: Text("Annuler"),
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Theme.of(context).primaryColor,
                              ),
                              shadowColor: MaterialStateProperty.all<Color>(
                                Theme.of(context).primaryColor.withOpacity(0.4),
                              ),
                              overlayColor: MaterialStateProperty.all<Color>(
                                Theme.of(context).primaryColor.withOpacity(0.4),
                              ),
                            ),
                            onPressed: () async {
                              DatabaseProfile().changeProfilData(
                                  type: "name",
                                  newData: _textFieldController.text.trim());
                              Get.back();
                              Get.snackbar("Succès", "En cours d'analyse");
                            },
                            child: Text("Appliquer"),
                          ),
                        ],
                        title: Text('Saisir le nouveau pseudo'),
                        backgroundColor: Theme.of(context).backgroundColor,
                        content: TextField(
                          keyboardType: TextInputType.name,
                          maxLength: 16,
                          controller: _textFieldController,
                          decoration: InputDecoration(
                            hintText: "Ex: NoobMaster86",
                          ),
                        ),
                      ),
                    );
                  },
                  title: snapshot.data["name"],
                  icon: "lib/src/assets/svg/user.svg",
                ),
                SettingBtn(
                  action: () {
                    Get.snackbar("Statut V.I.P requis",
                        "Besoin du statut V.I.P. pour modifier son e-mail. Contactez le support pour plus d'infos.",
                        duration: Duration(seconds: 5));
                  },
                  title: snapshot.data["email"],
                  icon: "lib/src/assets/svg/fi-br-envelope.svg",
                ),
                SettingBtn(
                  title: snapshot.data["phoneNumber"] == ""
                      ? "Ajoute un numéro pour être au courant"
                      : snapshot.data["phoneNumber"],
                  icon: "lib/src/assets/svg/smartphone.svg",
                  action: () {
                    TextEditingController _textFieldController =
                        TextEditingController();
                    Get.dialog(
                      AlertDialog(
                        actions: [
                          OutlinedButton(
                            style: ButtonStyle(
                              overlayColor: MaterialStateProperty.all<Color>(
                                Theme.of(context).primaryColor,
                              ),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                Colors.red,
                              ),
                              shadowColor: MaterialStateProperty.all<Color>(
                                Colors.red,
                              ),
                            ),
                            onPressed: () => Get.back(),
                            child: Text("Annuler"),
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Theme.of(context).primaryColor,
                              ),
                              shadowColor: MaterialStateProperty.all<Color>(
                                Theme.of(context).primaryColor.withOpacity(0.4),
                              ),
                              overlayColor: MaterialStateProperty.all<Color>(
                                Theme.of(context).primaryColor.withOpacity(0.4),
                              ),
                            ),
                            onPressed: () async {
                              DatabaseProfile().changeProfilData(
                                  type: "phoneNumber",
                                  newData: _textFieldController.text.trim());
                              Get.back();
                              Get.snackbar("Succès", "En cours d'analyse");
                            },
                            child: Text("Appliquer"),
                          ),
                        ],
                        title: Text('Saisir le nouveau numéro'),
                        backgroundColor: Theme.of(context).backgroundColor,
                        content: TextField(
                          keyboardType: TextInputType.phone,
                          controller: _textFieldController,
                          decoration: InputDecoration(
                            hintText: "Ex: +229 90 23 34 12",
                          ),
                        ),
                      ),
                    );
                  },
                ),
                SettingBtn(
                  title: "Clique pour copier ton Id",
                  icon: "lib/src/assets/svg/fi-br-cursor.svg",
                  action: () {
                    String uid = FirebaseAuth.instance.currentUser!.uid;
                    Clipboard.setData(new ClipboardData(text: uid));
                    Get.snackbar("Id copié", uid,
                        duration: Duration(seconds: 5));
                  },
                ),
                SettingBtn(
                  title: "Se déconnecter",
                  icon: "lib/src/assets/svg/fi-br-power.svg",
                  isRed: true,
                  action: () => AuthServices().signOut(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class RessourceWidget extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String number;
  final String title;
  final String desc;
  const RessourceWidget({
    Key? key,
    required this.icon,
    required this.color,
    required this.number,
    required this.title,
    required this.desc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.defaultDialog(
        title: title,
        content: Text(desc),
        backgroundColor: Get.theme!.backgroundColor.withOpacity(0.8),
        titleStyle: TextStyle(color: color),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 80,
          width: 60,
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FaIcon(
                icon,
                color: color,
              ),
              Text(
                number,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: color),
              )
            ],
          )),
          decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                width: 1,
                color: color,
              ),
              boxShadow: [
                BoxShadow(color: color, blurRadius: 6, spreadRadius: 1)
              ]),
        ),
      ),
    );
  }
}

class SettingBtn extends StatelessWidget {
  final bool isRed;
  final String title;
  final Function action;
  final String icon;
  const SettingBtn(
      {Key? key,
      required this.title,
      required this.icon,
      required this.action,
      this.isRed = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: isRed ? 60 : 20.0, vertical: isRed ? 40 : 10),
      child: TextButton(
        onPressed: () => action(),
        style: ButtonStyle(
          side: MaterialStateProperty.all<BorderSide>(BorderSide(
              color: isRed ? Colors.red : Theme.of(context).accentColor)),
          shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
          padding: MaterialStateProperty.all(EdgeInsets.all(isRed ? 10 : 20)),
          backgroundColor: MaterialStateProperty.all<Color>(
            isRed
                ? Colors.red.withOpacity(0.3)
                : Theme.of(context).accentColor.withOpacity(0.2),
          ),
        ),
        child: Row(
          children: [
            WebsafeSvg.asset(
              icon,
              width: 22,
              color: isRed ? Colors.red : kPrimaryColor,
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(fontSize: 20),
              ),
            ),
            !isRed
                ? WebsafeSvg.asset(
                    "lib/src/assets/svg/caret-right.svg",
                    width: 22,
                    color: isRed ? Colors.red : kPrimaryColor,
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
