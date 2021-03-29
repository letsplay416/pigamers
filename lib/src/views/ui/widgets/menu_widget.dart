import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pigamers/src/logic/controllers/auth_controller.dart';
import 'package:pigamers/src/views/utils/constants.dart';

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
              child: SingleChildScrollView(
                child: Container(
                  height: Get.size.height - 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: kPrimaryColor.withOpacity(0.5)),
                  child: ListView(
                    children: [
                      DrawerHeader(
                        child: Center(
                            child: Text(
                          "Pi'Gamers",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        )),
                      ),
                      MenuTile(
                        title: "Profile",
                        action: () {},
                        icon: FontAwesomeIcons.userCog,
                      ),
                      MenuTile(
                        title: "Porte-monnaie",
                        action: () {},
                        icon: FontAwesomeIcons.wallet,
                      ),
                      MenuTile(
                        title: "Inviter un ami",
                        action: () {},
                        icon: FontAwesomeIcons.userCog,
                      ),
                      MenuTile(
                        title: "Saisir un code",
                        action: () {},
                        icon: FontAwesomeIcons.barcode,
                      ),
                      MenuTile(
                        title: "A propos",
                        action: () {},
                        icon: FontAwesomeIcons.info,
                      ),
                      MenuTile(
                        title: "Aide",
                        action: () {},
                        icon: FontAwesomeIcons.question,
                      ),
                      // Expanded(child: Container()),
                      GestureDetector(
                        onTap: () => controller.signOut(),
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 70, horizontal: 20),
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Text(
                                "Déconnexion",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              Expanded(child: Container()),
                              FaIcon(
                                FontAwesomeIcons.doorOpen,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: Colors.cyan.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            width: Get.size.width * 0.7,
            color: kPrimaryColor.withOpacity(0.2),
          ),
        ),
      ),
    );
  }
}
