// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDdbIP8Ic0bCXGntqJ2r0nKHTwmp649Rn4',
    appId: '1:1076340422537:web:bbeb977e0f67ccb8575358',
    messagingSenderId: '1076340422537',
    projectId: 'movieapp-e4ff2',
    authDomain: 'movieapp-e4ff2.firebaseapp.com',
    storageBucket: 'movieapp-e4ff2.firebasestorage.app',
    measurementId: 'G-1KE48D651P',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBkXxIC67asKvwE8TPYgSUuar3ub41Benc',
    appId: '1:1076340422537:android:acc7dcf056dfd000575358',
    messagingSenderId: '1076340422537',
    projectId: 'movieapp-e4ff2',
    storageBucket: 'movieapp-e4ff2.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB_fHjpbuPnD-QW2wAzMNQ6MhK0Zf08ct4',
    appId: '1:1076340422537:ios:55bc62af112c8148575358',
    messagingSenderId: '1076340422537',
    projectId: 'movieapp-e4ff2',
    storageBucket: 'movieapp-e4ff2.firebasestorage.app',
    iosBundleId: 'com.example.untitled1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB_fHjpbuPnD-QW2wAzMNQ6MhK0Zf08ct4',
    appId: '1:1076340422537:ios:55bc62af112c8148575358',
    messagingSenderId: '1076340422537',
    projectId: 'movieapp-e4ff2',
    storageBucket: 'movieapp-e4ff2.firebasestorage.app',
    iosBundleId: 'com.example.untitled1',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDdbIP8Ic0bCXGntqJ2r0nKHTwmp649Rn4',
    appId: '1:1076340422537:web:9f1dd1b55a8dc0a5575358',
    messagingSenderId: '1076340422537',
    projectId: 'movieapp-e4ff2',
    authDomain: 'movieapp-e4ff2.firebaseapp.com',
    storageBucket: 'movieapp-e4ff2.firebasestorage.app',
    measurementId: 'G-9B6F997JDN',
  );

}