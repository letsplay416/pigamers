import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pigamers/src/views/utils/constants.dart';

class SwitchAuthText extends StatelessWidget {
  final String text1;
  final String text2;
  final Widget target;

  const SwitchAuthText(
      {Key? key,
      required this.text1,
      required this.text2,
      required this.target})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 35),
      child: Row(
        children: [
          Text(
            text1,
            style:
                TextStyle(color: Colors.black38, fontWeight: FontWeight.normal),
          ),
          GestureDetector(
            onTap: () => Get.off(target),
            child: Text(
              text2,
              style:
                  TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
            ),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}
