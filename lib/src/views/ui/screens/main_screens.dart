import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pigamers/src/logic/controllers/my_bottom_nav_bar.dart';
import 'package:pigamers/src/views/ui/widgets/my_bottom_nav_bar.dart';
import 'package:pigamers/src/views/utils/constants.dart';

class MainScreens extends GetWidget {
  final navcontroller = Get.find<MyBottomNavBarController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kContentColorLightTheme,
      body: Obx(
        () => navcontroller.getCurentPage,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: MyBottomNavBar(),
    );
  }
}
