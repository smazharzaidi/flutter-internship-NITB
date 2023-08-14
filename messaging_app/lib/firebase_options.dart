// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyB74S_BoLQE-vsKK6eRjg_p2mswXq5ih48',
    appId: '1:527231158211:web:4bab660a84d02b85475f76',
    messagingSenderId: '527231158211',
    projectId: 'chatapp-f26ce',
    authDomain: 'chatapp-f26ce.firebaseapp.com',
    storageBucket: 'chatapp-f26ce.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDtAL5zRiV85VNDG2MVjlE4nh8QvtRpaNk',
    appId: '1:527231158211:android:8dd7ea08731850ea475f76',
    messagingSenderId: '527231158211',
    projectId: 'chatapp-f26ce',
    storageBucket: 'chatapp-f26ce.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCwJBkMgrEgAordcVz3DI0awvfeZLNmYsA',
    appId: '1:527231158211:ios:98a49c9cda14d6cc475f76',
    messagingSenderId: '527231158211',
    projectId: 'chatapp-f26ce',
    storageBucket: 'chatapp-f26ce.appspot.com',
    iosClientId: '527231158211-u9kdk9u8cljh3hsn9f1628o7mp7i4hjs.apps.googleusercontent.com',
    iosBundleId: 'com.example.messagingApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCwJBkMgrEgAordcVz3DI0awvfeZLNmYsA',
    appId: '1:527231158211:ios:e453472e4a532939475f76',
    messagingSenderId: '527231158211',
    projectId: 'chatapp-f26ce',
    storageBucket: 'chatapp-f26ce.appspot.com',
    iosClientId: '527231158211-ltq01akpn3550vi80c46c3kbbrpcbuc6.apps.googleusercontent.com',
    iosBundleId: 'com.example.messagingApp.RunnerTests',
  );
}