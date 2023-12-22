// firebase_options.dart

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    } else {
      return defaultOptions;
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: "AIzaSyCVyySe5SVh59bi0K7v8m7Cw1KpR6-Yl2Q",
    authDomain: "flutter-e0bf4.firebaseapp.com",
    projectId: "flutter-e0bf4",
    messagingSenderId: '137230848633',
    appId: '1:178213261498:android:38b7010a2c94bb1505f283',
  );

  static const FirebaseOptions defaultOptions = FirebaseOptions(
    apiKey: "AIzaSyCVyySe5SVh59bi0K7v8m7Cw1KpR6-Yl2Q",
    authDomain: "flutter-e0bf4.firebaseapp.com",
    projectId: "flutter-e0bf4",
    messagingSenderId: '137230848633',
    appId: '1:178213261498:android:38b7010a2c94bb1505f283',
  );
}
