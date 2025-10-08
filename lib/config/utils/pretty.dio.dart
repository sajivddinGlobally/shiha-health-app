import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shiha_health_app/Screen/splash/splash.page.dart';
import 'package:shiha_health_app/data/db/userData.dart';
import 'package:shiha_health_app/main.dart';

createDio() {
  final dio = Dio();
  dio.interceptors.add(
    PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      error: true,
      compact: false, // Makes logs more readable
      maxWidth: 90,
    ),
  );
  dio.interceptors.add(
    InterceptorsWrapper(
      onResponse: (response, handler) async {
        try {
          if (response.data is Map<String, dynamic> &&
              (response.statusCode == 401 || response.statusCode == 500)) {
            await HiveService().deleteData(
              key: "user",

              boxName: HiveBoxes.userData,
            );
            navigatorKey.currentState?.pushAndRemoveUntil(
              CupertinoPageRoute(builder: (_) => SplashPage()),
              (route) => false,
            );
            return;
          }
        } catch (e) {
          // Safely ignore if response.data is not a map
        }
        handler.next(response); 
      },
      onError: (DioException e, handler) async {
        if (e.response?.statusCode == 401) {
          log("Token expired, refreshing...");
        }
        handler.next(e); 
      },
    ),
  );

  return dio;
}
