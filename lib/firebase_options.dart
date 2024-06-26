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
    apiKey: 'AIzaSyC0hXhTGmdzioIjVvjYRTXL2t3e1o0cXxU',
    appId: '1:909278387908:web:d44b7784d58e4bd3f57391',
    messagingSenderId: '909278387908',
    projectId: 'my-stocks-flutter-project',
    authDomain: 'my-stocks-flutter-project.firebaseapp.com',
    storageBucket: 'my-stocks-flutter-project.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA5u05UBd5rlmZZVnb2mxfgADl0KhaSGNA',
    appId: '1:909278387908:android:5e8a4fa9e3158989f57391',
    messagingSenderId: '909278387908',
    projectId: 'my-stocks-flutter-project',
    storageBucket: 'my-stocks-flutter-project.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBFvQ1475uGkcaiecq1tu4U1nWmG9Wgkzk',
    appId: '1:909278387908:ios:cb2ce4e57b69e384f57391',
    messagingSenderId: '909278387908',
    projectId: 'my-stocks-flutter-project',
    storageBucket: 'my-stocks-flutter-project.appspot.com',
    iosBundleId: 'com.example.stocks',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBFvQ1475uGkcaiecq1tu4U1nWmG9Wgkzk',
    appId: '1:909278387908:ios:cb2ce4e57b69e384f57391',
    messagingSenderId: '909278387908',
    projectId: 'my-stocks-flutter-project',
    storageBucket: 'my-stocks-flutter-project.appspot.com',
    iosBundleId: 'com.example.stocks',
  );
}
