import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pigamers/src/screens/authentication/auth_services.dart';
import 'package:pigamers/src/screens/profile_screen/profile_screen.dart';
import 'package:pigamers/src/screens/sidemenu/side_menu.dart';
import 'package:pigamers/src/screens/sidemenu/side_menu_item.dart';
import 'package:pigamers/src/services/theme_service.dart';
import 'package:share/share.dart';

import '../../constants.dart';
import 'package:velocity_x/velocity_x.dart';

class DesktopMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(color:  context.backgroundColor,
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
                title: "Profile",
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
                          hintText: "Saisi un code et reçois ton bonus",
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
                title: "Saisi un code",
              ),
              SideMenuItem(
                action: () {
                  String uid = FirebaseAuth.instance.currentUser!.uid;
                  Share.share(
                      "Hey. Tu t'ennuies?? J'ai découvert un jeu qui permet de répondre à des questions diverses à temps et jouer d'autres mini-jeux avec d'autres joueurs du monde tout en gagnant des cadeaux Télécharge là maintenant sur https://play.google.com/store/apps/details?id=inc.poison.pigamers. N'oublie pas mon identifiant comme id du parrain: $uid",
                      subject: 'Viens gagner des cadeaux');
                },
                icon: FontAwesomeIcons.users,
                title: "Inviter un Ami",
              ),
              SideMenuItem(
                action: () {},
                icon: FontAwesomeIcons.question,
                title: "A Propos",
              ),
              Spacer(),
              SideMenuItem(
                isred: true,
                action: () => AuthServices().signOut(),
                icon: FontAwesomeIcons.powerOff,
                title: "Déconnexion",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
