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
    apiKey: 'AIzaSyBQK4ApEaPtbXwKBp5g8j9xOP47Z9L7ImA',
    appId: '1:873231799080:web:9e950f3977dc729361b61d',
    messagingSenderId: '873231799080',
    projectId: 'asosiasi-pengelasan-indonesia',
    authDomain: 'asosiasi-pengelasan-indonesia.firebaseapp.com',
    databaseURL: 'https://asosiasi-pengelasan-indonesia-default-rtdb.firebaseio.com',
    storageBucket: 'asosiasi-pengelasan-indonesia.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBI-PYr-5EfGxjLMi5_6pdry4TNzlBMCiY',
    appId: '1:873231799080:android:bf7782be96b5410b61b61d',
    messagingSenderId: '873231799080',
    projectId: 'asosiasi-pengelasan-indonesia',
    databaseURL: 'https://asosiasi-pengelasan-indonesia-default-rtdb.firebaseio.com',
    storageBucket: 'asosiasi-pengelasan-indonesia.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA6EaAKwWIWsIKxvcfxTv6YIPsKjrz8kwc',
    appId: '1:873231799080:ios:a8dbd99fbe709a3961b61d',
    messagingSenderId: '873231799080',
    projectId: 'asosiasi-pengelasan-indonesia',
    databaseURL: 'https://asosiasi-pengelasan-indonesia-default-rtdb.firebaseio.com',
    storageBucket: 'asosiasi-pengelasan-indonesia.appspot.com',
    iosClientId: '873231799080-hdodmbbj6qfbb2u4gjbc5vk5togfo7u3.apps.googleusercontent.com',
    iosBundleId: 'com.example.apiMobile',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA6EaAKwWIWsIKxvcfxTv6YIPsKjrz8kwc',
    appId: '1:873231799080:ios:a8dbd99fbe709a3961b61d',
    messagingSenderId: '873231799080',
    projectId: 'asosiasi-pengelasan-indonesia',
    databaseURL: 'https://asosiasi-pengelasan-indonesia-default-rtdb.firebaseio.com',
    storageBucket: 'asosiasi-pengelasan-indonesia.appspot.com',
    iosClientId: '873231799080-hdodmbbj6qfbb2u4gjbc5vk5togfo7u3.apps.googleusercontent.com',
    iosBundleId: 'com.example.apiMobile',
  );
}
