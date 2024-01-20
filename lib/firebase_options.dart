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
    apiKey: 'AIzaSyCruVxrVVMY2xopEVu9oGlif5dVAu1vrow',
    appId: '1:1068088255110:web:6c315ea637d075c9a22707',
    messagingSenderId: '1068088255110',
    projectId: 'my-cash-app-f1027',
    authDomain: 'my-cash-app-f1027.firebaseapp.com',
    storageBucket: 'my-cash-app-f1027.appspot.com',
    measurementId: 'G-7PPHW6EN9V',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAg1Io9fq9hfaybIjCv_Fu54MVMkLfvSU4',
    appId: '1:1068088255110:android:f5c712cf19fa9527a22707',
    messagingSenderId: '1068088255110',
    projectId: 'my-cash-app-f1027',
    storageBucket: 'my-cash-app-f1027.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAJokhW1srjjzmjfK9AeCTNpuEoJkmdf-4',
    appId: '1:1068088255110:ios:9af611c55bd59c90a22707',
    messagingSenderId: '1068088255110',
    projectId: 'my-cash-app-f1027',
    storageBucket: 'my-cash-app-f1027.appspot.com',
    iosBundleId: 'com.example.myCashApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAJokhW1srjjzmjfK9AeCTNpuEoJkmdf-4',
    appId: '1:1068088255110:ios:8b03f74ab368de0ba22707',
    messagingSenderId: '1068088255110',
    projectId: 'my-cash-app-f1027',
    storageBucket: 'my-cash-app-f1027.appspot.com',
    iosBundleId: 'com.example.myCashApp.RunnerTests',
  );
}