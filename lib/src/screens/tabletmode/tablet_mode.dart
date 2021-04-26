import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pigamers/src/screens/authentication/auth_services.dart';
import 'package:pigamers/src/screens/mobilemode/body.dart';
import 'package:pigamers/src/screens/other/live_widget.dart';
import 'package:pigamers/src/screens/sidemenu/side_menu.dart';
import 'package:pigamers/src/screens/tabletmode/tablet_app_bar.dart';
import 'package:pigamers/src/screens/tabletmode/tablet_ranking_screen.dart';
import 'package:velocity_x/velocity_x.dart';


class TabletMode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TabletRankingScreen(),
        Expanded(
          // flex: 9,
          child: Scaffold(
            extendBodyBehindAppBar: true,
            backgroundColor: context.backgroundColor,
            drawer: SideMenu(),
            body: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                TabletAppBar(),
                Body(),
              ],
            ),
            floatingActionButton: LiveWidget(),
          ),
        ),
      ],
    );
  }
}
