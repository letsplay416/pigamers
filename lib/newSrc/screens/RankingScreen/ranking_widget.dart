import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pigamers/src/views/ui/widgets/image_view.dart';
import 'package:pigamers/src/views/utils/constants.dart';

import 'my_svg_btn.dart';
import 'rankin_widget_controller.dart';

class RankingWidget extends GetWidget<RankingWidgetController> {
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return Obx(
      () => StreamBuilder<QuerySnapshot>(
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
                  margin: const EdgeInsets.all(10),
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                      color: kFourthColor.withOpacity(0.7),
                      borderRadius: BorderRadiusDirectional.circular(20)),
                  child: Center(
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        GestureDetector(
                            onTap: () => Get.dialog(
                                  ImageView(
                                      image: document.data()!['profilPic'] != ""
                                          ? document.data()!['profilPic']
                                          : "https://firebasestorage.googleapis.com/v0/b/pi-gamers.appspot.com/o/my_logo.png?alt=media&token=42666768-33dd-400e-9976-6e843a83bb4f"),
                                ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                radius: 40,
                                backgroundColor:
                                    Get.theme!.primaryColor.withOpacity(0.8),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: CircleAvatar(
                                    radius: 45,
                                    backgroundImage: NetworkImage(
                                      document.data()!['profilPic'] != ""
                                          ? document.data()!['profilPic']
                                          : "https://firebasestorage.googleapis.com/v0/b/pi-gamers.appspot.com/o/my_logo.png?alt=media&token=42666768-33dd-400e-9976-6e843a83bb4f",
                                    ),
                                  ),
                                ),
                              ),
                            )
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
                                          //TODO Database().ikeBtn(
                                          //     pseudo:
                                          //         document.data()!['name'],
                                          //     uid: document.data()!['uid']);
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
                );
              }).toList(),
            );
          }),
    );
  }
}
