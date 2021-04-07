import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'mini_pi_game.dart';

// ignore: must_be_immutable
class MiniGamesRow extends StatelessWidget {
  List<SocialWidget> listGames = [
    SocialWidget(
      name: "WhatsApp",
      color: Colors.green,
      link: "https://www.youtube.com/",
      icon: "lib/src/assets/svg/flame.svg",
    ),
    SocialWidget(
      name: "Play Store",
      color: Get.theme!.textTheme.headline2!.color ?? Colors.amber,
      link: "https://play.google.com/store/apps/details?id=inc.poison.pigamers",
      icon: "lib/src/assets/svg/flame.svg",
    ),
    SocialWidget(
      name: "Instagram",
      color: Colors.pinkAccent,
      link: "https://instagram.com/pigamers_?igshid=sd3uxc62i125",
      icon: "lib/src/assets/svg/flame.svg",
    ),
    SocialWidget(
      name: "SnapChat",
      color: Colors.yellow,
      link: "https://www.youtube.com/",
      icon: "lib/src/assets/svg/flame.svg",
    ),
    SocialWidget(
      name: "Facebook",
      color: Colors.blue,
      link: "https://www.facebook.com/PiGamers-103191205196895/",
      icon: "lib/src/assets/svg/flame.svg",
    ),
    SocialWidget(
      name: "Web site",
      color: Get.theme!.textTheme.headline2!.color ?? Colors.amber,
      link: "https://www.youtube.com/",
      icon: "lib/src/assets/svg/flame.svg",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 60,
        child: ListView.builder(
          itemCount: listGames.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => GestureDetector(
            child: MiniPiGames(
              color: listGames[index].color,
              text: listGames[index].name,
              url: listGames[index].link,
            ),
          ),
        ),
      ),
    );
  }
}

class SocialWidget {
  final String name;
  final Color color;
  final String link;
  final String icon;

  SocialWidget(
      {required this.name,
      required this.color,
      required this.link,
      required this.icon});
}
