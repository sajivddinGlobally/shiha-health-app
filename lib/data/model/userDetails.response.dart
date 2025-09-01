// To parse this JSON data, do
//
//     final userDetailsResponse = userDetailsResponseFromJson(jsonString);

import 'dart:convert';

UserDetailsResponse userDetailsResponseFromJson(String str) => UserDetailsResponse.fromJson(json.decode(str));

String userDetailsResponseToJson(UserDetailsResponse data) => json.encode(data.toJson());

class UserDetailsResponse {
    int id;
    String fullName;
    String phoneNumber;
    DateTime createdAt;
    DateTime updatedAt;
    String role;
    dynamic email;
    dynamic password;
    Profile profile;
    List<dynamic> appointments;

    UserDetailsResponse({
        required this.id,
        required this.fullName,
        required this.phoneNumber,
        required this.createdAt,
        required this.updatedAt,
        required this.role,
        required this.email,
        required this.password,
        required this.profile,
        required this.appointments,
    });

    factory UserDetailsResponse.fromJson(Map<String, dynamic> json) => UserDetailsResponse(
        id: json["id"],
        fullName: json["full_name"],
        phoneNumber: json["phone_number"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        role: json["role"],
        email: json["email"],
        password: json["password"],
        profile: Profile.fromJson(json["profile"]),
        appointments: List<dynamic>.from(json["appointments"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "phone_number": phoneNumber,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "role": role,
        "email": email,
        "password": password,
        "profile": profile.toJson(),
        "appointments": List<dynamic>.from(appointments.map((x) => x)),
    };
}

class Profile {
    int id;
    int userId;
    String state;
    String city;
    String address;
    String gender;
    int heightCm;
    int weightKg;
    int heartRate;
    String bloodPressure;
    DateTime createdAt;
    DateTime updatedAt;

    Profile({
        required this.id,
        required this.userId,
        required this.state,
        required this.city,
        required this.address,
        required this.gender,
        required this.heightCm,
        required this.weightKg,
        required this.heartRate,
        required this.bloodPressure,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        userId: json["user_id"],
        state: json["state"],
        city: json["city"],
        address: json["address"],
        gender: json["gender"],
        heightCm: json["height_cm"],
        weightKg: json["weight_kg"],
        heartRate: json["heart_rate"],
        bloodPressure: json["blood_pressure"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "state": state,
        "city": city,
        "address": address,
        "gender": gender,
        "height_cm": heightCm,
        "weight_kg": weightKg,
        "heart_rate": heartRate,
        "blood_pressure": bloodPressure,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
