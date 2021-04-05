import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'mini_pi_game.dart';

// ignore: must_be_immutable
class MiniGamesRow extends GetWidget {
  RxInt _index = 0.obs;
  List<String> listGames = [
    "Roulette",
    "Pile ou face",
    "Jackpot",
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
            onTap: () => _index.value = index,
            child:
                Obx(() => MiniPiGames(listGames[index], index == _index.value)),
          ),
        ),
      ),
    );
  }
}
