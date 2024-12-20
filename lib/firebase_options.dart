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
    apiKey: 'AIzaSyCDJQO8w5XNXfmIbwFhZdBuHPZD8E5YR3I',
    appId: '1:960819466293:web:5193a8459b9556c3f0217c',
    messagingSenderId: '960819466293',
    projectId: 'crack-parser-432112-q5',
    authDomain: 'crack-parser-432112-q5.firebaseapp.com',
    storageBucket: 'crack-parser-432112-q5.firebasestorage.app',
    measurementId: 'G-VQXSFC4X6V',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCr420wGkGaZ1vQwJlPUfBJ4cDr9nuFQW4',
    appId: '1:960819466293:android:d8c0e96ac725ee53f0217c',
    messagingSenderId: '960819466293',
    projectId: 'crack-parser-432112-q5',
    storageBucket: 'crack-parser-432112-q5.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDbMAQVSOSihTRusn6QmaVTIlYyXMfqri8',
    appId: '1:960819466293:ios:89b1928e12681a5cf0217c',
    messagingSenderId: '960819466293',
    projectId: 'crack-parser-432112-q5',
    storageBucket: 'crack-parser-432112-q5.firebasestorage.app',
    iosBundleId: 'com.example.hokiLoKocak',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDbMAQVSOSihTRusn6QmaVTIlYyXMfqri8',
    appId: '1:960819466293:ios:89b1928e12681a5cf0217c',
    messagingSenderId: '960819466293',
    projectId: 'crack-parser-432112-q5',
    storageBucket: 'crack-parser-432112-q5.firebasestorage.app',
    iosBundleId: 'com.example.hokiLoKocak',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCDJQO8w5XNXfmIbwFhZdBuHPZD8E5YR3I',
    appId: '1:960819466293:web:e8d5c2e4695ef309f0217c',
    messagingSenderId: '960819466293',
    projectId: 'crack-parser-432112-q5',
    authDomain: 'crack-parser-432112-q5.firebaseapp.com',
    storageBucket: 'crack-parser-432112-q5.firebasestorage.app',
    measurementId: 'G-ZTQ75CF9ZZ',
  );
}
