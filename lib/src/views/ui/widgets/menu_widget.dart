import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pigamers/src/logic/controllers/auth_controller.dart';
import 'package:pigamers/src/logic/services/theme_service.dart';
import 'package:pigamers/src/views/ui/screens/menu_screens/profile_screen.dart';
// import 'package:pigamers/src/views/utils/constants.dart';

import 'menu_title_widget.dart';

class Menu extends StatelessWidget {
  const Menu({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final AuthController controller;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: Container(
            height: double.infinity,
            child: Padding(
                padding: const EdgeInsets.all(21.0),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxHeight > 800) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () => ThemeService().changeThemeMode(),
                            child: DrawerHeader(
                              padding: const EdgeInsets.all(0),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    padding: const EdgeInsets.all(15.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: SvgPicture.asset(
                                        "lib/src/assets/logo/pig.svg",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "Pi'Gamers",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline3!
                                        .copyWith(
                                            fontSize: 30,
                                            color: Theme.of(context)
                                                .backgroundColor,
                                            shadows: [
                                          Shadow(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              blurRadius: 5,
                                              offset: Offset(1, 1))
                                        ]),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          MenuTile(
                            title: "Inviter un ami",
                            action: () => Get.to(ProfileScreen()),
                            icon: FontAwesomeIcons.userCog,
                            desc: "Agrandis nos rangs et gagne des récompenses",
                          ),
                          MenuTile(
                            title: "Saisir un code",
                            action: () {
                              TextEditingController _textFieldController =
                                  TextEditingController();
                              Get.back();
                              Get.dialog(
                                AlertDialog(
                                  actions: [
                                    OutlinedButton(
                                      style: ButtonStyle(
                                        overlayColor:
                                            MaterialStateProperty.all<Color>(
                                          Theme.of(context).primaryColor,
                                        ),
                                        foregroundColor:
                                            MaterialStateProperty.all<Color>(
                                          Colors.red,
                                        ),
                                        shadowColor:
                                            MaterialStateProperty.all<Color>(
                                          Colors.red,
                                        ),
                                      ),
                                      onPressed: () => Get.back(),
                                      child: Text("Annuler"),
                                    ),
                                    ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                          Theme.of(context).primaryColor,
                                        ),
                                        shadowColor:
                                            MaterialStateProperty.all<Color>(
                                          Theme.of(context)
                                              .primaryColor
                                              .withOpacity(0.4),
                                        ),
                                        overlayColor:
                                            MaterialStateProperty.all<Color>(
                                          Theme.of(context)
                                              .primaryColor
                                              .withOpacity(0.4),
                                        ),
                                      ),
                                      onPressed: () async {
                                        Get.back();
                                        // Clipboard.setData(new ClipboardData(text: ));
                                      },
                                      child: Text("Appliquer"),
                                    ),
                                  ],
                                  title: Text('Saisir un code'),
                                  backgroundColor: Theme.of(context)
                                      .backgroundColor
                                      .withOpacity(0.8),
                                  content: TextField(
                                    onChanged: (value) {},
                                    controller: _textFieldController,
                                    decoration: InputDecoration(
                                      hintText:
                                          "Mets un code et gagne un bonus",
                                    ),
                                  ),
                                ),
                              );
                            },
                            icon: FontAwesomeIcons.barcode,
                            desc:
                                "Saisit un code de promo et gagne de superbes lots",
                          ),
                          MenuTile(
                            title: "A propos",
                            action: () => Get.to(ProfileScreen()),
                            icon: FontAwesomeIcons.info,
                            desc: "Tout sur Pi'Gammers et l'entreprise",
                          ),
                          MenuTile(
                            title: "Aide",
                            action: () {
                              ThemeService().changeThemeMode();
                            },
                            icon: FontAwesomeIcons.question,
                            desc: "Besoin d'aide? C'est ici",
                          ),
                          Flexible(
                            child: Container(),
                          ),
                          GestureDetector(
                            onTap: () => controller.signOut(),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.only(top: 20, right: 20),
                              child: Text(
                                "Déconnexion",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: Colors.red.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return ListView(
                        children: [
                          GestureDetector(
                            onDoubleTap: () => ThemeService().changeThemeMode(),
                            child: DrawerHeader(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    "Pi'Gamers",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          MenuTile(
                            title: "Profile",
                            action: () => Get.to(ProfileScreen()),
                            icon: FontAwesomeIcons.userCog,
                            desc: "Modifier les informations du compte",
                          ),
                          MenuTile(
                            title: "Porte-monnaie",
                            action: () => Get.to(ProfileScreen()),
                            icon: FontAwesomeIcons.wallet,
                            desc: "Acces aux ressources: Exp, Coins, etc.",
                          ),
                          MenuTile(
                            title: "Inviter un ami",
                            action: () => Get.to(ProfileScreen()),
                            icon: FontAwesomeIcons.userCog,
                            desc: "Agrandis nos rangs et gagne des récompenses",
                          ),
                          MenuTile(
                            title: "Saisir un code",
                            action: () => Get.to(ProfileScreen()),
                            icon: FontAwesomeIcons.barcode,
                            desc:
                                "Saisit un code de promo et gagne de superbes lots",
                          ),
                          MenuTile(
                            title: "A propos",
                            action: () => Get.to(ProfileScreen()),
                            icon: FontAwesomeIcons.info,
                            desc: "Tout sur Pi'Gammers et l'entreprise",
                          ),
                          MenuTile(
                            title: "Aide",
                            action: () {
                              ThemeService().changeThemeMode();
                            },
                            icon: FontAwesomeIcons.question,
                            desc: "Besoin d'aide? C'est ici",
                          ),
                          Flexible(
                            child: Container(
                              child:
                                  Center(child: Text("Row des résaux sociaux")),
                            ),
                            fit: FlexFit.tight,
                          ),
                          GestureDetector(
                            onTap: () => controller.signOut(),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.only(top: 20, right: 20),
                              child: Text(
                                "Déconnexion",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.abel(
                                  color: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .color,
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: Colors.red.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                  },
                )),
            width: Get.size.width * 0.7,
            color: Theme.of(context).primaryColor.withOpacity(0.2),
          ),
        ),
      ),
    );
  }
}

class SocialBtn extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color couleur;
  const SocialBtn({
    Key? key,
    required this.title,
    required this.icon,
    required this.couleur,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.3),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(color: couleur, blurRadius: 3, offset: Offset(2, 2))
            ]),
        width: 60,
        child: Center(child: Text(title)),
      ),
    );
  }
}
