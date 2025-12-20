// To parse this JSON data, do
//
//     final reminderResModel = reminderResModelFromJson(jsonString);

import 'dart:convert';

List<ReminderResModel> reminderResModelFromJson(String str) => List<ReminderResModel>.from(json.decode(str).map((x) => ReminderResModel.fromJson(x)));

String reminderResModelToJson(List<ReminderResModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ReminderResModel {
    int? id;
    int? userId;
    String? title;
    String? time;
    int? completed;
    DateTime? createdAt;
    DateTime? updatedAt;
    User? user;

    ReminderResModel({
        this.id,
        this.userId,
        this.title,
        this.time,
        this.completed,
        this.createdAt,
        this.updatedAt,
        this.user,
    });

    factory ReminderResModel.fromJson(Map<String, dynamic> json) => ReminderResModel(
        id: json["id"],
        userId: json["user_id"],
        title: json["title"],
        time: json["time"],
        completed: json["completed"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "title": title,
        "time": time,
        "completed": completed,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "user": user?.toJson(),
    };
}

class User {
    int? id;
    String? fullName;
    dynamic age;
    dynamic gender;
    dynamic address;
    dynamic verificationStatus;
    dynamic status;
    dynamic price;
    dynamic patientImage;
    String? phoneNumber;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic email;
    dynamic password;
    String? role;
    dynamic bookings;
    dynamic language;
    dynamic timezone;
    dynamic hospitalId;

    User({
        this.id,
        this.fullName,
        this.age,
        this.gender,
        this.address,
        this.verificationStatus,
        this.status,
        this.price,
        this.patientImage,
        this.phoneNumber,
        this.createdAt,
        this.updatedAt,
        this.email,
        this.password,
        this.role,
        this.bookings,
        this.language,
        this.timezone,
        this.hospitalId,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        fullName: json["full_name"],
        age: json["age"],
        gender: json["gender"],
        address: json["address"],
        verificationStatus: json["verification_status"],
        status: json["status"],
        price: json["price"],
        patientImage: json["patient_image"],
        phoneNumber: json["phone_number"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        email: json["email"],
        password: json["password"],
        role: json["role"],
        bookings: json["bookings"],
        language: json["language"],
        timezone: json["timezone"],
        hospitalId: json["hospital_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "age": age,
        "gender": gender,
        "address": address,
        "verification_status": verificationStatus,
        "status": status,
        "price": price,
        "patient_image": patientImage,
        "phone_number": phoneNumber,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "email": email,
        "password": password,
        "role": role,
        "bookings": bookings,
        "language": language,
        "timezone": timezone,
        "hospital_id": hospitalId,
    };
}
