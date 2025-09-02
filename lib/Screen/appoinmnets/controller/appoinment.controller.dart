import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shiha_health_app/data/controller/appoinmnet.provider.dart';

import 'package:shiha_health_app/data/db/userData.dart';
import 'package:shiha_health_app/data/model/userAppoinmnt.res.dart';

mixin AppoinmentController<T extends ConsumerStatefulWidget>
    on ConsumerState<T> {
  int tab = 0;

  @override
  void initState() {
    super.initState();
    final rawData = HiveService().getData<Map<dynamic, dynamic>>(
      key: "user",
      boxName: HiveBoxes.userData,
    );
    ref.invalidate(appoinmentProvider(rawData!['user']['id']));
  }

  AsyncValue<UserAppoinmentsListRes> fetchInit() {
    final rawData = HiveService().getData<Map<dynamic, dynamic>>(
      key: "user",
      boxName: HiveBoxes.userData,
    );
    return ref.watch(appoinmentProvider(rawData!['user']['id']));
  }
}
