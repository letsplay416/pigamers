import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pigamers/src/constants.dart';

class AuthServices {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void signIn({required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Erreur de connexion", e.message.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void registration(
      {required String email,
      required String password,
      required String name,
      required String dadId,
      required String number,
      required double dadCroins}) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        final FirebaseFirestore _firestore = FirebaseFirestore.instance;
        try {
          await _firestore
              .collection("users")
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .set({
            "name": name,
            "email": email,
            "uid": FirebaseAuth.instance.currentUser!.uid,
            "exp": 100,
            "profilPic":
                "https://firebasestorage.googleapis.com/v0/b/pi-gamers.appspot.com/o/logo_transparent.png?alt=media&token=330c9cb0-01b9-4bc5-afa5-209117f59fe7",
            "phoneNumber": number,
            "croins": 1,
            "flame": 100,
            "like": 12,
            "lastConnect": {
              "lastConnect": DateTime.now().millisecondsSinceEpoch,
              "onDay": 1
            },
          }).then((value) async {
            Get.back();
            if (dadId != "") {
              try {
                await _firestore
                    .collection("users")
                    .doc(dadId)
                    .update({"croins": dadCroins + 1}).catchError((errorr) {});
              } catch (e) {}
            } else {}
          }).catchError(
            (error) {
              printError(info: error.toString());
            },
          );
        } catch (e) {}
      });
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Erreur de connexion", e.message.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void signOut() async {
    try {
      await _firebaseAuth.signOut().then((value) => Get.snackbar(
          "Je suis déconnecté", "",
          snackPosition: SnackPosition.BOTTOM));
    } on FirebaseAuthException catch (e) {
      Get.snackbar("AppStrings.logoutFail", e.message.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  updateRessources() async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    String uid = FirebaseAuth.instance.currentUser!.uid;
    showIt({required String title, required String desc}) {
      Get.dialog(
        AlertDialog(
          actions: [
            OutlinedButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all<Color>(
                  Get.theme!.primaryColor,
                ),
                foregroundColor: MaterialStateProperty.all<Color>(
                  Colors.red,
                ),
                shadowColor: MaterialStateProperty.all<Color>(
                  Colors.red,
                ),
              ),
              onPressed: () => Get.back(),
              child: Text("Fermer"),
            ),
          ],
          title: Text(title),
          backgroundColor: Get.theme!.backgroundColor.withOpacity(0.8),
          content: Text(desc),
        ),
      );
    }

    DocumentSnapshot doc = await _firestore.collection("users").doc(uid).get();
    try {
      DateTime date = DateTime.fromMillisecondsSinceEpoch(
          doc.data()!["lastConnect"]["lastConnect"]);
      Duration azerty = DateTime.now().difference(date);
      int onDay = doc.data()!["lastConnect"]["onDay"];
      if (azerty > Duration(hours: 48)) {
        showIt(
          title: "Oups tu viens de perdre tes flames",
          desc:
              "Ton compteur de Flame vient de retomber à zéro. Connecte-toi quotidiennement pour grimper dans le classement. Bonne chance",
        );
        _firestore.collection("users").doc(uid).update({
          "lastConnect": {
            "lastConnect": DateTime.now().millisecondsSinceEpoch,
            "onDay": onDay
          },
          "flame": 10,
        });
      } else if (azerty < Duration(hours: 24)) {
        Get.snackbar("Bonus de connexion quotidienne",
            "Connecte toi dans ${(Duration(hours: 24) - azerty).inHours} heures pour une récompense",
            colorText: kPrimaryColor);
      } else {
        switch (onDay) {
          case 1:
            showIt(
                title: "Bonus de connexion quotidienne",
                desc: "Tu viens de gagner 10 Flames");
            _firestore.collection("users").doc(uid).update({
              "lastConnect": {
                "lastConnect": DateTime.now().millisecondsSinceEpoch.toInt(),
                "onDay": 2
              },
              "flame": (doc.data()!["flame"] + 10),
            });
            break;
          case 2:
            showIt(
                title: "Bonus de connexion quotidienne",
                desc: "Tu viens de gagner 20 Flames");
            _firestore.collection("users").doc(uid).update({
              "lastConnect": {
                "lastConnect": DateTime.now().millisecondsSinceEpoch.toInt(),
                "onDay": 3
              },
              "flame": (doc.data()!["flame"] + 20),
            });
            break;
          case 3:
            showIt(
                title: "Bonus de connexion quotidienne",
                desc: "Tu viens de gagner 20 Flames");
            _firestore.collection("users").doc(uid).update({
              "lastConnect": {
                "lastConnect": DateTime.now().millisecondsSinceEpoch.toInt(),
                "onDay": 4
              },
              "flame": (doc.data()!["flame"] + 20),
            });
            break;
          case 4:
            showIt(
                title: "Bonus de connexion quotidienne",
                desc: "Tu viens de gagner 30 Flames");
            _firestore.collection("users").doc(uid).update({
              "lastConnect": {
                "lastConnect": DateTime.now().millisecondsSinceEpoch.toInt(),
                "onDay": 5
              },
              "flame": (doc.data()!["flame"] + 30),
            });
            break;
          case 5:
            showIt(
                title: "Bonus de connexion quotidienne",
                desc: "Tu viens de gagner 40 Flames");
            _firestore.collection("users").doc(uid).update({
              "lastConnect": {
                "lastConnect": DateTime.now().millisecondsSinceEpoch.toInt(),
                "onDay": 6
              },
              "flame": (doc.data()!["flame"] + 40),
            });
            break;
          case 6:
            showIt(
                title: "Bonus de connexion quotidienne",
                desc: "Tu viens de gagner 50 Flames");
            _firestore.collection("users").doc(uid).update({
              "lastConnect": {
                "lastConnect": DateTime.now().millisecondsSinceEpoch.toInt(),
                "onDay": 7
              },
              "flame": (doc.data()!["flame"] + 50),
            });
            break;
          case 7:
            showIt(
                title: "Bonus de connexion quotidienne",
                desc: "Tu viens de gagner 100 Flames");
            _firestore.collection("users").doc(uid).update({
              "lastConnect": {
                "lastConnect": DateTime.now().millisecondsSinceEpoch.toInt(),
                "onDay": 1
              },
              "flame": (doc.data()!["flame"] + 100),
              "croins": (doc.data()!["croins"] + 1),
            });
            break;
          default:
            print("LastConnect");
        }
      }
    } catch (e) {
      Get.snackbar("Erreur", e.toString());
    }
  }
}
