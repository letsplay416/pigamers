import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pigamers/src/views/ui/screens/auth_screens/login_screen.dart';
import 'package:pigamers/src/views/ui/screens/auth_screens/registration_screen.dart';
import 'package:pigamers/src/views/utils/constants.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: Get.size.height * 0.13,
            ),
            Text(
              "Bienvenue Pi'Gamers",
              style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.normal,
                  fontSize: 30),
            ),
            SizedBox(
              height: Get.size.height * 0.1,
            ),
            SvgPicture.asset(
              "lib/src/assets/logo/pig2.svg",
              height: Get.size.height * 0.45,
            ),
            SizedBox(
              height: Get.size.height * 0.03,
              width: double.infinity,
            ),
            Container(
              child: TextButton(
                onPressed: () => Get.to(LoginScreen()),
                child: Text("Login"),
                style: TextButton.styleFrom(primary: kPrimaryColor),
              ),
              width: Get.size.width * 0.8,
              decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(30)),
            ),
            SizedBox(
              height: Get.size.height * 0.03,
            ),
            Container(
              child: TextButton(
                onPressed: () => Get.to(RegistrationScreen()),
                child: Text("Register"),
                style: TextButton.styleFrom(primary: Colors.white),
              ),
              width: Get.size.width * 0.8,
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(30)),
            ),
            // SizedBox(
            //   height: Get.size.height * 0.03,
            // ),
          ],
        ),
      ),
    );
  }
}
