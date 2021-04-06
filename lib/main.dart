import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pigamers/src/pi_gamers_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(PiGamersApp());
}
//! Changer mini!games par nos réseaux sociaux
//! Voir les actions du menu
//! Terminer le setting screen
