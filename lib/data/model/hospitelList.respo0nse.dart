// To parse this JSON data, do
//
//     final hospitalListResponse = hospitalListResponseFromJson(jsonString);

import 'dart:convert';

List<HospitalListResponse> hospitalListResponseFromJson(String str) => List<HospitalListResponse>.from(json.decode(str).map((x) => HospitalListResponse.fromJson(x)));

String hospitalListResponseToJson(List<HospitalListResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HospitalListResponse {
    int id;
    String name;
    String location;
    String consultationPriceRange;
    String language;
    double? rating;
    String servicesOffered;
    String? lat;
    String? lng;
    List<String> images;
    DateTime createdAt;
    DateTime updatedAt;
    List<Doctor> doctors;

    HospitalListResponse({
        required this.id,
        required this.name,
        required this.location,
        required this.consultationPriceRange,
        required this.language,
        required this.rating,
        required this.servicesOffered,
        required this.lat,
        required this.lng,
        required this.images,
        required this.createdAt,
        required this.updatedAt,
        required this.doctors,
    });

    factory HospitalListResponse.fromJson(Map<String, dynamic> json) => HospitalListResponse(
        id: json["id"],
        name: json["name"],
        location: json["location"],
        consultationPriceRange: json["consultation_price_range"],
        language: json["language"],
        rating: json["rating"]?.toDouble(),
        servicesOffered: json["services_offered"],
        lat: json["lat"],
        lng: json["lng"],
        images: List<String>.from(json["images"].map((x) => x)),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        doctors: List<Doctor>.from(json["doctors"].map((x) => Doctor.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "location": location,
        "consultation_price_range": consultationPriceRange,
        "language": language,
        "rating": rating,
        "services_offered": servicesOffered,
        "lat": lat,
        "lng": lng,
        "images": List<dynamic>.from(images.map((x) => x)),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "doctors": List<dynamic>.from(doctors.map((x) => x.toJson())),
    };
}

class Doctor {
    int id;
    int? userId;
    String fullName;
    String specialty;
    int experienceYears;
    double rating;
    String profilePicture;
    int hospitalId;
    int? consultationFees;
    dynamic language;
    dynamic availableSlots;
    DateTime createdAt;
    DateTime updatedAt;
    int approvalStatus;
    String? qualifications;
    String? medicalLicenseNumber;
    String? medicalLicenseFile;
    String? consultationFee;
    int? reviewsId;

    Doctor({
        required this.id,
        required this.userId,
        required this.fullName,
        required this.specialty,
        required this.experienceYears,
        required this.rating,
        required this.profilePicture,
        required this.hospitalId,
        required this.consultationFees,
        required this.language,
        required this.availableSlots,
        required this.createdAt,
        required this.updatedAt,
        required this.approvalStatus,
        required this.qualifications,
        required this.medicalLicenseNumber,
        required this.medicalLicenseFile,
        required this.consultationFee,
        required this.reviewsId,
    });

    factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        id: json["id"],
        userId: json["user_id"],
        fullName: json["full_name"],
        specialty: json["specialty"],
        experienceYears: json["experience_years"],
        rating: json["rating"]?.toDouble(),
        profilePicture: json["profile_picture"],
        hospitalId: json["hospital_id"],
        consultationFees: json["consultation_fees"],
        language: json["language"],
        availableSlots: json["available_slots"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        approvalStatus: json["approval_status"],
        qualifications: json["qualifications"],
        medicalLicenseNumber: json["medical_license_number"],
        medicalLicenseFile: json["medical_license_file"],
        consultationFee: json["consultation_fee"],
        reviewsId: json["reviews_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "full_name": fullName,
        "specialty": specialty,
        "experience_years": experienceYears,
        "rating": rating,
        "profile_picture": profilePicture,
        "hospital_id": hospitalId,
        "consultation_fees": consultationFees,
        "language": language,
        "available_slots": availableSlots,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "approval_status": approvalStatus,
        "qualifications": qualifications,
        "medical_license_number": medicalLicenseNumber,
        "medical_license_file": medicalLicenseFile,
        "consultation_fee": consultationFee,
        "reviews_id": reviewsId,
    };
}
