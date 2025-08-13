// To parse this JSON data, do
//
//     final otpVerifyResponse = otpVerifyResponseFromJson(jsonString);

import 'dart:convert';

OtpVerifyResponse otpVerifyResponseFromJson(String str) => OtpVerifyResponse.fromJson(json.decode(str));

String otpVerifyResponseToJson(OtpVerifyResponse data) => json.encode(data.toJson());

class OtpVerifyResponse {
    String message;
    String token;
    User user;

    OtpVerifyResponse({
        required this.message,
        required this.token,
        required this.user,
    });

    factory OtpVerifyResponse.fromJson(Map<String, dynamic> json) => OtpVerifyResponse(
        message: json["message"],
        token: json["token"],
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "token": token,
        "user": user.toJson(),
    };
}

class User {
    int id;
    String fullName;
    String phoneNumber;
    DateTime createdAt;
    DateTime updatedAt;

    User({
        required this.id,
        required this.fullName,
        required this.phoneNumber,
        required this.createdAt,
        required this.updatedAt,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        fullName: json["full_name"],
        phoneNumber: json["phone_number"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "phone_number": phoneNumber,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
