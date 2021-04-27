import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants.dart';

class SocialRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<SocialWidget> listGames = [
      SocialWidget(
        name: "Telegram",
        color: Colors.lightBlue,
        link: "https://t.me/PiGamers0",
      ),
      SocialWidget(
        name: "WhatsApp",
        color: Colors.green,
        link:
            "https://api.whatsapp.com/send?phone=22990347744&text=Hello%20je%20viens%20de%20Pi'Gamers",
      ),
      SocialWidget(
        name: "Site Web",
        color:
            !Get.isDarkMode ? kContentColorLightTheme : kContentColorDarkTheme,
        link: "https://pi-gamers.web.app",
      ),
      SocialWidget(
        name: "Play Store",
        color: Colors.amber,
        link:
            "https://play.google.com/store/apps/details?id=inc.poison.pigamers",
      ),
      SocialWidget(
        name: "Instagram",
        color: Colors.pinkAccent,
        link: "https://instagram.com/pigamers_?igshid=sd3uxc62i125",
      ),
      SocialWidget(
        name: "Facebook",
        color: Colors.blue,
        link: "https://www.facebook.com/PiGamers-103019665265628",
      ),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.5),
          child: Text(
            "Pi'Social",
            style: Theme.of(context)
                .textTheme
                .headline3!
                .copyWith(color: Colors.pinkAccent),
          ),
        ),
        SizedBox(height: kDefaultPadding * 0.5),
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.5),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Rejoins-nous pour un max de Fun",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: kDefaultPadding * 0.5),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 60,
            child: ListView.builder(
              itemCount: listGames.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => GestureDetector(
                child: SocialBtn(
                  color: listGames[index].color,
                  text: listGames[index].name,
                  url: listGames[index].link,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SocialWidget {
  final String name;
  final Color color;
  final String link;

  SocialWidget({
    required this.name,
    required this.color,
    required this.link,
  });
}

class SocialBtn extends StatelessWidget {
  final String text;
  final Color color;
  final String url;
  SocialBtn({
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
