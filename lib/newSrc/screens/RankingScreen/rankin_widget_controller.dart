import 'package:get/get.dart';

class RankingWidgetController extends GetxController {
  RxBool isFlameRanked = false.obs;
  get flameRanked => isFlameRanked.value;

  changeRankingType() => isFlameRanked.toggle();
}
