import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pigamers/src/views/utils/constants.dart';

class AuthActionButton extends StatelessWidget {
  final String title;
  final action;
  const AuthActionButton({
    Key? key,
    required this.title,
    required this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        onPressed: action,
        child: Text(title),
        style: TextButton.styleFrom(primary: Colors.white),
      ),
      width: Get.size.width * 0.6,
      decoration: BoxDecoration(
          color: kPrimaryColor, borderRadius: BorderRadius.circular(30)),
    );
  }
}
