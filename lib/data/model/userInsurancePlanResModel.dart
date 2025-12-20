// To parse this JSON data, do
//
//     final userInsurancePlanResModel = userInsurancePlanResModelFromJson(jsonString);

import 'dart:convert';

List<UserInsurancePlanResModel> userInsurancePlanResModelFromJson(String str) => List<UserInsurancePlanResModel>.from(json.decode(str).map((x) => UserInsurancePlanResModel.fromJson(x)));

String userInsurancePlanResModelToJson(List<UserInsurancePlanResModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserInsurancePlanResModel {
    int? id;
    int? userId;
    int? planId;
    String? status;
    DateTime? startDate;
    DateTime? endDate;
    DateTime? createdAt;
    DateTime? updatedAt;
    User? user;
    Plan? plan;

    UserInsurancePlanResModel({
        this.id,
        this.userId,
        this.planId,
        this.status,
        this.startDate,
        this.endDate,
        this.createdAt,
        this.updatedAt,
        this.user,
        this.plan,
    });

    factory UserInsurancePlanResModel.fromJson(Map<String, dynamic> json) => UserInsurancePlanResModel(
        id: json["id"],
        userId: json["user_id"],
        planId: json["plan_id"],
        status: json["status"],
        startDate: json["start_date"] == null ? null : DateTime.parse(json["start_date"]),
        endDate: json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        plan: json["plan"] == null ? null : Plan.fromJson(json["plan"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "plan_id": planId,
        "status": status,
        "start_date": "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "end_date": "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "user": user?.toJson(),
        "plan": plan?.toJson(),
    };
}

class Plan {
    int? id;
    String? name;
    double? price;
    String? description;
    String? providerName;
    String? planType;
    String? premiumAmount;
    dynamic deductibleAmount;
    dynamic benefits;
    dynamic exclusions;
    dynamic policyDocument;
    String? status;
    dynamic hospitalId;
    DateTime? createdAt;
    DateTime? updatedAt;

    Plan({
        this.id,
        this.name,
        this.price,
        this.description,
        this.providerName,
        this.planType,
        this.premiumAmount,
        this.deductibleAmount,
        this.benefits,
        this.exclusions,
        this.policyDocument,
        this.status,
        this.hospitalId,
        this.createdAt,
        this.updatedAt,
    });

    factory Plan.fromJson(Map<String, dynamic> json) => Plan(
        id: json["id"],
        name: json["name"],
        price: json["price"]?.toDouble(),
        description: json["description"],
        providerName: json["provider_name"],
        planType: json["plan_type"],
        premiumAmount: json["premium_amount"],
        deductibleAmount: json["deductible_amount"],
        benefits: json["benefits"],
        exclusions: json["exclusions"],
        policyDocument: json["policy_document"],
        status: json["status"],
        hospitalId: json["hospital_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "description": description,
        "provider_name": providerName,
        "plan_type": planType,
        "premium_amount": premiumAmount,
        "deductible_amount": deductibleAmount,
        "benefits": benefits,
        "exclusions": exclusions,
        "policy_document": policyDocument,
        "status": status,
        "hospital_id": hospitalId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
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
