import 'package:flutter/material.dart';
import 'package:pigamers/src/screens/desktopmode/desktop_menu.dart';
import 'package:pigamers/src/screens/desktopmode/desktop_ranking_screen.dart';
import 'package:pigamers/src/screens/mobilemode/body.dart';
import 'package:pigamers/src/screens/other/live_widget.dart';
import 'package:pigamers/src/screens/tabletmode/tablet_app_bar.dart';
import 'package:velocity_x/velocity_x.dart';

class DesktopMode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DesktopMenu(),
        DesktopRankingScreen(),
        Expanded(
          child: Scaffold(
            extendBodyBehindAppBar: true,
            backgroundColor: context.backgroundColor,
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
