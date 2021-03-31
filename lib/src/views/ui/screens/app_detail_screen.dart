import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pigamers/src/views/utils/constants.dart';

class AppDetail extends StatelessWidget {
  final String imagUrl;
  final String title;
  final String desc;

  const AppDetail(
      {Key? key,
      required this.imagUrl,
      required this.title,
      required this.desc})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.size.height,
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(imagUrl),
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    color: kContentColorLightTheme,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
                Expanded(
                  flex: 2,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: kContentColorLightTheme,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(100),
                          ),
                        ),
                        child: Container(
                          child: ListView(
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text(
                                  title,
                                  textAlign: TextAlign.end,
                                  style: Theme.of(context).textTheme.headline2,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(25.0),
                                child: Text(
                                  desc,
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(14.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(70),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.all(
                  Radius.circular(70),
                ),
              ),
              // width: Get.width / 1.1,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: Get.width * 0.2,
                      decoration: BoxDecoration(
                          color: kContentColorLightTheme,
                          border: Border.all(width: 1, color: kThirdColor),
                          borderRadius: BorderRadius.circular(70)),
                      child: Center(
                          child: FaIcon(
                        FontAwesomeIcons.accusoft,
                        color: kThirdColor,
                      )),
                    ),
                  ),
                  Expanded(child: Container()),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: Get.width * 0.5,
                      decoration: BoxDecoration(
                          color: kContentColorLightTheme.withOpacity(0.2),
                          border: Border.all(width: 1, color: kPrimaryColor),
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                        child: FaIcon(
                          FontAwesomeIcons.download,
                          color: kContentColorDarkTheme,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              height: Get.size.height * 0.06,
            ),
          ),
        ),
      ),
    );
  }
}

//  return Scaffold(
//       body: Column(
//         children: [
//           Expanded(
//             child: Container(
//               height: Get.size.height * 0.4,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: NetworkImage(imagUrl),
//                   fit: BoxFit.cover,
//                   alignment: Alignment.topCenter,
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: Container(
//               decoration: BoxDecoration(
//                 color: kSecondaryColor,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(100),
//                 ),
//               ),
//             ),
//             flex: 3,
//           )
//         ],
//       ),
//     );
