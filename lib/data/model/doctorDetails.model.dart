// To parse this JSON data, do
//
//     final doctorDetailResponse = doctorDetailResponseFromJson(jsonString);

import 'dart:convert';

DoctorDetailResponse doctorDetailResponseFromJson(String str) => DoctorDetailResponse.fromJson(json.decode(str));

String doctorDetailResponseToJson(DoctorDetailResponse data) => json.encode(data.toJson());

class DoctorDetailResponse {
    String message;
    Doctor doctor;
    dynamic user;

    DoctorDetailResponse({
        required this.message,
        required this.doctor,
        required this.user,
    });

    factory DoctorDetailResponse.fromJson(Map<String, dynamic> json) => DoctorDetailResponse(
        message: json["message"],
        doctor: Doctor.fromJson(json["doctor"]),
        user: json["user"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "doctor": doctor.toJson(),
        "user": user,
    };
}

class Doctor {
    int id;
    dynamic userId;
    String fullName;
    String specialty;
    int experienceYears;
    double rating;
    String profilePicture;
    int hospitalId;
    dynamic consultationFees;
    List<String> language;
    List<String> availableSlots;
    DateTime createdAt;
    DateTime updatedAt;
    int approvalStatus;
    String qualifications;
    String medicalLicenseNumber;
    String medicalLicenseFile;
    dynamic consultationFee;
    dynamic reviewsId;
    dynamic user;
    Hospital hospital;
    List<dynamic> appointments;
    dynamic review;

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
        required this.user,
        required this.hospital,
        required this.appointments,
        required this.review,
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
        language: List<String>.from(json["language"].map((x) => x)),
        availableSlots: List<String>.from(json["available_slots"].map((x) => x)),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        approvalStatus: json["approval_status"],
        qualifications: json["qualifications"],
        medicalLicenseNumber: json["medical_license_number"],
        medicalLicenseFile: json["medical_license_file"],
        consultationFee: json["consultation_fee"],
        reviewsId: json["reviews_id"],
        user: json["user"],
        hospital: Hospital.fromJson(json["hospital"]),
        appointments: List<dynamic>.from(json["appointments"].map((x) => x)),
        review: json["review"],
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
        "language": List<dynamic>.from(language.map((x) => x)),
        "available_slots": List<dynamic>.from(availableSlots.map((x) => x)),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "approval_status": approvalStatus,
        "qualifications": qualifications,
        "medical_license_number": medicalLicenseNumber,
        "medical_license_file": medicalLicenseFile,
        "consultation_fee": consultationFee,
        "reviews_id": reviewsId,
        "user": user,
        "hospital": hospital.toJson(),
        "appointments": List<dynamic>.from(appointments.map((x) => x)),
        "review": review,
    };
}

class Hospital {
    int id;
    String name;
    String location;
    String consultationPriceRange;
    String language;
    double rating;
    String servicesOffered;
    dynamic lat;
    dynamic lng;
    String images;
    DateTime createdAt;
    DateTime updatedAt;

    Hospital({
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
    });

    factory Hospital.fromJson(Map<String, dynamic> json) => Hospital(
        id: json["id"],
        name: json["name"],
        location: json["location"],
        consultationPriceRange: json["consultation_price_range"],
        language: json["language"],
        rating: json["rating"]?.toDouble(),
        servicesOffered: json["services_offered"],
        lat: json["lat"],
        lng: json["lng"],
        images: json["images"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
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
        "images": images,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
