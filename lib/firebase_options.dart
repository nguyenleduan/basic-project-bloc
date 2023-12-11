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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBTtnOr9ubjXgT9xY5T-Vx_J7yHBt1DDeQ',
    appId: '1:765672120056:android:b53e7e9185b55ed4d0250d',
    messagingSenderId: '765672120056',
    projectId: 'onlinica-db3a0',
    storageBucket: 'onlinica-db3a0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDm923wSRcsusQTuCA4QSJAn1wz5HmCxPI',
    appId: '1:765672120056:ios:71c3e68ce4d61245d0250d',
    messagingSenderId: '765672120056',
    projectId: 'onlinica-db3a0',
    storageBucket: 'onlinica-db3a0.appspot.com',
    androidClientId: '765672120056-tt8uaqvin2fotja36efe6u7kf0unpl07.apps.googleusercontent.com',
    iosClientId: '882382202286-b29l8lki40v1258hgemuibp406hufj0m.apps.googleusercontent.com',
    iosBundleId: 'vtc.onlinica.app',
  );
}
