import 'package:get/get.dart';

class RankingWidgetController extends GetxController {
  RxBool isFlameRanked = false.obs;
  // set obj(value) => this._obj.value = value;
  // get obj => this._obj.value;
  get flameRanked => isFlameRanked.value;

  changeRankingType() => isFlameRanked.toggle();
}
