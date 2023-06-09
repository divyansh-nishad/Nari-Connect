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
    apiKey: 'AIzaSyB-LsP0cOKaLx26kWYajaj4mmGByzGR0Vk',
    appId: '1:697089200168:web:68a8f7a4dbda51546a251d',
    messagingSenderId: '697089200168',
    projectId: 'nari-connect-918d2',
    authDomain: 'nari-connect-918d2.firebaseapp.com',
    storageBucket: 'nari-connect-918d2.appspot.com',
    measurementId: 'G-XGS01E6MGY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBGU85IbW3-4pWJAKk7IXoBbprdKxE0LCI',
    appId: '1:697089200168:android:9067997d4b9e7c7f6a251d',
    messagingSenderId: '697089200168',
    projectId: 'nari-connect-918d2',
    storageBucket: 'nari-connect-918d2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCFRe8ERs1IE38NQrQ9NjvpOyVfPEZ8Psc',
    appId: '1:697089200168:ios:d7c80dbd94a848426a251d',
    messagingSenderId: '697089200168',
    projectId: 'nari-connect-918d2',
    storageBucket: 'nari-connect-918d2.appspot.com',
    androidClientId: '697089200168-glhtltr6n6t1tgtmu1br9e3uotsh0i2b.apps.googleusercontent.com',
    iosClientId: '697089200168-idd34gmc2gnt22b720442ben25k5f6h9.apps.googleusercontent.com',
    iosBundleId: 'com.example.nariConnect',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCFRe8ERs1IE38NQrQ9NjvpOyVfPEZ8Psc',
    appId: '1:697089200168:ios:d7c80dbd94a848426a251d',
    messagingSenderId: '697089200168',
    projectId: 'nari-connect-918d2',
    storageBucket: 'nari-connect-918d2.appspot.com',
    androidClientId: '697089200168-glhtltr6n6t1tgtmu1br9e3uotsh0i2b.apps.googleusercontent.com',
    iosClientId: '697089200168-idd34gmc2gnt22b720442ben25k5f6h9.apps.googleusercontent.com',
    iosBundleId: 'com.example.nariConnect',
  );
}
