import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shiha_health_app/Screen/appoinmnets/appointment.page.dart';
import 'package:shiha_health_app/Screen/widgets/errorShowFLushBar.dart';
import 'package:shiha_health_app/config/network/api.state.dart';
import 'package:shiha_health_app/config/utils/pretty.dio.dart';
import 'package:shiha_health_app/data/controller/doctorDetails.provider.dart';
import 'package:shiha_health_app/data/db/userData.dart';
import 'package:shiha_health_app/data/model/bookAppoinment.req.dart';
import 'package:shiha_health_app/data/model/doctorDetails.model.dart';

mixin DoctorDetailsController<T extends ConsumerStatefulWidget>
    on ConsumerState<T> {
  DateTime selectedDate = DateTime.now();
  String? selectedTime;
  int currentMonthOffset = 0;
  bool isBTNLoding = false;
  DateTime get baseMonthDate {
    final now = DateTime.now();
    return DateTime(now.year, now.month + currentMonthOffset);
  }

  List<DateTime> getDatesInCurrentMonth() {
    final base = baseMonthDate;
    final firstDay = DateTime(base.year, base.month, 1);
    final nextMonth = DateTime(base.year, base.month + 1, 1);
    final daysInMonth = nextMonth.difference(firstDay).inDays;
    return List.generate(daysInMonth, (i) => firstDay.add(Duration(days: i)));
  }

  void changeMonth(int offset) {
    setState(() {
      currentMonthOffset += offset;
      selectedDate = DateTime(baseMonthDate.year, baseMonthDate.month, 1);
      selectedTime = null;
    });
  }

  AsyncValue<DoctorDetailResponse> fetchData({required String id}) {
    return ref.watch(doctorDetailProvider(id));
  }

  void bookAppoinment({required int doctorId, required int hospitalId}) async {
    final rawData = HiveService().getData<Map<dynamic, dynamic>>(
      key: "user",
      boxName: HiveBoxes.userData,
    );
    final api = APIStateNetwork(await createDio());
    try {
      setState(() => isBTNLoding = true);
      final response = await api.bookAppontment(
        BookAppontmentReq(
          userId: int.parse(rawData!['user']['id'].toString()),
          doctorId: doctorId,
          hospitalId: hospitalId,
          date: selectedDate,
          time: selectedTime ?? "",
          status: "Scheduled",
        ),
      );
      Navigator.push(
        context,
        CupertinoPageRoute(builder: (context) => AppointmentPage()),
      );
      showSuccessMessage(context, "Booking succesfulliy");
      setState(() => isBTNLoding = false);
    } on DioException catch (e) {
      log("Dio error: ${e.message}");
      setState(() => isBTNLoding = false);
      showErrorMessage("Appoinment booking faild");
    } catch (e) {
      // baki generic error handle karega
      setState(() => isBTNLoding = false);
      showErrorMessage("Appoinment booking faild");
      log("Other error: $e");
    }
  }

  void updateBooking({required int doctorId, required int hospitalId, required String bookingId}) async {
    final rawData = HiveService().getData<Map<dynamic, dynamic>>(
      key: "user",
      boxName: HiveBoxes.userData,
    );
    final api = APIStateNetwork(await createDio());
    try {
      setState(() => isBTNLoding = true);
      final response = await api.updateAppontment(
        BookAppontmentReq(
          userId: int.parse(rawData!['user']['id'].toString()),
          doctorId: doctorId,
          hospitalId: hospitalId,
          date: selectedDate,
          time: selectedTime ?? "",
          status: "Scheduled",
        ),
        bookingId
      );
      Navigator.push(
        context,
        CupertinoPageRoute(builder: (context) => AppointmentPage()),
      );
      showSuccessMessage(context, "Booking succesfulliy");
      setState(() => isBTNLoding = false);
    } on DioException catch (e) {
      log("Dio error: ${e.message}");
      setState(() => isBTNLoding = false);
      showErrorMessage("Appoinment booking faild");
    } catch (e) {
      // baki generic error handle karega
      setState(() => isBTNLoding = false);
      showErrorMessage("Appoinment booking faild");
      log("Other error: $e");
    }
  }

}
