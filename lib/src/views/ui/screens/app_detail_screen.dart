import 'package:flutter/material.dart';
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text(
                                  title,
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
                      Container(
                        decoration:
                            BoxDecoration(color: kFourthColor.withOpacity(0.3)),
                        height: 30,
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
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