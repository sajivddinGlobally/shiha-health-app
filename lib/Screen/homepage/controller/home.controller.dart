import 'dart:developer';

import 'package:flutter/cupertino.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shiha_health_app/Screen/splash/splash.page.dart';
import 'package:shiha_health_app/Screen/widgets/errorShowFLushBar.dart';
import 'package:shiha_health_app/data/controller/appoinmnet.provider.dart';
import 'package:shiha_health_app/data/controller/userDetails.provider.dart';
import 'package:shiha_health_app/data/db/userData.dart';
import 'package:shiha_health_app/data/model/userAppoinmnt.res.dart';
import 'package:shiha_health_app/data/model/userDetails.response.dart';

mixin HomeController<T extends ConsumerStatefulWidget> on ConsumerState<T> {
  String userName = '';
  String email = "";
  String id = "";
  bool isLoding = true;
  void fetchLocalDota() {
    Future.microtask(() {
      final rawData = HiveService().getData<Map<dynamic, dynamic>?>(
        key: "user",
        boxName: HiveBoxes.userData,
      );

      setState(() {
        final data = rawData != null
            ? Map<String, dynamic>.from(rawData)
            : null;
        log(data.toString());
        userName = data!['user']['full_name'];
        id = data['user']['id'].toString();
      });
    });
  }

  AsyncValue<UserDetailsResponse> fetchUserDetails() {
    return ref.watch(userDetailProvider(id));
  }

  AsyncValue<UserAppoinmentsListRes> fetchInit() {
    final rawData = HiveService().getData<Map<dynamic, dynamic>>(
      key: "user",
      boxName: HiveBoxes.userData,
    );
    return ref.watch(appoinmentProvider(rawData!['user']['id']));
  }

  void userLogout() async {
    await HiveService().clearAll(HiveBoxes.userData);
    showSuccessMessage(context, "Logout succes fully");
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
        context,
        CupertinoPageRoute(builder: (context) => SplashPage()),
        (route) => false,
      );
    });
  }
}
