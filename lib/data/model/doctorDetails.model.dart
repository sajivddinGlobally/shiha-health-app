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
    String fullName;
    String specialty;
    int experienceYears;
    double rating;
    String profilePicture;
    int hospitalId;
    int consultationFees;
    List<String> language;
    AvailableSlots availableSlots;
    DateTime createdAt;
    DateTime updatedAt;
    String status;
    String email;
    String city;
    String password;
    String approvals;
    String kycStatus;
    dynamic userId;
    dynamic user;
    Hospital hospital;
    List<dynamic> appointments;
    dynamic review;

    Doctor({
        required this.id,
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
        required this.status,
        required this.email,
        required this.city,
        required this.password,
        required this.approvals,
        required this.kycStatus,
        required this.userId,
        required this.user,
        required this.hospital,
        required this.appointments,
        required this.review,
    });

    factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        id: json["id"],
        fullName: json["full_name"],
        specialty: json["specialty"],
        experienceYears: json["experience_years"],
        rating: json["rating"]?.toDouble(),
        profilePicture: json["profile_picture"],
        hospitalId: json["hospital_id"],
        consultationFees: json["consultation_fees"],
        language: List<String>.from(json["language"].map((x) => x)),
        availableSlots: AvailableSlots.fromJson(json["available_slots"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        status: json["status"],
        email: json["email"],
        city: json["city"],
        password: json["password"],
        approvals: json["Approvals"],
        kycStatus: json["kyc_status"],
        userId: json["user_id"],
        user: json["user"],
        hospital: Hospital.fromJson(json["hospital"]),
        appointments: List<dynamic>.from(json["appointments"].map((x) => x)),
        review: json["review"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "specialty": specialty,
        "experience_years": experienceYears,
        "rating": rating,
        "profile_picture": profilePicture,
        "hospital_id": hospitalId,
        "consultation_fees": consultationFees,
        "language": List<dynamic>.from(language.map((x) => x)),
        "available_slots": availableSlots.toJson(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "status": status,
        "email": email,
        "city": city,
        "password": password,
        "Approvals": approvals,
        "kyc_status": kycStatus,
        "user_id": userId,
        "user": user,
        "hospital": hospital.toJson(),
        "appointments": List<dynamic>.from(appointments.map((x) => x)),
        "review": review,
    };
}

class AvailableSlots {
    List<String> the20250801;

    AvailableSlots({
        required this.the20250801,
    });

    factory AvailableSlots.fromJson(Map<String, dynamic> json) => AvailableSlots(
        the20250801: List<String>.from(json["2025-08-01"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "2025-08-01": List<dynamic>.from(the20250801.map((x) => x)),
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
    List<dynamic> images;
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
        images: List<dynamic>.from(json["images"].map((x) => x)),
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
        "images": List<dynamic>.from(images.map((x) => x)),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
