import 'package:flutter/material.dart';
import 'package:pigamers/src/screens/mobilemode/pi_event.dart';
import 'package:pigamers/src/screens/mobilemode/pi_news_widget.dart';
import 'package:pigamers/src/screens/social/social_row.dart';

import '../../constants.dart';
import 'home_top_text.dart';

class Body extends StatelessWidget {
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
