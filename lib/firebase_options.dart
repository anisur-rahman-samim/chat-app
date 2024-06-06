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
    apiKey: 'AIzaSyCWMSTZN9fQ7ZTzVxW3v02cPxEZnPGOs9s',
    appId: '1:472542589458:web:30bc775d23279a2290decb',
    messagingSenderId: '472542589458',
    projectId: 'chatapp-4cd5f',
    authDomain: 'chatapp-4cd5f.firebaseapp.com',
    storageBucket: 'chatapp-4cd5f.appspot.com',
    measurementId: 'G-966FQE0ZT7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDHBQP0yf29GOA-7FAsqDOWpdSzRNTRHvk',
    appId: '1:472542589458:android:94a4696438be54ad90decb',
    messagingSenderId: '472542589458',
    projectId: 'chatapp-4cd5f',
    storageBucket: 'chatapp-4cd5f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAX3kHjRK2FyZ6F4la4S8EuB4HBtKRU-Fo',
    appId: '1:472542589458:ios:05a46f59d57f745790decb',
    messagingSenderId: '472542589458',
    projectId: 'chatapp-4cd5f',
    storageBucket: 'chatapp-4cd5f.appspot.com',
    iosBundleId: 'com.newwave.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAX3kHjRK2FyZ6F4la4S8EuB4HBtKRU-Fo',
    appId: '1:472542589458:ios:05a46f59d57f745790decb',
    messagingSenderId: '472542589458',
    projectId: 'chatapp-4cd5f',
    storageBucket: 'chatapp-4cd5f.appspot.com',
    iosBundleId: 'com.newwave.chatApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCWMSTZN9fQ7ZTzVxW3v02cPxEZnPGOs9s',
    appId: '1:472542589458:web:c1c29ba8fa38805c90decb',
    messagingSenderId: '472542589458',
    projectId: 'chatapp-4cd5f',
    authDomain: 'chatapp-4cd5f.firebaseapp.com',
    storageBucket: 'chatapp-4cd5f.appspot.com',
    measurementId: 'G-3GQFZDZYKC',
  );

}