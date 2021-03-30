import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pigamers/src/views/utils/constants.dart';

class RankingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: Get.size.height * 0.3,
            backgroundColor: kPrimaryColor.withOpacity(0.2),
            stretch: true,
            centerTitle: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Ranking Screen"),
              stretchModes: [
                StretchMode.zoomBackground,
                StretchMode.fadeTitle,
                StretchMode.blurBackground
              ],
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    "https://htmlcolorcodes.com/assets/images/html-color-codes-color-tutorials-hero.jpg",
                    fit: BoxFit.cover,
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0.0, 0.5),
                        colors: [
                          kPrimaryColor.withOpacity(0.3),
                          Color(0x00000000)
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
              delegate: SliverChildListDelegate([
            Container(
              color: kContentColorLightTheme,
              height: 999,
            ),
          ]))
        ],
      ),
    );
  }
}
