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
    apiKey: 'AIzaSyBpAJ6rbsVrL8Jmr3mftVImtgAc4MO4Dns',
    appId: '1:936795375604:web:e4dffd1010ee94ff1d5ba1',
    messagingSenderId: '936795375604',
    projectId: 'helping-hands-d1879',
    authDomain: 'helping-hands-d1879.firebaseapp.com',
    storageBucket: 'helping-hands-d1879.appspot.com',
    measurementId: 'G-5ZWHGD20RM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCCACwuYgnkAsUeZn8mkhxy5afZ-TARm-4',
    appId: '1:936795375604:android:faa032577fe267f71d5ba1',
    messagingSenderId: '936795375604',
    projectId: 'helping-hands-d1879',
    storageBucket: 'helping-hands-d1879.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyASBAsmStta6LMS460AJ1Dxrx7YSX5pnGU',
    appId: '1:936795375604:ios:8bd3e0394218306e1d5ba1',
    messagingSenderId: '936795375604',
    projectId: 'helping-hands-d1879',
    storageBucket: 'helping-hands-d1879.appspot.com',
    iosBundleId: 'com.example.helpingHands',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyASBAsmStta6LMS460AJ1Dxrx7YSX5pnGU',
    appId: '1:936795375604:ios:3cb4eb5f20c172931d5ba1',
    messagingSenderId: '936795375604',
    projectId: 'helping-hands-d1879',
    storageBucket: 'helping-hands-d1879.appspot.com',
    iosBundleId: 'com.example.helpingHands.RunnerTests',
  );
}
