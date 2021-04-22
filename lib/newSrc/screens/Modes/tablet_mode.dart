import 'package:flutter/material.dart';
import 'package:pigamers/newSrc/screens/HomeScreen/homeScreen.dart';
import 'package:pigamers/newSrc/screens/HomeScreen/widgets/live_widget.dart';
import 'package:pigamers/newSrc/screens/RankingScreen/ranking_screen.dart';
import 'package:pigamers/newSrc/screens/SideMenu/side_menu.dart';

import 'mobile_mode.dart';

class TabletMode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 5,
            child: RankingScreen(),
          ),
          Expanded(
            flex: 9,
            child: Scaffold(
              extendBodyBehindAppBar: true,
              backgroundColor: Theme.of(context).backgroundColor,
              floatingActionButton: LiveWidget(),
              drawer: SideMenu(),
              endDrawer: RankingScreen(),
              body: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  MyAppBar(),
                  HomeScreen(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

