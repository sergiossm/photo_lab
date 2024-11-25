import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_lab/firebase_options_dev.dart'
    as prod; // TODO: Change to prod
import 'package:photo_lab/firebase_options_dev.dart'
    as stg; // TODO: Change to stg
import 'package:photo_lab/firebase_options_dev.dart' as dev;
import 'package:photo_lab/src/app.dart';
import 'package:photo_lab/src/application/warmup/providers.dart';
import 'package:photo_lab/src/flavors.dart';
import 'package:photo_lab/src/presentation/warmup/app_warmup_widget.dart';

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

  // Initializes Riverpod's provider container
  final container = ProviderContainer(
    overrides: [],
    observers: [],
  );

  // Warms up the application
  await container.read(appWarmupNotifierProvider.notifier).warmUp();

  // Run the app
  runApp(
    UncontrolledProviderScope(
      container: container,
      child: AppWarmupWidget(
        onLoaded: (context) => const PhotoLabApp(),
      ),
    ),
  );
}
