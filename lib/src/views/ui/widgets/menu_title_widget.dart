import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function action;

  const MenuTile(
      {required this.title, required this.icon, required this.action});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 15,
        ),
      ),
      trailing: FaIcon(icon),
      onTap: action(),
    );
  }
}
