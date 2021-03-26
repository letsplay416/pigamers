import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  String? name;
  String? email;
  UserModel({required this.id, required this.name, required this.email});

  UserModel.fromDocumentSnapshot({required DocumentSnapshot doc}) {
    this.id = doc.id;
    this.name = doc['name'];
    this.email = doc["email"];
  }
}
