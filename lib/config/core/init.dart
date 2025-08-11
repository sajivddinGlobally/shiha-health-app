import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shiha_health_app/data/db/userData.dart';


Future<void> initializeApp() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
    await HiveService().init(HiveBoxes.user);
    await HiveService().init(HiveBoxes.auth);
    await HiveService().init(HiveBoxes.role);
    await HiveService().init(HiveBoxes.status);
    await HiveService().init(HiveBoxes.userData);

  } catch (e, stackTrace) {
    log("App initialization failed", error: e, stackTrace: stackTrace);

    rethrow;
  }
}

class AppLifecycleObserver extends WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    log('App state changed to $state');
  }
}


// Future<void> requestNotificationPermission() async {
//   FirebaseMessaging messaging = FirebaseMessaging.instance;

//   NotificationSettings settings = await messaging.requestPermission(
//     alert: true,
//     announcement: false,
//     badge: true,
//     carPlay: false,
//     criticalAlert: false,
//     provisional: false,
//     sound: true,
//   );

//   print('User granted permission: ${settings.authorizationStatus}');
// }