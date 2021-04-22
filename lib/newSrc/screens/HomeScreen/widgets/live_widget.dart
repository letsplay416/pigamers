import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

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
                backgroundColor: Colors.transparent,
                child: SvgPicture.asset(
                  "lib/src/assets/svg/live-streaming.svg",
                ),
                onPressed: () {
                  Get.defaultDialog(
                      actions: [
                        ElevatedButton(
                            onPressed: () async {
                              Clipboard.setData(new ClipboardData(
                                  text:
                                      FirebaseAuth.instance.currentUser!.uid));
                              await canLaunch(snapshot.data["link"])
                                  ? await launch(snapshot.data["link"])
                                  : throw 'Could not launch ${snapshot.data["link"]}';
                            },
                            child: Text("Rejoindre"))
                      ],
                      title: "Participer au live",
                      content: Text(
                          "Clique sur le bouton ci-dessus pour copier ton code d'accès et rejoindre le Live !"));
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
