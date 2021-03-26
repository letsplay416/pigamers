

import 'package:cloud_firestore/cloud_firestore.dart';

class PiEventsModel {
  String? title;
  String? imgUrl;

  PiEventsModel({this.title, this.imgUrl});

  PiEventsModel.fromSnapshot(DocumentSnapshot documentSnapshot) {
    title = documentSnapshot["title"];
    imgUrl = documentSnapshot["imgUrl"];
  }
}
