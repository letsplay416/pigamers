import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pigamers/src/logic/controllers/rankin_widget_controller.dart';
import 'package:pigamers/src/views/ui/widgets/ranking_widget.dart';
import 'package:pigamers/src/views/utils/constants.dart';

class RankingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var ctrl = Get.put(RankingWidgetController());
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      floatingActionButton: Obx(() => FloatingActionButton(
            backgroundColor: Theme.of(context).accentColor.withOpacity(0.1),
            elevation: 0,
            onPressed: () => ctrl.changeRankingType(),
            mini: true,
            child: ctrl.isFlameRanked.value
                ? SvgPicture.asset(
                    "lib/src/assets/svg/star.svg",
                    color: kThirdColor,
                  )
                : SvgPicture.asset(
                    "lib/src/assets/svg/flame.svg",
                    color: Colors.red,
                  ),
          )),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: Get.size.height * 0.3,
            backgroundColor: Theme.of(context).backgroundColor,
            stretch: true,
            title: Text(
              "Ranking Screen",
              style: Theme.of(context).textTheme.headline1,
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
                          Color(0x00000000),
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
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                RankingWidget(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
