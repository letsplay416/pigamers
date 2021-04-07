import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MiniPiGames extends StatelessWidget {
  final String text;
  final Color color;
  final String url;
  MiniPiGames({
    required this.text,
    required this.color,
    required this.url,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () async {
          await canLaunch(url)
              ? await launch(url)
              : throw 'Could not launch $url';
        },
        child: Container(
          width: 100,
          child: Center(
            child: Text(
              text.toUpperCase(),
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            border: Border.all(color: color.withOpacity(0.7)),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 0),
                spreadRadius: 1,
                blurRadius: 5,
                color: color.withOpacity(0.4),
              ),
            ],
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
