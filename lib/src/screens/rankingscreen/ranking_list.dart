import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../constants.dart';
import 'my_svg_btn.dart';

class RankingList extends StatelessWidget {
  final bool rankedByFlame;

  const RankingList({Key? key, required this.rankedByFlame}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return StreamBuilder<QuerySnapshot>(
      stream: rankedByFlame
          ? users.orderBy("flame", descending: true).snapshots()
          : users.orderBy("exp", descending: true).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Wrap(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            return Container(
              margin: const EdgeInsets.all(10),
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: rankedByFlame
                    ? kFourthColor.withOpacity(0.7)
                    : kSecondaryColor.withOpacity(0.7),
                borderRadius: BorderRadiusDirectional.circular(20),
              ),
              child: Center(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor:
                            rankedByFlame ? kPrimaryColor : kFourthColor,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: CircleAvatar(
                            backgroundColor:
                                !rankedByFlame ? kPrimaryColor : kFourthColor,
                            radius: 45,
                            backgroundImage: NetworkImage(
                              document.data()!['profilPic'] != ""
                                  ? document.data()!['profilPic']
                                  : "https://firebasestorage.googleapis.com/v0/b/pi-gamers.appspot.com/o/logo_transparent.png?alt=media&token=330c9cb0-01b9-4bc5-afa5-209117f59fe7",
                            ),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            document.data()!['name'],
                            style: GoogleFonts.acme(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: kContentColorDarkTheme),
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  MySvgBtn1(
                                    name: "lib/src/assets/svg/flame.svg",
                                    color: Colors.red,
                                    action: () {
                                      Get.snackbar(
                                        document.data()!['name'],
                                        "Possède ${NumberFormat.decimalPattern().format(document.data()!['flame'])} Flame 🔥",
                                      );
                                    },
                                  ),
                                  Text(
                                    NumberFormat.compact()
                                        .format(document.data()!['flame'])
                                        .toString(),
                                    style: GoogleFonts.acme(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.red),
                                  ),
                                  Row(
                                    children: [
                                      MySvgBtn1(
                                        name: "lib/src/assets/svg/graph.svg",
                                        color: kThirdColor,
                                        action: () {
                                          Get.snackbar(
                                            document.data()!['name'],
                                            "Possède ${NumberFormat.decimalPattern().format(document.data()!['exp'])} Exp 📈",
                                          );
                                        },
                                      ),
                                      Text(
                                        NumberFormat.compact()
                                            .format(document.data()!['exp'])
                                            .toString(),
                                        style: GoogleFonts.acme(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: kThirdColor),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      MySvgBtn1(
                                        name: "lib/src/assets/svg/heart.svg",
                                        color: Colors.pinkAccent,
                                        action: () async {
                                          final FirebaseFirestore _firestore =
                                              FirebaseFirestore.instance;

                                          try {
                                            await _firestore
                                                .collection("users")
                                                .doc(document.data()!['uid'])
                                                .get()
                                                .then((value) {
                                              _firestore
                                                  .collection("users")
                                                  .doc(document.data()!['uid'])
                                                  .update({
                                                "like":
                                                    (value.data()!["like"] + 1),
                                              }).then((value) => Get.snackbar(
                                                        "+1 ❤️",
                                                        "Tu as liké ${document.data()!['name']}",
                                                      ));
                                            });
                                          } catch (e) {
                                            Get.snackbar("Error", e.toString());
                                          }
                                        },
                                      ),
                                      Text(
                                        NumberFormat.compact()
                                            .format(document.data()!['like'])
                                            .toString(),
                                        style: GoogleFonts.acme(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: Colors.pinkAccent),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
