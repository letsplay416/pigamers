

import 'package:cloud_firestore/cloud_firestore.dart';

class PiAdsModel {
  String? title;
  String? imgUrl;

  PiAdsModel({this.title, this.imgUrl});

  PiAdsModel.fromSnapshot(DocumentSnapshot documentSnapshot) {
    title = documentSnapshot["title"];
    imgUrl = documentSnapshot["imgUrl"];
  }
}
