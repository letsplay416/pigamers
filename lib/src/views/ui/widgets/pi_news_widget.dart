import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pigamers/src/logic/controllers/pi_news_controller.dart';
import 'package:pigamers/src/logic/models/pi_news_model.dart';
import 'package:pigamers/src/views/utils/constants.dart';

class PiNewsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<PiNewsModel> laList = [
      PiNewsModel(
        imgUrl:
            "https://image.freepik.com/vecteurs-libre/modele-cv-moderne_23-2148773356.jpg",
        title: "Laura Smith",
      ),
      PiNewsModel(
        imgUrl:
            "https://image.freepik.com/vecteurs-libre/modele-curriculum-vitae-moderne_23-2148701203.jpg",
        title: "Futuro Bolid",
      ),
      PiNewsModel(
        imgUrl:
            "https://image.freepik.com/vecteurs-libre/modele-document-elegant-photo_23-2148896375.jpg",
        title: "Naruto & Sasuke",
      ),
    ];
    final piNewsController = Get.put<PiNewsController>(PiNewsController());
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
              Text(
                "piNewsController!",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: kContentColorDarkTheme),
              ),
              TextButton(
                onPressed: () {},
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.all(1)),
                    overlayColor: MaterialStateProperty.all<Color>(
                      kPrimaryColor.withOpacity(0.4),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.transparent)),
                child: Text(
                  "See more",
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
            height: context.orientation == Orientation.portrait
                ? Get.size.height / 4
                : Get.size.width / 3,
            pauseAutoPlayOnManualNavigate: true,
            pauseAutoPlayOnTouch: true,
            aspectRatio: 9 / 16,
            viewportFraction:
                context.orientation == Orientation.portrait ? 0.8 : 0.2,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              // piNewsController!.changeTitle(
              //   newTitle: piNewsController.news![index].title.toString(),
              // );
            },
            scrollDirection: Axis.horizontal,
          ),
          itemCount: laList.length, //piNewsController!.news!.length,
          itemBuilder: (context, index, realIndex) => Stack(
            alignment: Alignment.topRight,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  width: double.infinity,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: laList[index].imgUrl.toString(),
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
                        icon: SvgPicture.asset(
                          "lib/src/assets/svg/caret-right.svg",
                          color: kPrimaryColor,
                        ),
                        onPressed: () {},
                      ),
                      decoration: BoxDecoration(
                        color: kContentColorLightTheme.withOpacity(0.2),
                        border:
                            Border.all(color: kSecondaryColor.withOpacity(0.8)),
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
  }
}
