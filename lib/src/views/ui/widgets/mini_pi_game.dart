import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: Get.width * 0.25,
        child: Center(
          child: Text(
            activ ? text.toUpperCase() : text,
            style: TextStyle(
              color: activ
                  ? Theme.of(context).backgroundColor
                  : Theme.of(context).primaryColor,
              fontWeight: activ ? FontWeight.bold : FontWeight.w600,
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: activ ? kPrimaryColor : Colors.transparent,
          border: Border.all(
              color: activ
                  ? Theme.of(context).backgroundColor.withOpacity(0.2)
                  : Theme.of(context).primaryColor.withOpacity(0.2)),
          boxShadow: [
            BoxShadow(
              offset: Offset(2, 2),
              blurRadius: 2,
              color:
                  activ ? Theme.of(context).primaryColor : Colors.transparent,
            ),
          ],
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
