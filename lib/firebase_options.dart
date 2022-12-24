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
    apiKey: 'AIzaSyBiGqc-bQ1TkTW2350f2GNrzsBAlp-QRw4',
    appId: '1:931369424400:web:c9230c74bf4920fd429c95',
    messagingSenderId: '931369424400',
    projectId: 'report-losses',
    authDomain: 'report-losses.firebaseapp.com',
    storageBucket: 'report-losses.appspot.com',
    measurementId: 'G-95KWJJS0SD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC44DYAhLAYGbiBmtjXP061VgG8fanbd3Y',
    appId: '1:931369424400:android:5558645f02d2c48b429c95',
    messagingSenderId: '931369424400',
    projectId: 'report-losses',
    storageBucket: 'report-losses.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDy5dFNV8V8GZkU0K1C2qxSIGsxQDoy88M',
    appId: '1:931369424400:ios:e68f3514ee3d8be1429c95',
    messagingSenderId: '931369424400',
    projectId: 'report-losses',
    storageBucket: 'report-losses.appspot.com',
    iosClientId: '931369424400-d4448urekiauo3n35bkk77g107d47kpg.apps.googleusercontent.com',
    iosBundleId: 'social.appcoder.socialMediaNetwork',
  );
}
