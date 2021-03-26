import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pigamers/src/pi_gamers_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(PiGamersApp());
}
