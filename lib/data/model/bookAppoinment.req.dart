// To parse this JSON data, do
//
//     final bookAppontmentReq = bookAppontmentReqFromJson(jsonString);

import 'dart:convert';

BookAppontmentReq bookAppontmentReqFromJson(String str) => BookAppontmentReq.fromJson(json.decode(str));

String bookAppontmentReqToJson(BookAppontmentReq data) => json.encode(data.toJson());

class BookAppontmentReq {
    int userId;
    int doctorId;
    int hospitalId;
    DateTime date;
    String time;
    String status;

    BookAppontmentReq({
        required this.userId,
        required this.doctorId,
        required this.hospitalId,
        required this.date,
        required this.time,
        required this.status,
    });

    factory BookAppontmentReq.fromJson(Map<String, dynamic> json) => BookAppontmentReq(
        userId: json["user_id"],
        doctorId: json["doctor_id"],
        hospitalId: json["hospital_id"],
        date: DateTime.parse(json["date"]),
        time: json["time"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "doctor_id": doctorId,
        "hospital_id": hospitalId,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "time": time,
        "status": status,
    };
}
