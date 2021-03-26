import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
    return Expanded(
      child: IconButton(
        icon: SvgPicture.asset(
          icon,
          // ignore: unrelated_type_equality_checks
          color: Get.find<MyBottomNavBarController>().curentPage != target
              ? Colors.grey.withOpacity(0.5)
              : kThirdColor,
        ),
        onPressed: () =>
            Get.find<MyBottomNavBarController>().changeScreen(screen: target),
      ),
    );
  }
}
