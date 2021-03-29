import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pigamers/src/logic/controllers/auth_controller.dart';
import 'package:pigamers/src/views/ui/screens/auth_screens/login_screen.dart';
import 'package:pigamers/src/views/ui/widgets/auth_action_btn.dart';
import 'package:pigamers/src/views/ui/widgets/switch_auth_text.dart';
import 'package:pigamers/src/views/utils/app_strings.dart';
import 'package:pigamers/src/views/utils/constants.dart';

class RegistrationScreen extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _mailCtrl = TextEditingController();
    TextEditingController _pseudoCtrl = TextEditingController();
    TextEditingController _passwordCtrl = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: Get.size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppStrings.registrationScreenTitle,
                style: TextStyle(
                    color: kPrimaryColor, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: Get.size.height * 0.012,
              ),
              SvgPicture.asset(
                "lib/src/assets/svg/undraw_mobile_inbox_3h46.svg",
                height: Get.size.height * 0.35,
              ),
              SizedBox(
                height: Get.size.height * 0.06,
                width: double.infinity,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: kPrimaryColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(29)),
                child: TextField(
                  controller: _pseudoCtrl,
                  autofocus: false,
                  cursorColor: kPrimaryColor,
                  style: TextStyle(color: kPrimaryColor),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintStyle:
                          TextStyle(color: kPrimaryColor.withOpacity(0.7)),
                      icon: FaIcon(FontAwesomeIcons.user),
                      border: InputBorder.none,
                      hintText: "Pseudo"),
                ),
                width: Get.size.width * 0.8,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: kPrimaryColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(29)),
                child: TextField(
                  controller: _mailCtrl,
                  autofocus: false,
                  cursorColor: kPrimaryColor,
                  style: TextStyle(color: kPrimaryColor),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintStyle:
                          TextStyle(color: kPrimaryColor.withOpacity(0.7)),
                      icon: FaIcon(FontAwesomeIcons.envelope),
                      border: InputBorder.none,
                      hintText: "Entrez votre mail"),
                ),
                width: Get.size.width * 0.8,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                margin: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                    color: kPrimaryColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(29)),
                child: TextField(
                  controller: _passwordCtrl,
                  autofocus: false,
                  cursorColor: kPrimaryColor,
                  style: TextStyle(
                    color: kPrimaryColor,
                  ),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintStyle:
                          TextStyle(color: kPrimaryColor.withOpacity(0.7)),
                      icon: FaIcon(FontAwesomeIcons.lock),
                      border: InputBorder.none,
                      hintText: "Mots de passe"),
                ),
                width: Get.size.width * 0.8,
              ),
              SizedBox(
                height: Get.size.height * 0.03,
              ),
              AuthActionButton(
                title: AppStrings.registrationScreenButton,
                action: () => controller.registration(
                  email: _mailCtrl.text.trim(),
                  password: _passwordCtrl.text.trim(),
                  name: _pseudoCtrl.text.trim(),
                ),
              ),
              SwitchAuthText(
                text1: "Tu as déjà compte ?",
                text2: "  Connecte toi",
                target: LoginScreen(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
