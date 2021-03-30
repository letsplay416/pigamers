import 'package:cloud_firestore/cloud_firestore.dart';

class AppModel {
  late String title;
  late String desc;
  late String imgUrl;
  late bool isGame;
  late String link;

  AppModel({
    this.title = "The Game",
    this.desc = "Une appli baddasse",
    this.imgUrl =
        "https://image.freepik.com/vecteurs-libre/jeu-joystick-technologie-du-sport_138676-2045.jpg",
    this.isGame = true,
    this.link =
        "https://www.google.com/webhp?hl=fr&sa=X&ved=0ahUKEwjWzsj6j9jvAhUCExoKHQpLDHEQPAgI",
  });
  AppModel.fromSnapshot(DocumentSnapshot documentSnapshot) {
    title = documentSnapshot["title"];
    desc = documentSnapshot["desc"];
    imgUrl = documentSnapshot["imgUrl"];
    link = documentSnapshot["link"];
    isGame = documentSnapshot["isGame"];
  }
}
