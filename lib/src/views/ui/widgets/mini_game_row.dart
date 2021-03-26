import 'package:flutter/material.dart';
import 'package:pigamers/src/views/utils/constants.dart';

import 'mini_pi_game.dart';

class MiniGamesRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.15),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          MiniPiGames(
            "Mini 1",
            true,
          ),
          MiniPiGames(
            "Mini 2",
            false,
          ),
          MiniPiGames(
            "Mini 3",
            false,
          ),
          MiniPiGames(
            "Mini 4",
            false,
          ),
        ],
      ),
    );
  }
}
