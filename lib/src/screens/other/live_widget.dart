import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pigamers/src/constants.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:websafe_svg/websafe_svg.dart';

class LiveWidget extends StatelessWidget {
  const LiveWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("appData")
          .doc("live")
          .snapshots(),
      initialData: Container(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return Container();
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container();
        } else {
          if (snapshot.data["isLive"]) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                mini: true,
                backgroundColor: kThirdColor.withOpacity(0.3),
                child: WebsafeSvg.asset(
                  "lib/src/assets/svg/live-streaming.svg",
                ),
                onPressed: () {
                  Get.dialog(
                    AlertDialog(
                      title: Text(
                        "Participer au live",
                        style: TextStyle(
                            color: context.brightness == Brightness.light
                                ? kContentColorLightTheme
                                : kContentColorDarkTheme),
                      ),
                      backgroundColor: Theme.of(context).backgroundColor,
                      content: Text(
                          "Clique sur le bouton ci-dessus pour copier ton code d'accès et rejoindre le Live !\n Cela te coutera 2 Croins"),
                      actions: [
                        ElevatedButton(
                            onPressed: () async {
                              await FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(FirebaseAuth.instance.currentUser!.uid)
                                  .get()
                                  .then((value) async {
                                if (value.data()!['croins'] >= 2) {
                                  await FirebaseFirestore.instance
                                      .collection("users")
                                      .doc(FirebaseAuth
                                          .instance.currentUser!.uid)
                                      .update({
                                    "croins": value.data()!['croins'] - 2
                                  });
                                  Clipboard.setData(new ClipboardData(
                                      text: FirebaseAuth
                                          .instance.currentUser!.uid));
                                  context.showToast(
                                      msg: "-2 Croins",
                                      position: VxToastPosition.center,
                                      bgColor: context.backgroundColor,
                                      textColor: context.primaryColor);
                                  await canLaunch(snapshot.data["link"])
                                      ? await launch(snapshot.data["link"])
                                      : throw 'Could not launch ${snapshot.data["link"]}';
                                } else {
                                  Get.dialog(
                                    AlertDialog(
                                      title: Text(
                                        'Impossible de participer',
                                        style: TextStyle(
                                            color: context.brightness ==
                                                    Brightness.light
                                                ? kContentColorLightTheme
                                                : kContentColorDarkTheme),
                                      ),
                                      backgroundColor: Theme.of(context)
                                          .backgroundColor
                                          .withOpacity(0.8),
                                      content: Text(
                                          "Désolé, tu n'as pas assez de Croins. Parraine des amis ou achete des Croins"),
                                      actions: [
                                        OutlinedButton(
                                          style: ButtonStyle(
                                            overlayColor: MaterialStateProperty
                                                .all<Color>(
                                              kSecondaryColor,
                                            ),
                                            foregroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(
                                              kSecondaryColor,
                                            ),
                                            shadowColor: MaterialStateProperty
                                                .all<Color>(
                                              kSecondaryColor,
                                            ),
                                          ),
                                          onPressed: () async {
                                            String url =
                                                "https://api.whatsapp.com/send?phone=22990347744&text=Hello%20je%20viens%20de%20Pi'Gamers";
                                            await canLaunch(url)
                                                ? await launch(url)
                                                : throw 'Could not launch $url';
                                          },
                                          child: Text(
                                            "Recharger le compte",
                                            style: TextStyle(
                                                color: kSecondaryColor),
                                          ),
                                        ),
                                        OutlinedButton(
                                          style: ButtonStyle(
                                            overlayColor: MaterialStateProperty
                                                .all<Color>(
                                              kSecondaryColor,
                                            ),
                                            foregroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(
                                              Colors.red,
                                            ),
                                            shadowColor: MaterialStateProperty
                                                .all<Color>(
                                              kThirdColor,
                                            ),
                                          ),
                                          onPressed: () {
                                            context.pop();
                                            {
                                              String uid = FirebaseAuth
                                                  .instance.currentUser!.uid;
                                              Share.share(
                                                  "Hey. Tu t'ennuies?? J'ai découvert un jeu qui permet de répondre à des questions diverses à temps et jouer d'autres mini-jeux avec d'autres joueurs du monde tout en gagnant des cadeaux Télécharge là maintenant sur https://play.google.com/store/apps/details?id=inc.poison.pigamers. N'oublie pas mon identifiant comme id du parrain: $uid",
                                                  subject:
                                                      'Viens gagner des cadeaux');
                                            }
                                          },
                                          child: Text(
                                            "Inviter des amis",
                                            style:
                                                TextStyle(color: kThirdColor),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              });
                            },
                            child: Text("Rejoindre"))
                      ],
                    ),
                  );
                },
              ),
            );
          } else {
            return Container();
          }
        }
      },
    );
  }
}
