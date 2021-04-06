import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pigamers/src/views/utils/constants.dart';

class AppsWidget extends StatelessWidget {
  const AppsWidget({
    Key? key,
    required this.imgUrl,
  }) : super(key: key);

  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.bottomCenter,
            children: [
              new CachedNetworkImage(
                fit: BoxFit.cover,
                progressIndicatorBuilder: (context, url, progress) {
                  return CircularProgressIndicator(
                    value: progress.progress,
                    color: kThirdColor,
                    backgroundColor: kContentColorLightTheme,
                  );
                },
                imageUrl: imgUrl,
              ),
              Container(
                color: Colors.transparent,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                        child: Container(
                          height: 40,
                          width: 40,
                          child: IconButton(
                            icon: SvgPicture.asset(
                              "lib/src/assets/svg/flame.svg",
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
                    )
                  ],
                ),
                height: 19,
              )
            ],
          ),
        ),
      ),
    );
  }
}
