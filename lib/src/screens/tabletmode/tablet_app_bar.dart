import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:velocity_x/velocity_x.dart';

class TabletAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      expandedHeight: 200,
      backgroundColor: Theme.of(context).backgroundColor,
      stretch: true,
      centerTitle: true,
      floating: true,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: [
          StretchMode.zoomBackground,
          StretchMode.fadeTitle,
        ],
        background: Stack(
          fit: StackFit.expand,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40)),
              child: Image.asset(
                "lib/src/assets/images/1619376967490.jpeg",
                fit: BoxFit.cover,
              ),
            ),
            DecoratedBox(
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.0, 1),
                  colors: [
                    Color(0x00000000),
                    Theme.of(context).primaryColor.withOpacity(0.05),
                  ],
                  end: Alignment(0.0, 0.0),
                ),
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
    );
  }
}
