// GENERATED-LITE: Manual Firebase options for Web only
// If you later add mobile platforms, consider using flutterfire CLI to regenerate.

import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, TargetPlatform, kIsWeb;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
      case TargetPlatform.linux:
        return web; // Fallback to web config for now
      case TargetPlatform.fuchsia:
        return web;
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyA1x9ys38dj0bFkOkNttMnYlvUoPW5fN-I',
    authDomain: 'madhur-s-portfolio.firebaseapp.com',
    projectId: 'madhur-s-portfolio',
    storageBucket: 'madhur-s-portfolio.firebasestorage.app',
    messagingSenderId: '443717955134',
    appId: '1:443717955134:web:fe0e63c90c997664aa2b6f',
    measurementId: 'G-1K40X6HWLK',
  );
}

