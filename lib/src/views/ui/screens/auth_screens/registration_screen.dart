import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pigamers/src/logic/controllers/auth_controller.dart';
import 'package:pigamers/src/views/utils/app_strings.dart';

class RegistrationScreen extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _mailCtrl = TextEditingController();
    TextEditingController _pseudoCtrl = TextEditingController();
    TextEditingController _passwordCtrl = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.registrationScreenTitle),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _pseudoCtrl,
            keyboardType: TextInputType.name,
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
              prefixIcon: Icon(Icons.arrow_left_outlined),
              hintText: "Pseudo",
            ),
          ),
          SizedBox(
            height: 14,
          ),
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
                onPressed: () => Get.back(),
                child: Text(
                  AppStrings.registrationScreenToSignIn,
                ),
              ),
              ElevatedButton(
                onPressed: () => controller.registration(
                  email: _mailCtrl.text.trim(),
                  password: _passwordCtrl.text.trim(),
                  name: _pseudoCtrl.text.trim(),
                ),
                child: Text(
                  AppStrings.registrationScreenButton,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
