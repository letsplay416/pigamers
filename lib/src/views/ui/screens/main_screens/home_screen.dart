import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pigamers/src/logic/controllers/auth_controller.dart';
import 'package:pigamers/src/logic/controllers/my_bottom_nav_bar.dart';
import 'package:pigamers/src/views/ui/widgets/home_top_text.dart';
import 'package:pigamers/src/views/ui/widgets/menu_widget.dart';
import 'package:pigamers/src/views/ui/widgets/mini_game_row.dart';
import 'package:pigamers/src/views/ui/widgets/notification_widget.dart';
import 'package:pigamers/src/views/ui/widgets/pi_ads_widget.dart';
import 'package:pigamers/src/views/ui/widgets/pi_events.dart';
import 'package:pigamers/src/views/ui/widgets/pi_news_widget.dart';
import 'package:pigamers/src/views/ui/widgets/search_widget.dart';
import 'package:pigamers/src/views/utils/constants.dart';

class HomeScreen extends GetWidget<AuthController> {
  final navcontroller = Get.find<MyBottomNavBarController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: Menu(controller: controller),
      endDrawer: Notifications(controller: controller),
      backgroundColor: Theme.of(context).backgroundColor,
      onDrawerChanged: (isOpened) => navcontroller.changeShowIt(!isOpened),
      onEndDrawerChanged: (isOpened) => navcontroller.changeShowIt(!isOpened),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            leading: Builder(
              builder: (context) => IconButton(
                icon: SvgPicture.asset(
                  "lib/src/assets/svg/menu.svg",
                  color: Theme.of(context).primaryColor,
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
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                  ),
                ),
              ),
            ],
            expandedHeight: Get.size.height * 0.2,
            backgroundColor: Theme.of(context).backgroundColor,
            stretch: true,
            centerTitle: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(""),
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
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.1),
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
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Column(
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
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
