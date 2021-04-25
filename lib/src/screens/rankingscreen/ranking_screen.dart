import 'package:flutter/material.dart';
import 'package:pigamers/src/constants.dart';
import 'package:pigamers/src/screens/rankingscreen/my_svg_btn.dart';
import 'package:pigamers/src/screens/rankingscreen/ranking_list.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

class RankingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RxBool rankedByFlame = true.obs;
    return Container(
      width: context.screenWidth * 0.8,
      color: context.backgroundColor.withOpacity(0.7),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            Obx(() => SliverAppBar(
                  expandedHeight: context.screenHeight * 0.2,
                  backgroundColor: Colors.transparent,
                  stretch: true,
                  leading: rankedByFlame.value
                      ? MySvgBtn(
                          name: "lib/src/assets/svg/flame.svg",
                          color: Colors.red,
                          action: () => rankedByFlame.toggle(),
                        )
                      : MySvgBtn(
                          name: "lib/src/assets/svg/star.svg",
                          color: kFourthColor,
                          action: () => rankedByFlame.toggle(),
                        ),
                  automaticallyImplyLeading: false,
                  flexibleSpace: FlexibleSpaceBar(
                    stretchModes: [
                      StretchMode.zoomBackground,
                      StretchMode.fadeTitle,
                      StretchMode.blurBackground
                    ],
                    background: SafeArea(
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              rankedByFlame.value
                                  ? "lib/src/assets/images/1619371550643.png"
                                  : "lib/src/assets/images/1619377139382.png",
                            ),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          color: rankedByFlame.value
                              ? kFourthColor.withOpacity(0.6)
                              : kSecondaryColor.withOpacity(0.6),
                        ),
                      ).px24().py16(),
                    ),
                    centerTitle: true,
                  ),
                  centerTitle: true,
                  floating: true,
                )),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Obx(
                    () => RankingList(
                      rankedByFlame: rankedByFlame.value,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
