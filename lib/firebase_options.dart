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
    apiKey: 'AIzaSyBAQWHx9s0kT_hK4OR4xjxe1Lugh80pqMo',
    appId: '1:785706347186:web:e40fcc72b4538d30e5b7ab',
    messagingSenderId: '785706347186',
    projectId: 'chatapp-92ccc',
    authDomain: 'chatapp-92ccc.firebaseapp.com',
    storageBucket: 'chatapp-92ccc.appspot.com',
    measurementId: 'G-VT0T89K52T',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCsyoouvpkgPQmRtwcef3ufsgMEaH3F7SA',
    appId: '1:785706347186:android:a5330196ca7fd628e5b7ab',
    messagingSenderId: '785706347186',
    projectId: 'chatapp-92ccc',
    storageBucket: 'chatapp-92ccc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCMlZ6ur25KfS7j6NpsKe1PRYTLJ_B0f-4',
    appId: '1:785706347186:ios:6497e30d1a42b41ee5b7ab',
    messagingSenderId: '785706347186',
    projectId: 'chatapp-92ccc',
    storageBucket: 'chatapp-92ccc.appspot.com',
    iosBundleId: 'com.example.chatapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCMlZ6ur25KfS7j6NpsKe1PRYTLJ_B0f-4',
    appId: '1:785706347186:ios:3a1ce45c7a83f53fe5b7ab',
    messagingSenderId: '785706347186',
    projectId: 'chatapp-92ccc',
    storageBucket: 'chatapp-92ccc.appspot.com',
    iosBundleId: 'com.example.chatapp.RunnerTests',
  );
}
