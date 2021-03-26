import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pigamers/src/logic/controllers/auth_controller.dart';
import 'package:pigamers/src/views/ui/widgets/home_top_text.dart';
import 'package:pigamers/src/views/ui/widgets/mini_game_row.dart';
import 'package:pigamers/src/views/ui/widgets/pi_ads_widget.dart';
import 'package:pigamers/src/views/ui/widgets/pi_news_widget.dart';
import 'package:pigamers/src/views/ui/widgets/search_widget.dart';
import 'package:pigamers/src/views/utils/constants.dart';

class HomeScreen extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kContentColorLightTheme,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => controller.signOut(),
          ),
        ),
        centerTitle: true,
        title: Text("Home Screen"),
      ),
      body: ListView(
        children: [
          SizedBox(height: kDefaultPadding * 2),
          HomeTopText(),
          SizedBox(height: kDefaultPadding * 2),
          SearchWidget(),
          SizedBox(height: kDefaultPadding * 1.5),
          MiniGamesRow(),
          SizedBox(height: kDefaultPadding * 1.5),
          PiNewsWidget(),
          SizedBox(height: kDefaultPadding * 1.5),
          PiAdsWidget(),
          SizedBox(height: kDefaultPadding * 1.5),
        ],
      ),
    );
  }
}
