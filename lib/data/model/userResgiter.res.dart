// To parse this JSON data, do
//
//     final userRegisterResponse = userRegisterResponseFromJson(jsonString);

import 'dart:convert';

UserRegisterResponse userRegisterResponseFromJson(String str) => UserRegisterResponse.fromJson(json.decode(str));

String userRegisterResponseToJson(UserRegisterResponse data) => json.encode(data.toJson());

class UserRegisterResponse {
    String fullName;
    String phoneNumber;
    DateTime updatedAt;
    DateTime createdAt;
    int id;

    UserRegisterResponse({
        required this.fullName,
        required this.phoneNumber,
        required this.updatedAt,
        required this.createdAt,
        required this.id,
    });

    factory UserRegisterResponse.fromJson(Map<String, dynamic> json) => UserRegisterResponse(
        fullName: json["full_name"],
        phoneNumber: json["phone_number"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "full_name": fullName, 
        "phone_number": phoneNumber,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
    };
}
