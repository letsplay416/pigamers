import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pigamers/src/screens/other/view_screen.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../constants.dart';

class PiEventsWidget extends StatelessWidget {
  final piEventsController = Get.put<PiEventsController>(PiEventsController());
  @override
  Widget build(BuildContext context) {
    CollectionReference events =
        FirebaseFirestore.instance.collection('piEvents');
//!changer en stream
    return FutureBuilder<QuerySnapshot>(
      future: events.get(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.5),
              child: Text(
                "Pi'Events",
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            SizedBox(height: kDefaultPadding * 0.1),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Obx(() => Text(
                        piEventsController.currentTitle.string,
                        style: Theme.of(context).textTheme.headline2,
                      )),
                
                ],
              ),
            ),
            SizedBox(height: kDefaultPadding * 2),
            CarouselSlider.builder(
              options: CarouselOptions(
                height: context.orientation == Orientation.portrait
                    ? Get.size.height / 4
                    : Get.size.width / 3,
                pauseAutoPlayOnManualNavigate: true,
                pauseAutoPlayOnTouch: true,
                aspectRatio: 9 / 16,
                viewportFraction:
                    context.orientation == Orientation.portrait ? 0.8 : 0.4,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 6),
                autoPlayAnimationDuration: Duration(milliseconds: 1000),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  piEventsController.changeTitle(
                    newTitle: snapshot.data!.docs[index]["title"].toString(),
                  );
                },
                scrollDirection: Axis.horizontal,
              ),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index, realIndex) => Stack(
                alignment: Alignment.topRight,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: context.orientation == Orientation.portrait
                          ? Get.size.height / 2
                          : Get.size.width / 2,
                      width: double.infinity,
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        progressIndicatorBuilder: (context, url, progress) {
                          return Center(
                            child: CircularProgressIndicator(
                              value: progress.progress,
                              backgroundColor: kContentColorLightTheme,
                            ),
                          );
                        },
                        imageUrl:
                            snapshot.data!.docs[index]["imgUrl"].toString(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                        child: Container(
                          height: 40,
                          width: 40,
                          child: IconButton(
                            icon: WebsafeSvg.asset(
                              "lib/src/assets/svg/expand.svg",
                              color: kThirdColor,
                            ),
                            onPressed: () {
                              Get.dialog(ImageView(
                                  image: snapshot.data!.docs[index]["imgUrl"]));
                            },
                          ),
                          decoration: BoxDecoration(
                            color: kContentColorLightTheme.withOpacity(0.2),
                            border: Border.all(
                                width: 2,
                                color: kSecondaryColor.withOpacity(0.8)),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: kDefaultPadding * 2),
          ],
        );
      },
    );
  }
}

class PiEventsController extends GetxController {
  var currentTitle = "".obs;
  void changeTitle({required String newTitle}) {
    currentTitle.value = newTitle;
  }
}
