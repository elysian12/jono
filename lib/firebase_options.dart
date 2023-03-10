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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCTCzQcA6fwM-2Fz2QSowLGOiO8kECIfOM',
    appId: '1:359558977429:android:f855db07fb28e7b077889c',
    messagingSenderId: '359558977429',
    projectId: 'jono-queue',
    storageBucket: 'jono-queue.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC8MVMgOuMB7u3ceaI4fXGlSEuaPmpETrs',
    appId: '1:359558977429:ios:4d82421acc09ab4a77889c',
    messagingSenderId: '359558977429',
    projectId: 'jono-queue',
    storageBucket: 'jono-queue.appspot.com',
    androidClientId: '359558977429-qn6dmcj0qmd4h15jo9poe09c8jgaakmt.apps.googleusercontent.com',
    iosClientId: '359558977429-1ab4c3f4i8hmgi9opva33carv81kai8g.apps.googleusercontent.com',
    iosBundleId: 'com.elysian.jono',
  );
}
