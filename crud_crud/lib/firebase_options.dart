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
    apiKey: 'AIzaSyBusk2ZmVUPL_TYbdjmzwJMm7I80punMJ0',
    appId: '1:355171485341:web:f5f013c6c0cd0e669eb674',
    messagingSenderId: '355171485341',
    projectId: 'firestore-crud-9f376',
    authDomain: 'firestore-crud-9f376.firebaseapp.com',
    storageBucket: 'firestore-crud-9f376.appspot.com',
    measurementId: 'G-YMF6K1S0Y1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC4CytWybixBobqn8TuHRq1GfPTN468WVw',
    appId: '1:355171485341:android:d4745d9842c302ea9eb674',
    messagingSenderId: '355171485341',
    projectId: 'firestore-crud-9f376',
    storageBucket: 'firestore-crud-9f376.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyByTqJ8kOubUllt5D68E4l8zomsP37RaQI',
    appId: '1:355171485341:ios:18b813760562574c9eb674',
    messagingSenderId: '355171485341',
    projectId: 'firestore-crud-9f376',
    storageBucket: 'firestore-crud-9f376.appspot.com',
    iosClientId: '355171485341-psl5n33vi9no8h2p5b6lhnliiu6bsorg.apps.googleusercontent.com',
    iosBundleId: 'com.example.crudCrud',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyByTqJ8kOubUllt5D68E4l8zomsP37RaQI',
    appId: '1:355171485341:ios:5fffdec0097125ef9eb674',
    messagingSenderId: '355171485341',
    projectId: 'firestore-crud-9f376',
    storageBucket: 'firestore-crud-9f376.appspot.com',
    iosClientId: '355171485341-u1odc8dec135r2pb8pb1ikgoknpb1pai.apps.googleusercontent.com',
    iosBundleId: 'com.example.crudCrud.RunnerTests',
  );
}
