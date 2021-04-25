import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pigamers/src/screens/authentication/auth_services.dart';
import 'package:pigamers/src/screens/mobilemode/my_appbar.dart';
import 'package:pigamers/src/screens/rankingscreen/ranking_screen.dart';
import 'package:pigamers/src/screens/sidemenu/side_menu.dart';
import 'package:velocity_x/velocity_x.dart';

class MobileMode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: context.backgroundColor,
      drawer: SideMenu(),
      endDrawer: RankingScreen(),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          MyAppBar(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => AuthServices().signOut(),
        child: FaIcon(FontAwesomeIcons.signOutAlt),
      ),
    );
  }
}
