import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
              width: Get.size.width * 0.7,
              color: kPrimaryColor.withOpacity(0.2),
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
            child: IconButton(
              icon: SvgPicture.asset(
                "lib/src/assets/svg/bell.svg",
                color: kPrimaryColor,
              ),
              onPressed: () => controller.signOut(),
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
