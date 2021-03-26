import 'package:cloud_firestore/cloud_firestore.dart';

class PiNewsModel {
  String? title;
  String? imgUrl;

  PiNewsModel({this.title, this.imgUrl});

  PiNewsModel.fromSnapshot(DocumentSnapshot documentSnapshot) {
    title = documentSnapshot["title"];
    imgUrl = documentSnapshot["imgUrl"];
  }
}
