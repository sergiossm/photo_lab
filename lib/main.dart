import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:photo_lab/firebase_options_dev.dart'
    as prod; // TODO: Change to prod
import 'package:photo_lab/firebase_options_dev.dart'
    as stg; // TODO: Change to stg
import 'package:photo_lab/firebase_options_dev.dart' as dev;
import 'package:photo_lab/src/app.dart';
import 'package:photo_lab/src/flavors.dart';

void main() async {
  // Initializes services and controllers before the start of the application
  WidgetsFlutterBinding.ensureInitialized();

  final flavor = getFlavor();

  // Initializes Firebase
  final firebaseOptions = switch (flavor) {
    Flavor.production => prod.DefaultFirebaseOptions.currentPlatform,
    Flavor.staging => stg.DefaultFirebaseOptions.currentPlatform,
    Flavor.development => dev.DefaultFirebaseOptions.currentPlatform,
  };
  await Firebase.initializeApp(options: firebaseOptions);

  runApp(const PhotoLabApp());
}
