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
    apiKey: 'AIzaSyDC2CiNI8ZD3sjAHsipjDJ_M8XqKV9RrwI',
    appId: '1:80340017479:web:014faa63101f310357ec62',
    messagingSenderId: '80340017479',
    projectId: 'parth-ac9a3',
    authDomain: 'parth-ac9a3.firebaseapp.com',
    databaseURL: 'https://parth-ac9a3-default-rtdb.firebaseio.com',
    storageBucket: 'parth-ac9a3.appspot.com',
    measurementId: 'G-0EP5J113BY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCGBh02DlKA_F-Xq6u2-4KUtDSpE635u1c',
    appId: '1:80340017479:android:c1bc3575587035df57ec62',
    messagingSenderId: '80340017479',
    projectId: 'parth-ac9a3',
    databaseURL: 'https://parth-ac9a3-default-rtdb.firebaseio.com',
    storageBucket: 'parth-ac9a3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAc9Gz-3yVgK85Ucjlr0FFIyXyGDQ8_N38',
    appId: '1:80340017479:ios:ecf8ef5e1fcc45f957ec62',
    messagingSenderId: '80340017479',
    projectId: 'parth-ac9a3',
    databaseURL: 'https://parth-ac9a3-default-rtdb.firebaseio.com',
    storageBucket: 'parth-ac9a3.appspot.com',
    androidClientId: '80340017479-3lih73mdtadod52mfkfbo8irs47gci29.apps.googleusercontent.com',
    iosClientId: '80340017479-cdtsji30und4059i4ir0tic4orpd90u1.apps.googleusercontent.com',
    iosBundleId: 'com.example.practicePath',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAc9Gz-3yVgK85Ucjlr0FFIyXyGDQ8_N38',
    appId: '1:80340017479:ios:ecf8ef5e1fcc45f957ec62',
    messagingSenderId: '80340017479',
    projectId: 'parth-ac9a3',
    databaseURL: 'https://parth-ac9a3-default-rtdb.firebaseio.com',
    storageBucket: 'parth-ac9a3.appspot.com',
    androidClientId: '80340017479-3lih73mdtadod52mfkfbo8irs47gci29.apps.googleusercontent.com',
    iosClientId: '80340017479-cdtsji30und4059i4ir0tic4orpd90u1.apps.googleusercontent.com',
    iosBundleId: 'com.example.practicePath',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDC2CiNI8ZD3sjAHsipjDJ_M8XqKV9RrwI',
    appId: '1:80340017479:web:d5f6f3428aac73ba57ec62',
    messagingSenderId: '80340017479',
    projectId: 'parth-ac9a3',
    authDomain: 'parth-ac9a3.firebaseapp.com',
    databaseURL: 'https://parth-ac9a3-default-rtdb.firebaseio.com',
    storageBucket: 'parth-ac9a3.appspot.com',
    measurementId: 'G-QR4HGPF7DL',
  );
}