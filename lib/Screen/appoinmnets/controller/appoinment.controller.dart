import 'package:flutter/material.dart';
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

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final rawData = HiveService().getData<Map<dynamic, dynamic>>(
        key: "user",
        boxName: HiveBoxes.userData,
      );

      if (rawData != null) {
        ref.invalidate(appoinmentProvider(rawData['user']['id']));
      }
    });
  }

  AsyncValue<UserAppoinmentsListRes> fetchInit() {
    final rawData = HiveService().getData<Map<dynamic, dynamic>>(
      key: "user",
      boxName: HiveBoxes.userData,
    );
    return ref.watch(appoinmentProvider(rawData!['user']['id']));
  }


  Future<void> refreshInit(WidgetRef ref) async {
    final rawData = HiveService().getData<Map<dynamic, dynamic>>(
      key: "user",
      boxName: HiveBoxes.userData,
    );
    final _ = ref.refresh(appoinmentProvider(rawData!['user']['id']));
  }
}

class AppointmentSplitter {
  final List<Datum> allAppointments;

  AppointmentSplitter(this.allAppointments);

  DateTime get today {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }

  List<Datum> get upcoming {
    return allAppointments
        .where((a) => a.date.isAtSameMomentAs(today) || a.date.isAfter(today))
        .toList();
  }

  List<Datum> get missed {
    return allAppointments.where((a) => a.date.isBefore(today)).toList();
  }
}
