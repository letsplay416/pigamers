import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pigamers/src/logic/controllers/auth_controller.dart';
import 'package:pigamers/src/views/ui/widgets/home_top_text.dart';
import 'package:pigamers/src/views/ui/widgets/mini_game_row.dart';
import 'package:pigamers/src/views/ui/widgets/pi_ads_widget.dart';
import 'package:pigamers/src/views/ui/widgets/pi_events.dart';
import 'package:pigamers/src/views/ui/widgets/pi_news_widget.dart';
import 'package:pigamers/src/views/ui/widgets/search_widget.dart';
import 'package:pigamers/src/views/utils/constants.dart';

class HomeScreen extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: SafeArea(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(
              height: double.infinity,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.end,
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
                  Expanded(child: Container()),
                  Row(
                    children: [
                      Expanded(child: Container()),
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
                              SizedBox(
                                width: 10,
                              ),
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
                ],
              ),
              width: Get.size.width * 0.7,
              color: kPrimaryColor.withOpacity(0.2),
            ),
          ),
        ),
      ),
      endDrawer: SafeArea(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(
              height: double.infinity,
              child: ListView(
                children: [
                  DrawerHeader(
                    child: Center(child: Text("Notifs")),
                  ),
                  ListTile(
                    title: Text("Déconexion"),
                    trailing: Icon(Icons.logout),
                    onTap: () => controller.signOut(),
                  ),
                ],
              ),
              width: Get.size.width * 0.7,
              color: kThirdColor.withOpacity(0.2),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: kContentColorLightTheme,
        elevation: 0.0,
        bottomOpacity: 0.0,
        foregroundColor: Colors.transparent,
        leading: Builder(
          builder: (context) => IconButton(
            icon: SvgPicture.asset(
              "lib/src/assets/svg/menu.svg",
              color: kPrimaryColor,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Builder(
              builder: (context) => IconButton(
                icon: SvgPicture.asset(
                  "lib/src/assets/svg/bell.svg",
                  color: kPrimaryColor,
                ),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.transparent,
      body: ListView(
        children: [
          SizedBox(height: kDefaultPadding * 2),
          HomeTopText(),
          SizedBox(height: kDefaultPadding * 2),
          SearchWidget(),
          SizedBox(height: kDefaultPadding * 1.5),
          MiniGamesRow(),
          SizedBox(height: kDefaultPadding * 1.5),
          PiEventsWidget(),
          SizedBox(height: kDefaultPadding * 1.5),
          PiNewsWidget(),
          SizedBox(height: kDefaultPadding * 1.5),
          PiAdsWidget(),
          SizedBox(height: kDefaultPadding * 1.5),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Social footer"),
            ),
          ),
        ],
      ),
    );
  }
}

class MenuTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function action;

  const MenuTile(
      {required this.title, required this.icon, required this.action});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      trailing: FaIcon(icon),
      onTap: action(),
    );
  }
}
