// import 'package:flutter/material.dart';
// import 'package:websafe_svg/websafe_svg.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:get/get.dart';
// import 'package:pigamers/src/logic/controllers/my_bottom_nav_bar.dart';

// class PageIcon extends StatelessWidget {
//   final String icon;
//   final PageEnum target;
//   const PageIcon({
//     required this.icon,
//     required this.target,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => Expanded(
//         child: IconButton(
//           icon: Get.find<MyBottomNavBarController>().curentPage.value == target
//               ? WebsafeSvg.asset(
//                   icon,
//                   color: Theme.of(context).primaryColor,
//                 )
//               : target == PageEnum.RANKING
//                   ? FaIcon(
//                       FontAwesomeIcons.fire,
//                       color: Theme.of(context)
//                           .textTheme
//                           .headline2!
//                           .color!
//                           .withOpacity(0.4),
//                       size: 20,
//                     )
//                   : target == PageEnum.PROFILE
//                       ? FaIcon(
//                           FontAwesomeIcons.user,
//                           color: Theme.of(context)
//                               .textTheme
//                               .headline2!
//                               .color!
//                               .withOpacity(0.4),
//                           size: 20,
//                         )
//                       : FaIcon(
//                           FontAwesomeIcons.home,
//                           color: Theme.of(context)
//                               .textTheme
//                               .headline2!
//                               .color!
//                               .withOpacity(0.4),
//                           size: 20,
//                         ),
//           onPressed: () =>
//               Get.find<MyBottomNavBarController>().changeScreen(screen: target),
//         ),
//       ),
//     );
//   }
// }
