import 'package:flutter/cupertino.dart';
import 'package:shiha_health_app/Screen/homepage/home.page.dart';
import 'package:shiha_health_app/data/db/userData.dart';

mixin SplashController<T extends StatefulWidget> on State<T> {
  Map<String, dynamic>? userData = {};
  Future<void> fetchData() async {
    Future.microtask(() {
      final rawData = HiveService().getData<Map<dynamic, dynamic>?>(
        key: "user",
        boxName: HiveBoxes.userData,
      );

      setState(() {
        userData = rawData != null ? Map<String, dynamic>.from(rawData) : null;
      });
    });
  }

  void checLocalDataOrSendNext() async {
    await fetchData();
    if (userData == null) {
      return;
    } else {
      Future.delayed(Duration(seconds: 3), () {
        Navigator.pushAndRemoveUntil(
          context,
          CupertinoPageRoute(builder: (context) => BottomNavigation()),
          (route) => false,
        );
      });
    }
  }
}
