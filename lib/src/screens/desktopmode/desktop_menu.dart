import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pigamers/src/screens/authentication/auth_services.dart';
import 'package:pigamers/src/screens/profile_screen/profile_screen.dart';
import 'package:pigamers/src/screens/sidemenu/side_menu.dart';
import 'package:pigamers/src/screens/sidemenu/side_menu_item.dart';
import 'package:pigamers/src/services/theme_service.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants.dart';
import 'package:velocity_x/velocity_x.dart';

class DesktopMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.backgroundColor,
      child: Container(
        width: 200,
        color: kFourthColor.withOpacity(0.3),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
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
              SideMenuItem(
                action: () {
                  String uid = FirebaseAuth.instance.currentUser!.uid;
                  Share.share(
                      "Hey. Tu t'ennuies?? J'ai d??couvert un jeu qui permet de r??pondre ?? des questions diverses ?? temps et jouer d'autres mini-jeux avec d'autres joueurs du monde tout en gagnant des cadeaux T??l??charge l?? maintenant sur https://play.google.com/store/apps/details?id=inc.poison.pigamers. N'oublie pas mon identifiant comme id du parrain: $uid",
                      subject: 'Viens gagner des cadeaux');
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
      ),
    );
  }
}
