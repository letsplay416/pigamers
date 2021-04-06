import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pigamers/src/logic/controllers/auth_controller.dart';
import 'package:pigamers/src/views/utils/constants.dart';

class Notifications extends StatelessWidget {
  const Notifications({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final AuthController controller;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: Container(
            height: double.infinity,
            child: ListView(
              children: [
                DrawerHeader(
                  child: Container(
                    decoration: BoxDecoration(
                      color: kThirdColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        "Mes notifications",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                ListTile(
                  title: Text("Aucune notification"),
                  onTap: () {},
                ),
              ],
            ),
            width: Get.size.width * 0.7,
            color: kThirdColor.withOpacity(0.2),
          ),
        ),
      ),
    );
  }
}
