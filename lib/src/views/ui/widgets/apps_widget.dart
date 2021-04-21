import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pigamers/src/views/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';

import 'image_view.dart';

class AppsNewsAdsWidget extends StatelessWidget {
  const AppsNewsAdsWidget({
    Key? key,
    required this.imgUrl,
    required this.link,
    required this.isNews,
  }) : super(key: key);

  final String imgUrl;
  final String link;
  final bool isNews;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      height: Get.size.height,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(30),
      ),
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(9),
        child: GridTile(
          header: GridTileBar(
            title: Container(),
            trailing: ClipRRect(
              borderRadius: BorderRadius.circular(9),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                child: Container(
                  height: 30,
                  width: 30,
                  child: IconButton(
                    icon: isNews
                        ? SvgPicture.asset(
                            "lib/src/assets/svg/menu.svg",
                            color: kPrimaryColor,
                          )
                        : SvgPicture.asset(
                            "lib/src/assets/svg/fi-br-redo.svg",
                            color: kPrimaryColor,
                          ),
                    onPressed: () async {
                      if (!isNews) {
                        
                      await canLaunch(link)
                          ? await launch(link)
                          : throw 'Could not launch $link';
                      } else {
                         Get.bottomSheet(
                                Container(
                                  decoration: BoxDecoration(
                                    color: kPrimaryColor.withOpacity(0.5),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(50),
                                      topRight: Radius.circular(50),
                                    ),
                                  ),
                                  child: ListView(
                                    children: [
                                      Text(
                                        link,
                                        style: GoogleFonts.acme(fontSize: 30),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                      }
                    },
                  ),
                  decoration: BoxDecoration(
                    color: kContentColorLightTheme.withOpacity(0.2),
                    border: Border.all(color: kSecondaryColor.withOpacity(0.8)),
                    borderRadius: BorderRadius.circular(9),
                  ),
                ),
              ),
            ),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(9),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                child: Container(
                  height: 30,
                  width: 30,
                  child: IconButton(
                    icon: SvgPicture.asset(
                      "lib/src/assets/svg/expand.svg",
                      color: kPrimaryColor,
                    ),
                    onPressed: () {
                      Get.dialog(ImageView(image: imgUrl));
                    },
                  ),
                  decoration: BoxDecoration(
                    color: kContentColorLightTheme.withOpacity(0.2),
                    border: Border.all(color: kSecondaryColor.withOpacity(0.8)),
                    borderRadius: BorderRadius.circular(9),
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
                  // color: kThirdColor,
                  backgroundColor: kContentColorLightTheme,
                ),
              );
            },
            imageUrl: imgUrl,
          ),
        ),
      ),
    );
  }
}
