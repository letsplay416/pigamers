import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pigamers/src/logic/controllers/my_bottom_nav_bar.dart';
import 'package:pigamers/src/views/utils/constants.dart';

class PageIcon extends StatelessWidget {
  final String icon;
  final PageEnum target;
  const PageIcon({
    required this.icon,
    required this.target,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Expanded(
        child: IconButton(
          // ignore: unrelated_type_equality_checks
          icon: Get.find<MyBottomNavBarController>().curentPage == target
              ? SvgPicture.asset(
                  icon,
                  color: kFourthColor,
                )
              : target == PageEnum.RANKING
                  ? FaIcon(
                      FontAwesomeIcons.fire,
                      color: kThirdColor.withOpacity(0.5),
                      size: 20,
                    )
                  : target == PageEnum.APPS
                      ? FaIcon(
                          FontAwesomeIcons.mobile,
                          color: kThirdColor.withOpacity(0.5),
                          size: 20,
                        )
                      : target == PageEnum.SETTINGS
                          ? FaIcon(
                              FontAwesomeIcons.cog,
                              color: kThirdColor.withOpacity(0.5),
                              size: 20,
                            )
                          : FaIcon(
                              FontAwesomeIcons.home,
                              color: kThirdColor.withOpacity(0.5),
                              size: 20,
                            ),
          onPressed: () =>
              Get.find<MyBottomNavBarController>().changeScreen(screen: target),
        ),
      ),
    );
  }
}
