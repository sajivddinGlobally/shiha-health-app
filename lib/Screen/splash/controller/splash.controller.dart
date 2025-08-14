import 'package:flutter/material.dart';
import 'package:shiha_health_app/data/db/userData.dart';

mixin SplashController <T extends StatefulWidget> on State<T>{
  Map<String, dynamic>? userData = {};
  void fetchData() async {
    final data = HiveService().getData<Map<String, dynamic>?>(key: "user", boxName: HiveBoxes.userData);
    setState(() {
      userData = data;
    });
  } 
}