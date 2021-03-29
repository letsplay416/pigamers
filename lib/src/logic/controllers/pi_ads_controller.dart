import 'package:get/get.dart';
import 'package:pigamers/src/logic/models/pi_ads_model.dart';
import 'package:pigamers/src/logic/services/database/database.dart';

class PiAdsController extends GetxController {
  var currentTitle = "".obs;
  Rx<List<PiAdsModel>> list = Rx<List<PiAdsModel>>();
  List<PiAdsModel> get news =>
      list.value ??
      [
        PiAdsModel(
          imgUrl:
              "https://image.freepik.com/vecteurs-libre/game-over-effet-glitch_225004-661.jpg",
          title: "Game Over",
        ),
      ];
  void changeTitle({required String newTitle}) {
    currentTitle.value = newTitle;
  }

  @override
  void onInit() {
    // list.value = [
    //   PiAdsModel(
    //     imgUrl:
    //         "https://image.freepik.com/vecteurs-libre/game-over-effet-glitch_225004-661.jpg",
    //     title: "Game Over",
    //   ),
    //   PiAdsModel(
    //     imgUrl:
    //         "https://image.freepik.com/vecteurs-libre/jeu-neon-numerique-banniere_1017-19897.jpg",
    //     title: "Gamer Over",
    //   ),
    //   PiAdsModel(
    //     imgUrl:
    //         "https://image.freepik.com/vecteurs-libre/banniere-twitch-moderne-modele-effet-texte-glitch_1361-2572.jpg",
    //     title: "Game Over",
    //   ),
    // ];
    list.bindStream(Database().piAdsStream());
    super.onInit();
  }
}
