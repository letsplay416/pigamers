import 'package:flutter/material.dart';
import 'package:pigamers/src/views/utils/constants.dart';

class MiniPiGames extends StatelessWidget {
  final String text;
  final bool activ;
  MiniPiGames(
    this.text,
    this.activ,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: kDefaultPadding * 0.5, vertical: kDefaultPadding),
      width: kDefaultPadding * 4,
      height: kDefaultPadding * 2.5,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              color: kContentColorDarkTheme,
              fontWeight: activ ? FontWeight.bold : FontWeight.normal),
        ),
      ),
      decoration: BoxDecoration(
        color: activ ? kPrimaryColor : Colors.transparent,
        border: Border.all(color: kPrimaryColor.withOpacity(0.8)),
        boxShadow: [
          BoxShadow(
            offset: Offset(4, 4),
            blurRadius: 2,
            color:
                activ ? kSecondaryColor.withOpacity(0.23) : Colors.transparent,
          ),
        ],
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
