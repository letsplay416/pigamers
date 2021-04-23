// import 'package:flutter/material.dart';
// import 'package:websafe_svg/websafe_svg.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:pigamers/src/views/ui/screens/auth_screens/login_screen.dart';
// import 'package:pigamers/src/views/ui/screens/auth_screens/registration_screen.dart';
// import 'package:pigamers/src/views/utils/constants.dart';

// class WelcomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(
//               height: Get.size.height * 0.13,
//             ),
//             Text(
//               "Bienvenue Pi'Gamers",
//               style: GoogleFonts.abel(
//                 color: kPrimaryColor,
//                 fontWeight: FontWeight.normal,
//                 fontSize: 40,
//               ),
//             ),
//             SizedBox(
//               height: Get.size.height * 0.1,
//             ),
//             WebsafeSvg.asset(
//               "lib/src/assets/svg/undraw_video_game_night_8h8m.svg",
//               height: Get.size.height * 0.45,
//             ),
//             SizedBox(
//               height: Get.size.height * 0.03,
//               width: double.infinity,
//             ),
//             Container(
//               child: TextButton(
//                 onPressed: () => Get.to(LoginScreen()),
//                 child: Text("Login"),
//                 style: TextButton.styleFrom(primary: kPrimaryColor),
//               ),
//               width: Get.size.width * 0.8,
//               decoration: BoxDecoration(
//                   color: kPrimaryColor.withOpacity(0.3),
//                   borderRadius: BorderRadius.circular(30)),
//             ),
//             SizedBox(
//               height: Get.size.height * 0.03,
//             ),
//             Container(
//               child: TextButton(
//                 onPressed: () => Get.to(RegistrationScreen()),
//                 child: Text("Register"),
//                 style: TextButton.styleFrom(primary: Colors.white),
//               ),
//               width: Get.size.width * 0.8,
//               decoration: BoxDecoration(
//                   color: kPrimaryColor,
//                   borderRadius: BorderRadius.circular(30)),
//             ),
//             // SizedBox(
//             //   height: Get.size.height * 0.03,
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }
