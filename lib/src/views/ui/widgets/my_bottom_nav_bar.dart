import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pigamers/src/logic/controllers/my_bottom_nav_bar.dart';
import 'package:pigamers/src/views/ui/widgets/page_icon.dart';

class MyBottomNavBar extends GetWidget<MyBottomNavBarController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isShowen
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width / 2,
                          child: Row(
                            children: [
                              PageIcon(
                                icon: "lib/src/assets/svg/home.svg",
                                target: PageEnum.HOME,
                              ),
                              PageIcon(
                                icon: "lib/src/assets/svg/flame.svg",
                                target: PageEnum.RANKING,
                              ),
                              PageIcon(
                                icon: "lib/src/assets/svg/user0.svg",
                                target: PageEnum.PROFILE,
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context)
                                .backgroundColor
                                .withOpacity(0.5),
                            border: Border.all(
                                color: Theme.of(context).primaryColor),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        )),
                  ),
                ),
              ],
            )
          : Container(),
    );
  }
}
