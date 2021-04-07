import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

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
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.all(10),
      child: ListTile(
        subtitle: Text(
          desc,
          style: GoogleFonts.abel(
            color: Theme.of(context).textTheme.subtitle1!.color,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            color: Theme.of(context).backgroundColor,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        trailing: FaIcon(
          icon,
          color: Theme.of(context).backgroundColor.withOpacity(0.6),
        ),
        onTap: () => action(),
      ),
    );
  }
}
