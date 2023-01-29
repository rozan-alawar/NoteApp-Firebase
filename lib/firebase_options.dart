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
    apiKey: 'AIzaSyAbV-DPobUENuCgA-N4ZWicF6Y7vskE1uk',
    appId: '1:1098130018795:web:a6afb8ee51de2d1f9249ae',
    messagingSenderId: '1098130018795',
    projectId: 'mobile-shop-a5318',
    authDomain: 'mobile-shop-a5318.firebaseapp.com',
    storageBucket: 'mobile-shop-a5318.appspot.com',
    measurementId: 'G-5XJ0Z7KDV6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBCsQeppIBpXd9ApVPuqMKhQLZbdkv0QTo',
    appId: '1:1098130018795:android:32802bc0eb1dee7f9249ae',
    messagingSenderId: '1098130018795',
    projectId: 'mobile-shop-a5318',
    storageBucket: 'mobile-shop-a5318.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD9tILf9Y8Ix0CDk8XDcK-lc7ePN_Bz08c',
    appId: '1:1098130018795:ios:14182bf6af9d2e0a9249ae',
    messagingSenderId: '1098130018795',
    projectId: 'mobile-shop-a5318',
    storageBucket: 'mobile-shop-a5318.appspot.com',
    iosClientId:
        '1098130018795-47vifk77ke4fm23s9jgk9pk9h8u89k9i.apps.googleusercontent.com',
    iosBundleId: 'com.example.mobileShop',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD9tILf9Y8Ix0CDk8XDcK-lc7ePN_Bz08c',
    appId: '1:1098130018795:ios:14182bf6af9d2e0a9249ae',
    messagingSenderId: '1098130018795',
    projectId: 'mobile-shop-a5318',
    storageBucket: 'mobile-shop-a5318.appspot.com',
    iosClientId:
        '1098130018795-47vifk77ke4fm23s9jgk9pk9h8u89k9i.apps.googleusercontent.com',
    iosBundleId: 'com.example.mobileShop',
  );
}
