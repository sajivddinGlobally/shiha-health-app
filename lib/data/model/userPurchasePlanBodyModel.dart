// To parse this JSON data, do
//
//     final userPurchasePlanBodyModel = userPurchasePlanBodyModelFromJson(jsonString);

import 'dart:convert';

UserPurchasePlanBodyModel userPurchasePlanBodyModelFromJson(String str) => UserPurchasePlanBodyModel.fromJson(json.decode(str));

String userPurchasePlanBodyModelToJson(UserPurchasePlanBodyModel data) => json.encode(data.toJson());

class UserPurchasePlanBodyModel {
    int userId;
    int planId;
    String status;
    DateTime startDate;
    DateTime endDate;

    UserPurchasePlanBodyModel({
        required this.userId,
        required this.planId,
        required this.status,
        required this.startDate,
        required this.endDate,
    });

    factory UserPurchasePlanBodyModel.fromJson(Map<String, dynamic> json) => UserPurchasePlanBodyModel(
        userId: json["user_id"],
        planId: json["plan_id"],
        status: json["status"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "plan_id": planId,
        "status": status,
        "start_date": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "end_date": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
    };
}
