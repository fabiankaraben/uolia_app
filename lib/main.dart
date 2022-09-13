import 'dart:io';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uolia_app/app/app.dart';
import 'package:uolia_app/utils/auth/ensure_initialized_auth.dart';
import 'package:uolia_app/firebase_options.dart';

void main() async {
  // This method required for initializations before calling runApp.
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // Preserve Native Splash during initializations
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Initialize Hive local storage
  if (kIsWeb) {
    // Emulating remote db
    await Hive.openBox<Map<String, dynamic>>('users');
    await Hive.openBox<Map<String, dynamic>>('libraries');
    await Hive.openBox<Map<String, dynamic>>('resources');
    // Only local and multipurpose key-value storage
    await Hive.openBox<dynamic>('localConfig');
  } else {
    final appDocDir = await getApplicationSupportDirectory();
    final appDocPath = appDocDir.path;
    // Emulating remote db
    await Hive.openBox<Map<String, dynamic>>('users', path: appDocPath);
    await Hive.openBox<Map<String, dynamic>>('libraries', path: appDocPath);
    await Hive.openBox<Map<String, dynamic>>('resources', path: appDocPath);
    // Only local and multipurpose key-value storage
    await Hive.openBox<dynamic>('localConfig', path: appDocPath);
  }

  // Initialize Firebase app
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  // Configure Firebase auth providers
  // FlutterFireUIAuth.configureProviders([
  //   const EmailProviderConfiguration(),
  // ]);

  // Wait until receiving the first data from Firebase Auth
  // await ensureInitializedAuth();

  // Init Google Analytics
  // final analytics = FirebaseAnalytics();

  // Remove Native Splash
  FlutterNativeSplash.remove();

  // Run the App
  runApp(
    // Adding ProviderScope enables Riverpod for the entire project
    ProviderScope(child: App()),
  );
}
