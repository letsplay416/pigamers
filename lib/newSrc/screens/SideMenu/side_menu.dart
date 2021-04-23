import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pigamers/newSrc/screens/ProfileScreen/profile_screen.dart';
import 'package:pigamers/newSrc/screens/auth/auth_controller.dart';
import 'package:pigamers/src/logic/services/theme_service.dart';
import 'package:pigamers/src/views/ui/screens/menu_screens/profile_screen.dart';
import 'package:pigamers/src/views/utils/constants.dart';
import 'package:share/share.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        color: Theme.of(context).backgroundColor.withOpacity(0.7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () => Get.back(),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Builder(
                        builder: (context) => FaIcon(
                          FontAwesomeIcons.times,
                          size: 30,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
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
                ),
              ],
            ),
            Spacer(),
            SideMenuItem(
              action: () => Get.to(SettingsScreen()),
              icon: FontAwesomeIcons.user,
              title: "Profile",
            ),
            SideMenuItem(
              action: () {
                TextEditingController _textFieldController =
                    TextEditingController();
                Get.back();
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
                          Get.back();
                          // Clipboard.setData(new ClipboardData(text: ));
                        },
                        child: Text("Appliquer"),
                      ),
                    ],
                    title: Text('Saisir un code'),
                    backgroundColor:
                        Theme.of(context).backgroundColor.withOpacity(0.8),
                    content: TextField(
                      onChanged: (value) {},
                      controller: _textFieldController,
                      decoration: InputDecoration(
                        hintText: "Mets un code et gagne un bonus",
                      ),
                    ),
                  ),
                );
              },
              icon: FontAwesomeIcons.laptopCode,
              title: "Saisir un Code",
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
              action: () {
                Get.find<AuthController>().signOut();
              },
              icon: FontAwesomeIcons.powerOff,
              title: "Déconnexion",
            ),
          ],
        ),
      ),
    );
  }
}

class SideMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function action;

  const SideMenuItem(
      {Key? key, required this.icon, required this.title, required this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: FaIcon(
        icon,
        color: Theme.of(context).primaryColor,
      ),
      title: Row(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Text(
                title,
                style: TextStyle(
                    color: Theme.of(context).textTheme.headline2!.color),
              ),
            ),
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(2),
              border: Border(
                bottom: BorderSide(
                  color: Theme.of(context).primaryColor.withOpacity(0.5),
                  width: 5.0,
                ),
              ),
            ),
          ),
        ],
      ),
      onTap: () => action(),
    );
  }
}
