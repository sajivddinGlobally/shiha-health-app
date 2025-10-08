// To parse this JSON data, do
//
//     final doctorDetailResponse = doctorDetailResponseFromJson(jsonString);

import 'dart:convert';

DoctorDetailResponse doctorDetailResponseFromJson(String str) => DoctorDetailResponse.fromJson(json.decode(str));

String doctorDetailResponseToJson(DoctorDetailResponse data) => json.encode(data.toJson());

class DoctorDetailResponse {
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
    dynamic email;
    dynamic city;
    dynamic password;
    String approvals;
    String kycStatus;
    int userId;
    String medicalLicenseFile;
    Hospital hospital;
    List<dynamic> appointments;

    DoctorDetailResponse({
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
        required this.medicalLicenseFile,
        required this.hospital,
        required this.appointments,
    });

    factory DoctorDetailResponse.fromJson(Map<String, dynamic> json) => DoctorDetailResponse(
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
        medicalLicenseFile: json["medical_license_file"],
        hospital: Hospital.fromJson(json["hospital"]),
        appointments: List<dynamic>.from(json["appointments"].map((x) => x)),
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
        "medical_license_file": medicalLicenseFile,
        "hospital": hospital.toJson(),
        "appointments": List<dynamic>.from(appointments.map((x) => x)),
    };
}

class AvailableSlots {
    List<String> mon;
    List<String> tue;
    List<dynamic> wed;
    List<dynamic> thu;
    List<dynamic> fri;
    List<dynamic> sat;
    List<dynamic> sun;

    AvailableSlots({
        required this.mon,
        required this.tue,
        required this.wed,
        required this.thu,
        required this.fri,
        required this.sat,
        required this.sun,
    });

    factory AvailableSlots.fromJson(Map<String, dynamic> json) => AvailableSlots(
        mon: List<String>.from(json["mon"].map((x) => x)),
        tue: List<String>.from(json["tue"].map((x) => x)),
        wed: List<dynamic>.from(json["wed"].map((x) => x)),
        thu: List<dynamic>.from(json["thu"].map((x) => x)),
        fri: List<dynamic>.from(json["fri"].map((x) => x)),
        sat: List<dynamic>.from(json["sat"].map((x) => x)),
        sun: List<dynamic>.from(json["sun"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "mon": List<dynamic>.from(mon.map((x) => x)),
        "tue": List<dynamic>.from(tue.map((x) => x)),
        "wed": List<dynamic>.from(wed.map((x) => x)),
        "thu": List<dynamic>.from(thu.map((x) => x)),
        "fri": List<dynamic>.from(fri.map((x) => x)),
        "sat": List<dynamic>.from(sat.map((x) => x)),
        "sun": List<dynamic>.from(sun.map((x) => x)),
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
    String lat;
    String lng;
    List<String> images;
    String status;
    int userId;
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
        required this.status,
        required this.userId,
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
        images: List<String>.from(json["images"].map((x) => x)),
        status: json["status"],
        userId: json["user_id"],
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
        "status": status,
        "user_id": userId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
