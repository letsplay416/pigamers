import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pigamers/src/views/utils/constants.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DocumentReference user = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Settings Screen",
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: FutureBuilder(
        future: user.get(),
        initialData: Container(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                  width: 150,
                  child: Stack(
                    fit: StackFit.expand,
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: kPrimaryColor, shape: BoxShape.circle),
                        padding: const EdgeInsets.all(3),
                        child: CircleAvatar(
                          backgroundImage:
                              NetworkImage(snapshot.data["profilPic"]),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 3,
                        child: SizedBox(
                          height: 40,
                          width: 40,
                          child: TextButton(
                            onPressed: () => Get.snackbar("Statut V.I.P requis",
                                "Besoin du statut V.I.P pour modifier sa photo de profile",
                                duration: Duration(seconds: 5)),
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<OutlinedBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50))),
                              side: MaterialStateProperty.all<BorderSide>(
                                  BorderSide(width: 1, color: kPrimaryColor)),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Theme.of(context).backgroundColor,
                              ),
                            ),
                            child: SvgPicture.asset(
                              "lib/src/assets/svg/fi-br-mode-portrait.svg",
                              // height: 17,
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RessourceWidget(
                        number: snapshot.data["flame"].toString(),
                        icon: FontAwesomeIcons.fire,
                        color: Colors.redAccent),
                    RessourceWidget(
                        number: snapshot.data["croins"].toString(),
                        icon: FontAwesomeIcons.coins,
                        color: Colors.yellow),
                    RessourceWidget(
                        number: snapshot.data["exp"].toString(),
                        icon: FontAwesomeIcons.chartLine,
                        color: Colors.white),
                  ],
                ),
                SettingBtn(
                  action: () {},
                  title: snapshot.data["name"],
                  icon: "lib/src/assets/svg/user.svg",
                ),
                SettingBtn(
                  action: () {},
                  title: snapshot.data["email"],
                  icon: "lib/src/assets/svg/check.svg",
                ),
                SettingBtn(
                  title: snapshot.data["uid"],
                  icon: "lib/src/assets/svg/user0.svg",
                  action: () {
                    String uid = FirebaseAuth.instance.currentUser!.uid;
                    Clipboard.setData(new ClipboardData(text: uid));
                    Get.snackbar("Id copié", uid,
                        duration: Duration(seconds: 5));
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class RessourceWidget extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String number;
  const RessourceWidget({
    Key? key,
    required this.icon,
    required this.color,
    required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 80,
        width: 60,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FaIcon(
              icon,
              color: color,
            ),
            Text(
              number,
              textAlign: TextAlign.center,
              style:
                  Theme.of(context).textTheme.headline3!.copyWith(color: color),
            )
          ],
        )),
        decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              width: 1,
              color: color,
            ),
            boxShadow: [
              BoxShadow(color: color, blurRadius: 6, spreadRadius: 1)
            ]),
      ),
    );
  }
}

class SettingBtn extends StatelessWidget {
  final String title;
  final Function action;
  final String icon;
  const SettingBtn(
      {Key? key, required this.title, required this.icon, required this.action})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: TextButton(
        onPressed: () => action(),
        style: ButtonStyle(
          shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
          padding: MaterialStateProperty.all(EdgeInsets.all(20)),
          backgroundColor: MaterialStateProperty.all<Color>(
            Theme.of(context).accentColor.withOpacity(0.2),
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              width: 22,
              color: kPrimaryColor,
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
                child: Text(
              title,
              style:
                  Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 20),
            )),
            SvgPicture.asset(
              "lib/src/assets/svg/caret-right.svg",
              width: 22,
              color: kPrimaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
