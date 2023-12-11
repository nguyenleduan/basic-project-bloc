import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:onlinica/service/sharedPreferences/sharedPreferences_manager.dart';
import 'package:onlinica/widget/theme/theme_helper.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

import 'core/app_bloc_observer.dart';
import 'core/go_router/go_router.dart';
import 'core/utils/size_utils.dart';
import 'datasetting.dart';
import 'firebase_options.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

const AndroidInitializationSettings initializationSettingsAndroid =
AndroidInitializationSettings('@mipmap/ic_launcher');

final DarwinInitializationSettings initializationSettingsIOS =
const DarwinInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true);

final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

Future<void> _firebaseMessagingBackgroundHandler(message) async {
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

Future<void> main()   async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform); ////////////////////
  flutterLocalNotificationsPlugin.initialize(initializationSettings);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    if (Platform.isAndroid) {
      const AndroidNotificationDetails androidNotificationDetails =
      AndroidNotificationDetails('your channel id', 'your channel name',
          channelDescription: 'your channel description',
          importance: Importance.max,
          priority: Priority.high,
          ticker: 'ticker');
      const NotificationDetails notificationDetails =
      NotificationDetails(android: androidNotificationDetails);
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            '${notification.title}',
            '${notification.body}',
            notificationDetails,
            payload: 'item x');
      }
    } else if (Platform.isIOS) {}
  });
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]);
  // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //   statusBarColor: Colors.white,
  //   statusBarIconBrightness: Brightness.dark,
  //   statusBarBrightness: Brightness.light,
  // ));

  EasyLoading.instance
    ..displayDuration = const Duration(seconds: 2)
    ..indicatorType = EasyLoadingIndicatorType.squareCircle //ripple //squareCircle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.blue.shade900
    ..backgroundColor = Colors.white
    ..indicatorColor = theme.colorScheme.primary
    ..textColor = Colors.white
    ..textStyle =   TextStyle(fontSize: getSize(22))
    ..maskColor = Colors.grey.withOpacity(0.8)
    ..userInteractions = false
    ..maskType = EasyLoadingMaskType.custom;
  Bloc.observer = const AppBlocObserver();
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  DataSetting.version = packageInfo.version;
  // final PendingDynamicLinkData? initialLink = await FirebaseDynamicLinks.instance.getInitialLink();
  // DataSetting.dynamicLink = '${initialLink?.link }';
  // print("--------DynamicLink: ${DataSetting.dynamicLink}");
  //

  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]).then((value) async {
  //   // await SharedPreferencesManager.instance.init();
  //   Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);
  //   runApp(MyApp());
  // });

  Bloc.observer = const AppBlocObserver();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  ThemeHelper().changeTheme('primary');
  runApp(MyApp());
}

Future<void> getTokenFCM() async {
  DataSetting.tokenFCM = await FirebaseMessaging.instance.getToken();
  print('TokenFCM: ${DataSetting.tokenFCM} ');
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    accessPermission();
  }

  Future<void> accessPermission() async {
    if (Platform.isAndroid || Platform.isIOS) {
      var status = await Permission.storage.status;
      var statusPhoto = await Permission.photos.status;
      var statusNoti = await Permission.notification.status;
      if (status.isDenied) {
        await Permission.storage.request();
      }
      if (statusPhoto.isDenied) {
        await Permission.photos.request();
      }
      if (statusNoti.isDenied) {
        await Permission.notification.request();
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp, // Cho phép xoay màn hình theo chiều dọc
      DeviceOrientation.landscapeLeft, // Cho phép xoay màn hình sang ngang bên trái
      DeviceOrientation.landscapeRight, // Cho phép xoay màn hình sang ngang bên phải
    ]);
    return  MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.standard,
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate
      ],
      supportedLocales: const  [
          Locale('en'),
          Locale('vi')
      ],
      scaffoldMessengerKey: globalMessengerKey,
      builder: EasyLoading.init(),
      locale:const  Locale('en','vi'),
      routerConfig: router,
    );
  }
}

