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
    dynamic email;
    dynamic city;
    dynamic password;
    String approvals;
    String kycStatus;
    int userId;
    dynamic medicalLicenseFile;
    dynamic user;
    dynamic hospital;
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
        required this.medicalLicenseFile,
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
        medicalLicenseFile: json["medical_license_file"],
        user: json["user"],
        hospital: json["hospital"],
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
        "medical_license_file": medicalLicenseFile,
        "user": user,
        "hospital": hospital,
        "appointments": List<dynamic>.from(appointments.map((x) => x)),
        "review": review,
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
