import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pigamers/src/logic/controllers/my_bottom_nav_bar.dart';
import 'package:pigamers/src/views/ui/widgets/page_icon.dart';
import 'package:pigamers/src/views/utils/constants.dart';

class MyBottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width / 2,
            child: Row(
              children: [
                PageIcon(
                  icon: "lib/src/assets/svg/home.svg",
                  target: PageEnum.HOME,
                ),
                PageIcon(
                  icon: "lib/src/assets/svg/user0.svg",
                  target: PageEnum.PROFILE,
                ),
                PageIcon(
                  icon: "lib/src/assets/svg/star.svg",
                  target: PageEnum.APPS,
                ),
                PageIcon(
                  icon: "lib/src/assets/svg/settings.svg",
                  target: PageEnum.SETTINGS,
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: kSecondaryColor.withOpacity(0.5)),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}
