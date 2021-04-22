import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pigamers/newSrc/screens/auth/auth_controller.dart';
import 'package:pigamers/src/views/ui/widgets/home_top_text.dart';
import 'package:pigamers/src/views/ui/widgets/pi_events.dart';
import 'package:pigamers/src/views/ui/widgets/pi_news_widget.dart';
import 'package:pigamers/src/views/ui/widgets/social_row.dart';
import 'package:pigamers/src/views/utils/constants.dart';

class HomeScreen extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Column(
            children: [
              SizedBox(height: kDefaultPadding * 2),
              HomeTopText(),
              SizedBox(height: kDefaultPadding * 1.5),
              SocialRow(),
              SizedBox(height: kDefaultPadding * 1.5),
              PiEventsWidget(),
              SizedBox(height: kDefaultPadding * 1.5),
              PiNewsWidget(),
            ],
          ),
        ],
      ),
    );
  }
}
