// To parse this JSON data, do
//
//     final registerModelRequest = registerModelRequestFromJson(jsonString);

import 'dart:convert';

RegisterModelRequest registerModelRequestFromJson(String str) => RegisterModelRequest.fromJson(json.decode(str));

String registerModelRequestToJson(RegisterModelRequest data) => json.encode(data.toJson());

class RegisterModelRequest {
    String userId;
    String state;
    String city;
    String address;
    String gender;
    String heightCm;
    String weightKg;
    String heartRate;
    String bloodPressure;

    RegisterModelRequest({
        required this.userId,
        required this.state,
        required this.city,
        required this.address,
        required this.gender,
        required this.heightCm,
        required this.weightKg,
        required this.heartRate,
        required this.bloodPressure,
    });

    factory RegisterModelRequest.fromJson(Map<String, dynamic> json) => RegisterModelRequest(
        userId: json["user_id"],
        state: json["state"],
        city: json["city"],
        address: json["address"],
        gender: json["gender"],
        heightCm: json["height_cm"],
        weightKg: json["weight_kg"],
        heartRate: json["heart_rate"],
        bloodPressure: json["blood_pressure"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "state": state,
        "city": city,
        "address": address,
        "gender": gender,
        "height_cm": heightCm,
        "weight_kg": weightKg,
        "heart_rate": heartRate,
        "blood_pressure": bloodPressure,
    };
}
