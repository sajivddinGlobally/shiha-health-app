import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shiha_health_app/data/db/userData.dart';

mixin HomeController<T extends StatefulWidget> on State<T>{
  String userName = '';
  String email = "";
  void fetchLocalDota(){
     Future.microtask(() {
      final rawData = HiveService().getData<Map<dynamic, dynamic>?>(
        key: "user",
        boxName: HiveBoxes.userData,
      );

      setState(() {
        final data = rawData != null ? Map<String, dynamic>.from(rawData) : null;
        log(data.toString());
        userName = data!['user']['full_name'];
      });
      
    });
  }
}