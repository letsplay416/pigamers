import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pigamers/newSrc/screens/RankingScreen/rankin_widget_controller.dart';
import 'package:pigamers/newSrc/screens/SideMenu/side_menu.dart';
import 'package:pigamers/newSrc/screens/responsive.dart';
import 'package:pigamers/src/views/utils/constants.dart';

import 'my_svg_btn.dart';
import 'ranking_widget.dart';

class RankingScreen extends GetWidget<RankingWidgetController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          width: MediaQuery.of(context).size.width * 0.8,
          color: Theme.of(context).backgroundColor.withOpacity(0.7),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            drawer: SideMenu(),
            body: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                Responsive.isMobile(context)
                    ? SliverAppBar(
                        actions: [
                          FaIcon(
                            FontAwesomeIcons.ad,
                            color: Colors.transparent,
                          )
                        ],
                        expandedHeight: Get.size.height * 0.3,
                        backgroundColor: Theme.of(context).backgroundColor,
                        stretch: true,
                        leading: MySvgBtn(
                          name: controller.isFlameRanked.value
                              ? "lib/src/assets/svg/flame.svg"
                              : "lib/src/assets/svg/star.svg",
                          color: controller.isFlameRanked.value
                              ? Colors.red
                              : Colors.blue,
                          action: () => controller.changeRankingType(),
                        ),
                        title: Text(
                          "Ranking Screen",
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(
                                  color: Theme.of(context).backgroundColor),
                        ),
                        centerTitle: true,
                        floating: true,
                        flexibleSpace: FlexibleSpaceBar(
                          // title: ,
                          stretchModes: [
                            StretchMode.zoomBackground,
                            StretchMode.fadeTitle,
                            StretchMode.blurBackground
                          ],
                          background: Stack(
                            fit: StackFit.expand,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(40),
                                    bottomRight: Radius.circular(40)),
                                child: Image.asset(
                                  "lib/src/assets/images/trioPic.jpeg",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              DecoratedBox(
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: kSecondaryColor.withOpacity(0.1),
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(40),
                                          bottomRight: Radius.circular(40))),
                                ),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment(0.0, 1),
                                    colors: [
                                      Colors.transparent,
                                      kPrimaryColor.withOpacity(0.05),
                                    ],
                                    end: Alignment(0.0, 0.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          centerTitle: true,
                        ),
                      )
                    : SliverAppBar(
                        actions: [
                          MySvgBtn(
                            name: controller.isFlameRanked.value
                                ? "lib/src/assets/svg/flame.svg"
                                : "lib/src/assets/svg/star.svg",
                            color: controller.isFlameRanked.value
                                ? Colors.red
                                : Colors.blue,
                            action: () => controller.changeRankingType(),
                          ),
                        ],
                        leading: !Responsive.isMobile(context)
                            ? Builder(
                                builder: (context) => IconButton(
                                  icon: SvgPicture.asset(
                                    "lib/src/assets/svg/menu.svg",
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  onPressed: () =>
                                      Scaffold.of(context).openDrawer(),
                                ),
                              )
                            : FaIcon(
                                FontAwesomeIcons.fire,
                                size: 28,
                                color: Colors.transparent,
                              ),
                        expandedHeight: Get.size.height * 0.3,
                        backgroundColor: Theme.of(context).backgroundColor,
                        stretch: true,
                        title: Text(
                          "Ranking Screen",
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(
                                  color: Theme.of(context).backgroundColor),
                        ),
                        centerTitle: true,
                        floating: true,
                        flexibleSpace: FlexibleSpaceBar(
                          // title: Text("Ranking"),
                          background: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.asset(
                                "lib/src/assets/images/trioPic.jpeg",
                                fit: BoxFit.cover,
                              ),
                              DecoratedBox(
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: kSecondaryColor.withOpacity(0.1),
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(40),
                                          bottomRight: Radius.circular(40))),
                                ),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment(0.0, 1),
                                    colors: [
                                      Colors.transparent,
                                      kPrimaryColor.withOpacity(0.05),
                                    ],
                                    end: Alignment(0.0, 0.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          stretchModes: [
                            StretchMode.zoomBackground,
                            StretchMode.fadeTitle,
                            StretchMode.blurBackground
                          ],
                          centerTitle: true,
                        ),
                      ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      RankingWidget(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
