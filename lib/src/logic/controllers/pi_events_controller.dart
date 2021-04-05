import 'package:get/get.dart';
import 'package:pigamers/src/logic/models/pi_events_model.dart';
import 'package:pigamers/src/logic/services/database/database.dart';

class PiEventsController extends GetxController {
  var currentTitle = "".obs;
  void changeTitle({required String newTitle}) {
    currentTitle.value = newTitle;
  }



}
