// To parse this JSON data, do
//
//     final userRegisterRequest = userRegisterRequestFromJson(jsonString);

import 'dart:convert';

UserRegisterRequest userRegisterRequestFromJson(String str) => UserRegisterRequest.fromJson(json.decode(str));

String userRegisterRequestToJson(UserRegisterRequest data) => json.encode(data.toJson());

class UserRegisterRequest {
    String fullName;
    String phoneNumber;

    UserRegisterRequest({
        required this.fullName,
        required this.phoneNumber,
    });

    factory UserRegisterRequest.fromJson(Map<String, dynamic> json) => UserRegisterRequest(
        fullName: json["full_name"],
        phoneNumber: json["phone_number"],
    );

    Map<String, dynamic> toJson() => {
        "full_name": fullName,
        "phone_number": phoneNumber,
    };
}
