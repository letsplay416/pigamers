import 'package:get/get.dart';
import 'package:pigamers/src/logic/models/pi_news_model.dart';
import 'package:pigamers/src/logic/services/database/database.dart';

class PiNewsController extends GetxController {
  var currentTitle = "Kirikito".obs;
  Rx<List<PiNewsModel>> list = Rx<List<PiNewsModel>>();
  List<PiNewsModel>? get news => list.value;
  void changeTitle({required String newTitle}) {
    currentTitle.value = newTitle;
  }

  @override
  void onInit() {
    list.value = [
      PiNewsModel(
        imgUrl:
            "https://image.freepik.com/vecteurs-libre/game-over-effet-glitch_225004-661.jpg",
        title: "Game Over",
      ),
      PiNewsModel(
        imgUrl:
            "https://image.freepik.com/vecteurs-libre/jeu-neon-numerique-banniere_1017-19897.jpg",
        title: "Gamer Over",
      ),
      PiNewsModel(
        imgUrl:
            "https://image.freepik.com/vecteurs-libre/banniere-twitch-moderne-modele-effet-texte-glitch_1361-2572.jpg",
        title: "Game Over",
      ),
    ];
    list.bindStream(Database().piNewsStream());
    super.onInit();
  }
}
