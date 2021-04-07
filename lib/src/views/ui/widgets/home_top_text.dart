import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pigamers/src/logic/controllers/user_controller.dart';
import 'package:pigamers/src/views/utils/constants.dart';

class HomeTopText extends StatelessWidget {
  final userCtrl = Get.find<UserController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.5),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() => Text(
                    "Hi ${userCtrl.user.name},",
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.headline1,
                  )),
              SizedBox(
                height: kDefaultPadding / 3,
              ),
              Text(
                "Good day for gaming!",
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ],
          ),
          Expanded(child: Container()),
          FutureBuilder(
            future: FirebaseFirestore.instance
                .collection('users')
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .get(),
            initialData: Container(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                          width: 1, color: Theme.of(context).primaryColor),
                      image: DecorationImage(
                          image: NetworkImage(snapshot.data["profilPic"]),
                          fit: BoxFit.cover),
                    ),
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
