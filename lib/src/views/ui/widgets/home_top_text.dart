import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pigamers/src/logic/controllers/user_controller.dart';
import 'package:pigamers/src/views/utils/constants.dart';

class HomeTopText extends StatelessWidget {
  final userCtrl = Get.find<UserController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.5),
      child: Row(
        children: [
          Column(
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
          Expanded(child: Container()),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    image: NetworkImage(userCtrl.user.profilPic.toString()),
                    fit: BoxFit.cover),
              ),
            ),
          )
        ],
      ),
    );
  }
}
