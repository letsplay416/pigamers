import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pigamers/src/logic/controllers/user_controller.dart';
import 'package:pigamers/src/views/utils/constants.dart';

class HomeTopText extends StatelessWidget {
  // final appBottomBarController = Get.find<MyBottomNavBarController>();
  final userCtrl = Get.find<UserController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() => Text(
                "Hi ${userCtrl.user.name},",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: kContentColorDarkTheme,
                ),
              )),
          SizedBox(
            height: kDefaultPadding / 3,
          ),
          Text(
            "Good day for gaming!",
            textAlign: TextAlign.left,
            style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 18,
                color: kContentColorDarkTheme),
          ),
        ],
      ),
    );
  }
}
