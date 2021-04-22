import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pigamers/src/logic/controllers/auth_controller.dart';
import 'package:pigamers/src/views/ui/widgets/menu_widget.dart';

class HomeScreen extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Menu(controller: controller),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.lightBlue,
                child: Center(
                  child: Text(
                    MediaQuery.of(context).size.width.toString(),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.greenAccent,
                child: Center(
                  child: Text(
                    MediaQuery.of(context).size.width.toString(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
