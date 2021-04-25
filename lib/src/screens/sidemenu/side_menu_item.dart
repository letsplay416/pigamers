import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SideMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function action;
  final bool isred;

  const SideMenuItem(
      {Key? key,
      required this.icon,
      required this.title,
      required this.action,
      this.isred = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: FaIcon(
        icon,
        color: isred ? Colors.red : Theme.of(context).primaryColor,
      ),
      title: Row(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Text(
                title,
                style: TextStyle(
                    color: Theme.of(context).textTheme.headline2!.color),
              ),
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color:isred ? Colors.red : Theme.of(context).primaryColor.withOpacity(0.5),
                  width: 5.0,
                ),
              ),
            ),
          ),
        ],
      ),
      onTap: () => action(),
    );
  }
}
