import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
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
    TextEditingController _dadCtrl = TextEditingController();
    RxBool asDad = false.obs;
    RxString dadUi = "".obs;
    RxDouble dadCroins = 0.0.obs;
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
                    dadId: dadUi.value,
                    dadCroins: dadCroins.value),
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
      floatingActionButton: Obx(() => asDad.value
          ? Container()
          : FloatingActionButton.extended(
              onPressed: () {
                Get.defaultDialog(
                  title: "Ajoute un parrain et gagne des points",
                  confirm: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        kPrimaryColor,
                      ),
                      shadowColor: MaterialStateProperty.all<Color>(
                        kPrimaryColor.withOpacity(0.4),
                      ),
                      overlayColor: MaterialStateProperty.all<Color>(
                        kPrimaryColor.withOpacity(0.4),
                      ),
                    ),
                    onPressed: () async {
                      CollectionReference users =
                          FirebaseFirestore.instance.collection('users');

                      await users.doc(_dadCtrl.text.trim()).get().then((value) {
                        if (value.exists) {
                          Get.back();
                          dadUi.value = _dadCtrl.text.trim();
                          asDad.toggle();
                          dadCroins.value = value.data()!['croins'].toDouble();
                          Get.snackbar("Succès",
                              "Vous et ${value.data()!['name']} recevez votre récompense",
                              duration: Duration(seconds: 5));
                        } else {
                          Get.snackbar("Echec",
                              "Aucun utilisateur avec ce id veuillez recommencer",
                              duration: Duration(seconds: 5));
                        }
                      });
                    },
                    child: Text("Confimer"),
                  ),
                  cancel: OutlinedButton(
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all<Color>(
                        kPrimaryColor,
                      ),
                      foregroundColor: MaterialStateProperty.all<Color>(
                        Colors.red,
                      ),
                      shadowColor: MaterialStateProperty.all<Color>(
                        Colors.red,
                      ),
                    ),
                    onPressed: () => Get.back(),
                    child: Text("Annuler"),
                  ),
                  content: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    margin: EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                        color: kPrimaryColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(29)),
                    child: TextField(
                      controller: _dadCtrl,
                      autofocus: false,
                      cursorColor: kPrimaryColor,
                      style: TextStyle(
                        color: kPrimaryColor,
                      ),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintStyle:
                            TextStyle(color: kPrimaryColor.withOpacity(0.7)),
                        icon: FaIcon(FontAwesomeIcons.user),
                        border: InputBorder.none,
                        hintText: "id du parrain",
                      ),
                    ),
                    width: Get.size.width * 0.8,
                  ),
                );
              },
              label: Text("Ajouter un parrain"),
              backgroundColor: kPrimaryColor,
            )),
    );
  }
}
