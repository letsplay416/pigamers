import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pigamers/src/logic/controllers/pi_news_controller.dart';
import 'package:pigamers/src/views/ui/screens/menu_screens/more_news_screen.dart';
import 'package:pigamers/src/views/utils/constants.dart';

class PiNewsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final piNewsController = Get.put<PiNewsController>(PiNewsController());
    CollectionReference news = FirebaseFirestore.instance.collection('piNews');
//!changer en stream
    return FutureBuilder(
      future: news.get(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Container();
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(
            color: Theme.of(context).accentColor,
          );
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.5),
              child: Text(
                "Pi'News",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: kPrimaryColor),
              ),
            ),
            SizedBox(height: kDefaultPadding * 0.2),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () => Text(
                      piNewsController.currentTitle.string,
                      style: GoogleFonts.acme(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: kContentColorDarkTheme),
                    ),
                  ),
                  TextButton(
                    onPressed: () => Get.to(MoreNewsScreen()),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.all(1)),
                        overlayColor: MaterialStateProperty.all<Color>(
                          kPrimaryColor.withOpacity(0.4),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.transparent)),
                    child: Text(
                      "voir plus",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: kPrimaryColor),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: kDefaultPadding * 2),
            CarouselSlider.builder(
              options: CarouselOptions(
                height: Get.size.height * 0.7,
                pauseAutoPlayOnManualNavigate: true,
                pauseAutoPlayOnTouch: true,
                aspectRatio: 9 / 16,
                viewportFraction:
                    context.orientation == Orientation.portrait ? 0.6 : 0.4,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: false,
                onPageChanged: (index, reason) {
                  piNewsController.changeTitle(
                    newTitle: snapshot.data!.docs[index]["type"].toString(),
                  );
                },
                scrollDirection: context.orientation == Orientation.portrait
                    ? Axis.vertical
                    : Axis.horizontal,
              ),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index, realIndex) => Container(
                margin: const EdgeInsets.all(12),
                height: Get.size.height,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(30),
                ),
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: GridTile(
                    header: GridTileBar(
                      title: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                          child: Container(
                            height: 40,
                            width: 40,
                            child: FittedBox(
                              child: Text(
                                snapshot.data!.docs[index]["title"].toString(),
                                style: GoogleFonts.akronim(),
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: kContentColorLightTheme.withOpacity(0.2),
                              border: Border.all(
                                  color: kSecondaryColor.withOpacity(0.8)),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                      trailing: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                          child: Container(
                            height: 40,
                            width: 40,
                            child: IconButton(
                              icon: SvgPicture.asset(
                                "lib/src/assets/svg/apps.svg",
                                color: kPrimaryColor,
                              ),
                              onPressed: () => Get.bottomSheet(
                                Container(
                                  decoration: BoxDecoration(
                                    color: kPrimaryColor.withOpacity(0.5),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(50),
                                      topRight: Radius.circular(50),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Text(
                                        snapshot.data!.docs[index]["title"]
                                            .toString(),
                                        style: GoogleFonts.acme(fontSize: 30),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: kContentColorLightTheme.withOpacity(0.2),
                              border: Border.all(
                                  color: kSecondaryColor.withOpacity(0.8)),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                          child: Container(
                            height: 40,
                            width: 40,
                            child: IconButton(
                              icon: SvgPicture.asset(
                                "lib/src/assets/svg/expand.svg",
                                color: kPrimaryColor,
                              ),
                              onPressed: () {},
                            ),
                            decoration: BoxDecoration(
                              color: kContentColorLightTheme.withOpacity(0.2),
                              border: Border.all(
                                  color: kSecondaryColor.withOpacity(0.8)),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                    ),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      progressIndicatorBuilder: (context, url, progress) {
                        return Center(
                          child: CircularProgressIndicator(
                            value: progress.progress,
                            color: kThirdColor,
                            backgroundColor: kContentColorLightTheme,
                          ),
                        );
                      },
                      imageUrl: snapshot.data!.docs[index]["imgUrl"].toString(),
                    ),
                  ),
                ),
              ),
            ),
            // SizedBox(height: kDefaultPadding * 2),
          ],
        );
      },
    );
  }
}
