import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:velocity_x/velocity_x.dart';

class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: Builder(
        builder: (context) => IconButton(
          icon: WebsafeSvg.asset(
            "lib/src/assets/svg/menu.svg",
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
      expandedHeight: context.screenHeight * 0.2,
      backgroundColor: Theme.of(context).backgroundColor,
      stretch: true,
      centerTitle: true,
      floating: true,
      actions: [
        InkWell(
          onTap: () => Scaffold.of(context).openEndDrawer(),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Builder(
              builder: (context) => FaIcon(
                FontAwesomeIcons.fire,
                size: 28,
                color: context.accentColor,
              ),
            ),
          ),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: [
          StretchMode.zoomBackground,
          StretchMode.fadeTitle,
          // StretchMode.blurBackground
        ],
        background: Stack(
          fit: StackFit.expand,
          children: [
            WebsafeSvg.asset(
              "lib/src/assets/logo/pig1.svg",
              fit: BoxFit.contain,
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
