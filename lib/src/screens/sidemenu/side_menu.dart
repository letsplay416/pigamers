import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pigamers/src/screens/authentication/auth_services.dart';
import 'package:pigamers/src/screens/profile_screen/profile_screen.dart';
import 'package:pigamers/src/services/theme_service.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../constants.dart';
import 'side_menu_item.dart';
import 'package:get/get.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth * 0.8,
      color: context.backgroundColor.withOpacity(0.7),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => context.pop(),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Builder(
                      builder: (context) => FaIcon(
                        FontAwesomeIcons.times,
                        size: 30,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => ThemeService().changeThemeMode(),
                  icon: Builder(
                    builder: (context) => context.brightness == Brightness.light
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
              ],
            ),
            // Divider(),
            Spacer(),
            SideMenuItem(
              action: () => context.nextPage(ProfileScreen()),
              icon: FontAwesomeIcons.user,
              title: "Profil",
            ),
            SideMenuItem(
              action: () {
                TextEditingController _textFieldController =
                    TextEditingController();
                Get.dialog(
                  AlertDialog(
                    title: Text(
                      'Code bonus',
                      style: TextStyle(
                          color: context.brightness == Brightness.light
                              ? kContentColorLightTheme
                              : kContentColorDarkTheme),
                    ),
                    backgroundColor:
                        Theme.of(context).backgroundColor.withOpacity(0.8),
                    content: TextField(
                      controller: _textFieldController,
                      decoration: InputDecoration(
                        hintText: "Saisis un code et re??ois ton bonus",
                      ),
                    ),
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
                      bonusCode(context: context, ctrl: _textFieldController)
                    ],
                  ),
                );
              },
              icon: FontAwesomeIcons.barcode,
              title: "Saisis un code",
            ),
            kIsWeb
                ? Container()
                : SideMenuItem(
                    action: () {
                      try {
                        String uid = FirebaseAuth.instance.currentUser!.uid;
                        Share.share(
                            "Hey. Tu t'ennuies?? J'ai d??couvert un jeu qui permet de r??pondre ?? des questions diverses ?? temps et jouer d'autres mini-jeux avec d'autres joueurs du monde tout en gagnant des cadeaux T??l??charge l?? maintenant sur https://play.google.com/store/apps/details?id=inc.poison.pigamers. N'oublie pas mon identifiant comme id du parrain: $uid",
                            subject: 'Viens gagner des cadeaux');
                      } catch (e) {}
                    },
                    icon: FontAwesomeIcons.users,
                    title: "Inviter un Ami",
                  ),
            if (!kIsWeb)
              SideMenuItem(
                action: () async {
                  String url = "https://pi-gamers.web.app";
                  await canLaunch(url)
                      ? await launch(url)
                      : throw 'Could not launch $url';
                },
                icon: FontAwesomeIcons.question,
                title: "?? propos",
              ),
            Spacer(),
            SideMenuItem(
              isred: true,
              action: () => AuthServices().signOut(),
              icon: FontAwesomeIcons.powerOff,
              title: "D??connexion",
            ),
          ],
        ),
      ),
    );
  }
}

bonusCode(
    {required BuildContext context, required TextEditingController ctrl}) {
  return ElevatedButton(
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
      if (ctrl.text.isNotEmpty)
        try {
          await FirebaseFirestore.instance
              .collection('codeBonus')
              .doc(ctrl.text.trim())
              .get()
              .then((value) {
            if (value.exists) {
              List users = value.data()!['users'];
              if (users.contains(FirebaseAuth.instance.currentUser!.uid)) {
                context.showToast(
                    msg: "Tu as d??j?? b??n??fici?? de ton bonus",
                    position: VxToastPosition.center,
                    bgColor: context.backgroundColor,
                    textColor: context.primaryColor);
              } else {
                users.add(FirebaseAuth.instance.currentUser!.uid);
                FirebaseFirestore.instance
                    .collection('codeBonus')
                    .doc(ctrl.text.trim())
                    .update({"users": users}).then((_) async {
                  await FirebaseFirestore.instance
                      .collection('users')
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .get()
                      .then((val) {
                    var croins = val.data()!['croins'];
                    if (val.exists) {
                      FirebaseFirestore.instance
                          .collection('users')
                          .doc(FirebaseAuth.instance.currentUser!.uid)
                          .update({"croins": croins + value.data()!['croins']});
                    }
                  });
                });
                context.showToast(
                    msg:
                        "Tu viens de gagner ${value.data()!['croins']} Croin(s)",
                    position: VxToastPosition.center,
                    bgColor: context.backgroundColor,
                    textColor: context.primaryColor);
              }

              Get.back();
            } else {
              context.showToast(
                  msg: "Code mauvais ou expir??",
                  position: VxToastPosition.center,
                  bgColor: context.backgroundColor,
                  textColor: context.primaryColor);
              Get.back();
            }
          });
        } on FirebaseAuthException catch (e) {
          context.showToast(
              msg: e.message.toString(),
              position: VxToastPosition.center,
              bgColor: context.backgroundColor,
              textColor: context.primaryColor);
        }
    },
    child: Text("Appliquer"),
  );
}
