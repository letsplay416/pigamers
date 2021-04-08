import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
              child: FloatingActionButton(mini: true,
                backgroundColor: Colors.transparent,
                child: SvgPicture.asset(
                  "lib/src/assets/svg/live-streaming.svg",
                ),
                onPressed: () async {
                  await canLaunch(snapshot.data["link"])
                      ? await launch(snapshot.data["link"])
                      : throw 'Could not launch ${snapshot.data["link"]}';
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
