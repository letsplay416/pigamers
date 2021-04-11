import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pigamers/src/logic/controllers/rankin_widget_controller.dart';
import 'package:pigamers/src/logic/services/database/database.dart';
import 'package:pigamers/src/views/utils/constants.dart';

import 'image_view.dart';

class RankingWidget extends GetWidget<RankingWidgetController> {
  const RankingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return Obx(() => StreamBuilder<QuerySnapshot>(
          stream: controller.isFlameRanked.value
              ? users.orderBy("flame", descending: true).snapshots()
              : users.orderBy("exp", descending: true).snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return new Wrap(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                return Container(
                  decoration: BoxDecoration(
                      color: kFourthColor.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(20)),
                  margin: EdgeInsets.all(10),
                  padding: const EdgeInsets.only(right: 10),
                  child: Container(
                    width: double.infinity,
                    height: 120,
                    decoration: BoxDecoration(
                        color: kFourthColor,
                        borderRadius: BorderRadiusDirectional.circular(20)),
                    child: Center(
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () => Get.dialog(ImageView(
                                image: document.data()!['profilPic'] != ""
                                    ? document.data()!['profilPic']
                                    : "https://firebasestorage.googleapis.com/v0/b/pi-gamers.appspot.com/o/my_logo.png?alt=media&token=42666768-33dd-400e-9976-6e843a83bb4f")),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(document
                                                    .data()!['profilPic'] !=
                                                ""
                                            ? document.data()!['profilPic']
                                            : "https://firebasestorage.googleapis.com/v0/b/pi-gamers.appspot.com/o/my_logo.png?alt=media&token=42666768-33dd-400e-9976-6e843a83bb4f"),
                                        fit: BoxFit.cover),
                                    color: Colors.black.withOpacity(0.3),
                                    border: Border.all(
                                        width: 3,
                                        color:
                                            Theme.of(context).backgroundColor),
                                    borderRadius: BorderRadius.circular(20)),
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
                                      fontSize: 25,
                                      color: kContentColorDarkTheme),
                                ),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        MySvgBtn(
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
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        MySvgBtn(
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
                                        MySvgBtn(
                                          name: "lib/src/assets/svg/heart.svg",
                                          color: Colors.pinkAccent,
                                          action: () {
                                            Database().ikeBtn(
                                                pseudo:
                                                    document.data()!['name'],
                                                uid: document.data()!['uid']);
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
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            );
          },
        ));
  }
}

class MySvgBtn extends StatelessWidget {
  final String name;
  final Color color;
  final Function action;
  const MySvgBtn(
      {Key? key, required this.name, required this.color, required this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: Container(
            height: 40,
            width: 40,
            child: IconButton(
                icon: SvgPicture.asset(
                  name,
                  color: color,
                ),
                onPressed: () => action()),
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor.withOpacity(0.4),
              border: Border.all(color: color),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
    );
  }
}
