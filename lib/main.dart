import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shiha_health_app/Screen/splash.page.dart';
import 'package:shiha_health_app/config/core/init.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() {
  runZonedGuarded(
    () async {
      FlutterError.onError = (details) {
        log(details.exceptionAsString(), stackTrace: details.stack);
      };
      await initializeApp();
      WidgetsBinding.instance.addObserver(AppLifecycleObserver());
      runApp(ProviderScope(child: const MyApp()));
    },
    (error, stackTrace) {
      log('Uncaught error', error: error, stackTrace: stackTrace);
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScreenUtilInit(
        designSize: Size(440, 956),
        splitScreenMode: true,
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: navigatorKey,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            ),
            home: SplashPage(),
          );
        },
      ),
    );
  }
}
