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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyC0g9NJwKB7Vn--NKXXzPomOTjNc-FVp0o',
    appId: '1:185948383151:web:752b381d1bc98391dfb15a',
    messagingSenderId: '185948383151',
    projectId: 'fir-9dd6c',
    authDomain: 'fir-9dd6c.firebaseapp.com',
    storageBucket: 'fir-9dd6c.firebasestorage.app',
    measurementId: 'G-FK23TCTJPG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBIJtnsGUDB0IWNWwTNh_nCaHX4NZG_mLA',
    appId: '1:185948383151:android:fd9b46f4489a9e93dfb15a',
    messagingSenderId: '185948383151',
    projectId: 'fir-9dd6c',
    storageBucket: 'fir-9dd6c.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB045vmMrSeqIJ3D0jZHzMooP-zAZgb3e4',
    appId: '1:185948383151:ios:9e8e5e138543d692dfb15a',
    messagingSenderId: '185948383151',
    projectId: 'fir-9dd6c',
    storageBucket: 'fir-9dd6c.firebasestorage.app',
    iosBundleId: 'com.example.firebaseSample',
  );

}