import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
          return Column(
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
                          onPressed: () {},
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
                  Clipboard.setData(new ClipboardData(text: "your text"));
                  Get.snackbar("Id copié", "");
                },
              ),
            ],
          );
        },
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
        onPressed: action(),
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
