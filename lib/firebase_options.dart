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
    apiKey: 'AIzaSyD3quGb_HRDUxUEHwkTXOz9mVLSYGByfmc',
    appId: '1:536286140232:web:c8eb0fba6b19f7599cc57d',
    messagingSenderId: '536286140232',
    projectId: 'uwanda-superapp-staging',
    authDomain: 'uwanda-superapp-staging.firebaseapp.com',
    databaseURL:
        'https://uwanda-superapp-staging-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'uwanda-superapp-staging.appspot.com',
    measurementId: 'G-K9E755C5N5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBX4o_LAeyWDZ7LEyymyHy9NSEhkX_2Loc',
    appId: '1:536286140232:android:d51b7039357e311a9cc57d',
    messagingSenderId: '536286140232',
    projectId: 'uwanda-superapp-staging',
    databaseURL:
        'https://uwanda-superapp-staging-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'uwanda-superapp-staging.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC7J4aipX1tneAQH8I1CoHRMV_Gm5UhQVM',
    appId: '1:536286140232:ios:78a78f92b671a2d99cc57d',
    messagingSenderId: '536286140232',
    projectId: 'uwanda-superapp-staging',
    databaseURL:
        'https://uwanda-superapp-staging-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'uwanda-superapp-staging.appspot.com',
    iosClientId:
        '536286140232-t19j5aql3i56a4vjo69dq6mnovt0brv5.apps.googleusercontent.com',
    iosBundleId: 'com.dukalink.dukalinkApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC7J4aipX1tneAQH8I1CoHRMV_Gm5UhQVM',
    appId: '1:536286140232:ios:02164c1d9229c7d19cc57d',
    messagingSenderId: '536286140232',
    projectId: 'uwanda-superapp-staging',
    databaseURL:
        'https://uwanda-superapp-staging-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'uwanda-superapp-staging.appspot.com',
    iosClientId:
        '536286140232-s3en5c8f7budnemkeipmhil8ddivpegi.apps.googleusercontent.com',
    iosBundleId: 'com.example.dukalinkApp',
  );
}
