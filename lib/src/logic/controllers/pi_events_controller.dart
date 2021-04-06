import 'package:get/get.dart';class PiEventsController extends GetxController {
  var currentTitle = "".obs;
  void changeTitle({required String newTitle}) {
    currentTitle.value = newTitle;
  }



}
