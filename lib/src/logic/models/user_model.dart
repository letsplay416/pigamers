import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  String? name;
  String? email;
  String? profilPic;
  int? exp;
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.exp,
    required this.profilPic,
  });

  UserModel.fromDocumentSnapshot({required DocumentSnapshot doc}) {
    this.id = doc.id;
    this.name = doc['name'];
    this.email = doc["email"];
    this.exp = doc["exp"];
    this.profilPic = doc["profilPic"];
  }
}
