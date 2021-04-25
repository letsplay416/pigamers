import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';

class MySvgBtn extends StatelessWidget {
  final String name;
  final Color color;
  final Function action;
  const MySvgBtn(
      {Key? key, required this.name, required this.color, required this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(300.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: Container(
            child: IconButton(
                icon: WebsafeSvg.asset(
                  name,
                  color: color,
                ),
                onPressed: () => action()),
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor.withOpacity(0.4),
              border: Border.all(color: color),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}



class MySvgBtn1 extends StatelessWidget {
  final String name;
  final Color color;
  final Function action;
  const MySvgBtn1(
      {Key? key, required this.name, required this.color, required this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: Container(
            height: 40,
            width: 40,
            child: IconButton(
                icon: WebsafeSvg.asset(
                  name,
                  color: color,
                ),
                onPressed: () => action()),
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor.withOpacity(0.4),
              border: Border.all(color: color),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
    );
  }
}
