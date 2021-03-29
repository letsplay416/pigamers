import 'package:get/get.dart';
import 'package:pigamers/src/logic/models/pi_events_model.dart';
import 'package:pigamers/src/logic/services/database/database.dart';

class PiEventsController extends GetxController {
  var currentTitle = "".obs;
  Rx<List<PiEventsModel>> list = Rx<List<PiEventsModel>>();
  List<PiEventsModel> get news =>
      list.value ??
      [
        PiEventsModel(
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
    //   PiEventsModel(
    //     imgUrl:
    //         "https://image.freepik.com/vecteurs-libre/game-over-effet-glitch_225004-661.jpg",
    //     title: "Game Over",
    //   ),
    //   PiEventsModel(
    //     imgUrl:
    //         "https://image.freepik.com/vecteurs-libre/jeu-neon-numerique-banniere_1017-19897.jpg",
    //     title: "Gamer Over",
    //   ),
    //   PiEventsModel(
    //     imgUrl:
    //         "https://image.freepik.com/vecteurs-libre/banniere-twitch-moderne-modele-effet-texte-glitch_1361-2572.jpg",
    //     title: "Game Over",
    //   ),
    // ];
    list.bindStream(Database().piEventsStream());
    super.onInit();
  }
}
