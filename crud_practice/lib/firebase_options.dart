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
    appId: '1:355171485341:android:8d5d1aece0c244439eb674',
    messagingSenderId: '355171485341',
    projectId: 'firestore-crud-9f376',
    storageBucket: 'firestore-crud-9f376.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyByTqJ8kOubUllt5D68E4l8zomsP37RaQI',
    appId: '1:355171485341:ios:8c3508e97cc21a9d9eb674',
    messagingSenderId: '355171485341',
    projectId: 'firestore-crud-9f376',
    storageBucket: 'firestore-crud-9f376.appspot.com',
    iosClientId: '355171485341-li49j7sf1tv33l6nhffbp8qc5e0cqv67.apps.googleusercontent.com',
    iosBundleId: 'com.example.crudPractice',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyByTqJ8kOubUllt5D68E4l8zomsP37RaQI',
    appId: '1:355171485341:ios:f484da1072d22fb99eb674',
    messagingSenderId: '355171485341',
    projectId: 'firestore-crud-9f376',
    storageBucket: 'firestore-crud-9f376.appspot.com',
    iosClientId: '355171485341-j9q2cdejtd6iepg126svab05a4hbahe0.apps.googleusercontent.com',
    iosBundleId: 'com.example.crudPractice.RunnerTests',
  );
}
