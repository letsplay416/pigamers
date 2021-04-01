import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pigamers/src/logic/controllers/auth_controller.dart';
import 'package:pigamers/src/views/ui/screens/auth_screens/registration_screen.dart';
import 'package:pigamers/src/views/ui/widgets/auth_action_btn.dart';
import 'package:pigamers/src/views/ui/widgets/switch_auth_text.dart';
import 'package:pigamers/src/views/utils/app_strings.dart';
import 'package:pigamers/src/views/utils/constants.dart';

class LoginScreen extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _mailCtrl = TextEditingController();
    TextEditingController _passwordCtrl = TextEditingController();
    RxBool showPsw = false.obs;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: Get.size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppStrings.loginScreenTitle,
                style: TextStyle(
                    color: kPrimaryColor, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: Get.size.height * 0.12,
              ),
              SvgPicture.asset(
                "lib/src/assets/svg/undraw_Mobile_life_re_jtih.svg",
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
                  controller: _mailCtrl,
                  autofocus: false,
                  cursorColor: kPrimaryColor,
                  style: TextStyle(color: kPrimaryColor),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintStyle:
                          TextStyle(color: kPrimaryColor.withOpacity(0.7)),
                      icon: FaIcon(FontAwesomeIcons.user),
                      border: InputBorder.none,
                      hintText: "Entrez votre mail"),
                ),
                width: Get.size.width * 0.8,
              ),
              Obx(
                () => Container(
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
                    obscureText: showPsw.value,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        hintStyle:
                            TextStyle(color: kPrimaryColor.withOpacity(0.7)),
                        suffix: GestureDetector(
                          onTap: () => showPsw.value = (!showPsw.value),
                          child: FaIcon(
                            FontAwesomeIcons.eye,
                            color: kPrimaryColor,
                            size: 21,
                          ),
                        ),
                        icon: FaIcon(FontAwesomeIcons.lock),
                        border: InputBorder.none,
                        hintText: "Mot de passe"),
                  ),
                  width: Get.size.width * 0.8,
                ),
              ),
              SizedBox(
                height: Get.size.height * 0.03,
              ),
              AuthActionButton(
                title: AppStrings.loginScreenButton,
                action: () => controller.signIn(
                  email: _mailCtrl.text.trim(),
                  password: _passwordCtrl.text.trim(),
                ),
              ),
              SwitchAuthText(
                text1: "Tu n'as pas encore de compte ?",
                text2: "  Créer un compte",
                target: RegistrationScreen(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
