import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pigamers/newSrc/screens/HomeScreen/homeScreen.dart';
import 'package:pigamers/newSrc/screens/HomeScreen/widgets/live_widget.dart';
import 'package:pigamers/newSrc/screens/RankingScreen/ranking_screen.dart';
import 'package:pigamers/newSrc/screens/SideMenu/side_menu.dart';
import 'package:pigamers/newSrc/screens/responsive.dart';
import 'package:pigamers/src/views/ui/widgets/home_top_text.dart';
import 'package:pigamers/src/views/ui/widgets/pi_events.dart';
import 'package:pigamers/src/views/ui/widgets/pi_news_widget.dart';
import 'package:pigamers/src/views/ui/widgets/social_row.dart';
import 'package:pigamers/src/views/utils/constants.dart';

class MobileMode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}

class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: Responsive.isMobile(context)
          ? Builder(
              builder: (context) => IconButton(
                icon: SvgPicture.asset(
                  "lib/src/assets/svg/menu.svg",
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            )
          : FaIcon(
              FontAwesomeIcons.fire,
              size: 28,
              color: Colors.transparent,
            ),
      actions: [
        Responsive.isMobile(context)
            ? GestureDetector(
                onTap: () => Scaffold.of(context).openEndDrawer(),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Builder(
                    builder: (context) => FaIcon(
                      FontAwesomeIcons.fire,
                      size: 28,
                      color: Colors.redAccent,
                    ),
                  ),
                ),
              )
            : FaIcon(
                FontAwesomeIcons.fire,
                size: 28,
                color: Colors.transparent,
              ),
      ],
      expandedHeight: Get.size.height * 0.2,
      backgroundColor: Theme.of(context).backgroundColor,
      stretch: true,
      centerTitle: true,
      floating: true,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: [
          StretchMode.zoomBackground,
          StretchMode.fadeTitle,
          // StretchMode.blurBackground
        ],
        background: Stack(
          fit: StackFit.expand,
          children: [
            SvgPicture.asset(
              "lib/src/assets/logo/pig1.svg",
              fit: BoxFit.contain,
            ),
            DecoratedBox(
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40))),
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.0, 1),
                  colors: [
                    Color(0x00000000),
                    Theme.of(context).primaryColor.withOpacity(0.05),
                  ],
                  end: Alignment(0.0, 0.0),
                ),
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
    );
  }
}
