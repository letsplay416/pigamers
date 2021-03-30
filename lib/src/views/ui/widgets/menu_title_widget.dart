import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pigamers/src/views/utils/constants.dart';

class MenuTile extends StatelessWidget {
  final String title;
  final String desc;
  final IconData icon;
  final Function action;

  const MenuTile(
      {required this.title,
      required this.icon,
      required this.action,
      required this.desc});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.all(10),
      child: ListTile(
        subtitle: Text(desc),
        title: Text(
          title,
          style: TextStyle(
            color: kContentColorLightTheme.withOpacity(0.6),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        trailing: FaIcon(
          icon,
          color: kContentColorLightTheme.withOpacity(0.4),
        ),
        onTap: () => action(),
      ),
    );
  }
}
