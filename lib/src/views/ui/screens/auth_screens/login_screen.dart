import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pigamers/src/logic/controllers/auth_controller.dart';
import 'package:pigamers/src/views/ui/screens/auth_screens/registration_screen.dart';
import 'package:pigamers/src/views/utils/app_strings.dart';

class LoginScreen extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _mailCtrl = TextEditingController();
    TextEditingController _passwordCtrl = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.loginScreenTitle),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _mailCtrl,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  style: BorderStyle.solid,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
              prefixIcon: Icon(Icons.email),
              hintText: "Email",
            ),
          ),
          SizedBox(
            height: 14,
          ),
          TextField(
            controller: _passwordCtrl,
            obscureText: true,
            maxLength: 13,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  style: BorderStyle.solid,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
              prefixIcon: Icon(Icons.shield),
              hintText: "Password",
            ),
          ),
          SizedBox(
            height: 14,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () => Get.to(RegistrationScreen()),
                child: Text(
                  AppStrings.loginScreenToSignUp,
                ),
              ),
              ElevatedButton(
                onPressed: () => controller.signIn(
                  email: _mailCtrl.text.trim(),
                  password: _passwordCtrl.text.trim(),
                ),
                child: Text(
                  AppStrings.loginScreenButton,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
