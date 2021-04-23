import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pigamers/newSrc/screens/HomeScreen/widgets/live_widget.dart';
import 'package:pigamers/newSrc/screens/RankingScreen/ranking_screen.dart';
import 'package:pigamers/newSrc/screens/SideMenu/side_menu.dart';
import 'package:pigamers/src/views/ui/widgets/home_top_text.dart';
import 'package:pigamers/src/views/ui/widgets/image_view.dart';
import 'package:pigamers/src/views/ui/widgets/pi_events.dart';
import 'package:pigamers/src/views/ui/widgets/pi_news_widget.dart';
import 'package:pigamers/src/views/ui/widgets/social_row.dart';
import 'package:pigamers/src/views/utils/constants.dart';

import 'mobile_mode.dart';

class WebMode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Theme.of(context).backgroundColor,
      floatingActionButton: LiveWidget(),
      drawer: SideMenu(),
      endDrawer: RankingScreen(),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          MyAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Column(
                  children: [
                    SizedBox(height: kDefaultPadding * 2),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding * 1.5),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              HiName(),
                              SizedBox(
                                height: kDefaultPadding / 3,
                              ),
                              Text(
                                "Pi'Gamers: Fun, Game, Chill !",
                                textAlign: TextAlign.left,
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            ],
                          ),
                          Expanded(child: Container()),
                          GestureDetector(
                            onTap: () => Get.dialog(Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                        width: 1,
                                        color: Theme.of(context).primaryColor),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset(
                                        "lib/src/assets/images/trioPic.jpeg"),
                                  ),
                                ),
                              ],
                            )),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      width: 1,
                                      color: Theme.of(context).primaryColor),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "lib/src/assets/images/trioPic.jpeg"),
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: kDefaultPadding * 1.5),
                    SocialRow(),
                    SizedBox(height: kDefaultPadding * 1.5),
                    // PiEventsWidget(),
                    SizedBox(height: kDefaultPadding * 1.5),
                    // PiNewsWidget(),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class HiName extends StatelessWidget {
  const HiName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get(),
      initialData: Container(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Text(
            "Hi ${snapshot.data["name"]}",
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.headline1,
          );
        }
      },
    );
  }
}
