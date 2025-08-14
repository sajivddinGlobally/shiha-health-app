import 'package:flutter/cupertino.dart';
import 'package:shiha_health_app/Screen/home.page.dart';
import 'package:shiha_health_app/data/db/userData.dart';

mixin SplashController<T extends StatefulWidget> on State<T> {
  Map<String, dynamic>? userData = {};
  Future<void> fetchData() async {
    Future.microtask(() {
      final data = HiveService().getData<Map<String, dynamic>?>(
        key: "user",
        boxName: HiveBoxes.userData,
      );
      setState(() {
        userData = data;
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
