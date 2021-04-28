import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pigamers/src/screens/mobilemode/pi_event.dart';
import 'package:pigamers/src/screens/mobilemode/pi_news_widget.dart';
import 'package:pigamers/src/screens/social/social_row.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../constants.dart';
import 'home_top_text.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Column(
            children: [
              SizedBox(height: kDefaultPadding * 2),
              HomeTopText(),
              SizedBox(height: kDefaultPadding * 1.5),
              SocialRow(),
              SizedBox(height: kDefaultPadding * 1.5),
              kIsWeb ? Container() : PiEventsWidget(),
              SizedBox(height: kDefaultPadding * 1.5),
              kIsWeb ? Container() : PiNewsWidget(),
              !kIsWeb
                  ? Container()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: kDefaultPadding * 1.5),
                          child: Text(
                            "À propos",
                            style: Theme.of(context)
                                .textTheme
                                .headline3!
                                .copyWith(color: Colors.pinkAccent),
                          ),
                        ),
                        SizedBox(height: kDefaultPadding * 0.5),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: kDefaultPadding * 1.5),
                          child: Text(
                              "Bienvenue sur Pi’gamers, installe toi, car tu vas y rester un bon moment.\n \nPi’gamers est un jeu fait pour toutes personnes possédant un smartphone, un accès internet, un cerveau et un minimum d’esprit de compétition. \n\nMets ta culture générale à l’épreuve à travers nos différents quizz et nos lives, et repars avec des cadeaux en tout genre. \n\nOui des cadeaux, des plus symboliques aux plus coûteux, gagne avec un maximum de points et repars avec de nombreux lots. Pi’gamers c’est aussi des bonus, de la monnaie virtuelle qui te permet de jouer et d’assister aux lives gratuitement.\n \nFais-toi un maximum de Croins et de bonus en invitant tes amis et en partageant l’aventure avec eux. Puisque comme on dit, plus on est de fous plus on rit.",
                              style: GoogleFonts.barlow(
                                  fontSize: 15,
                                  color: context.brightness == Brightness.light
                                      ? kContentColorLightTheme
                                      : kContentColorDarkTheme)),
                        ),
                        SizedBox(height: kDefaultPadding * 1.1),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: kDefaultPadding * 1.5),
                          child: Text(
                            "Nos services",
                            style: Theme.of(context)
                                .textTheme
                                .headline3!
                                .copyWith(color: Colors.pinkAccent),
                          ),
                        ),
                        SizedBox(height: kDefaultPadding * 0.5),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: kDefaultPadding * 1.5),
                          child: Text(
                            "Nous avons un site web sur lequel nous postons des articles sur des sujets divers et variés. Fréquenter assidument notre site et nos pages vous permettra de vous apprêter pour les quizz et ainsi de maximiser vos chances de gagner",
                            style: GoogleFonts.barlow(
                                fontSize: 15,
                                color: context.brightness == Brightness.light
                                    ? kContentColorLightTheme
                                    : kContentColorDarkTheme),
                          ),
                        ),
                        SizedBox(height: kDefaultPadding * 1.1),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: kDefaultPadding * 1.5),
                          child: Text(
                            "Un beau design",
                            style: Theme.of(context)
                                .textTheme
                                .headline3!
                                .copyWith(color: Colors.pinkAccent),
                          ),
                        ),
                        SizedBox(height: kDefaultPadding * 0.5),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: kDefaultPadding * 1.5),
                          child: Text(
                            "Notre application est aérée. Elle est faite selon des couleurs aussi attrayantes que simples. Le design d’une simplicité et d’une beauté hors norme a l’avantage de vous permettre de vous retrouver facilement sur la plateforme.",
                            style: GoogleFonts.barlow(
                                fontSize: 15,
                                color: context.brightness == Brightness.light
                                    ? kContentColorLightTheme
                                    : kContentColorDarkTheme),
                          ),
                        ),
                        SizedBox(height: kDefaultPadding * 1.1),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: kDefaultPadding * 1.5),
                          child: Text(
                            "Une application mobile, tablette, Pc",
                            style: Theme.of(context)
                                .textTheme
                                .headline3!
                                .copyWith(color: Colors.pinkAccent),
                          ),
                        ),
                        SizedBox(height: kDefaultPadding * 0.5),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: kDefaultPadding * 1.5),
                          child: Text(
                            "Téléchargeable sur les sites de téléchargement quel que soit votre smartphone, notre application à l’avantage de ne pas peser considérablement et de se servir très modérément de votre forfait internet. Pi’gamers n’est pas uniquement fait pour vous divertir mais pour vous informer et vous apprendre.",
                            style: GoogleFonts.barlow(
                                fontSize: 15,
                                color: context.brightness == Brightness.light
                                    ? kContentColorLightTheme
                                    : kContentColorDarkTheme),
                          ),
                        ),
                        SizedBox(height: kDefaultPadding * 1.1),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: kDefaultPadding * 1.5),
                          child: Text(
                            "Assistance et support",
                            style: Theme.of(context)
                                .textTheme
                                .headline3!
                                .copyWith(color: Colors.pinkAccent),
                          ),
                        ),
                        SizedBox(height: kDefaultPadding * 0.5),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: kDefaultPadding * 1.5),
                          child: Text(
                            "En cas de difficultés divers en tentant de vous offrir nos services, vous êtes libres de poser toutes vos questions histoire d’éclairer tous vos points d’ombres. Vous aurez dans la mesure du possible un guide pour faciliter votre expérience sur Pi’Gamers.",
                            style: GoogleFonts.barlow(
                                fontSize: 15,
                                color: context.brightness == Brightness.light
                                    ? kContentColorLightTheme
                                    : kContentColorDarkTheme),
                          ),
                        ),
                      ],
                    ).p16(),
            ],
          ),
        ],
      ),
    );
  }
}
