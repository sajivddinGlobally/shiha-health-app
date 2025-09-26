// To parse this JSON data, do
//
//     final doctorsListResponse = doctorsListResponseFromJson(jsonString);

import 'dart:convert';

List<DoctorsListResponse> doctorsListResponseFromJson(String str) => List<DoctorsListResponse>.from(json.decode(str).map((x) => DoctorsListResponse.fromJson(x)));

String doctorsListResponseToJson(List<DoctorsListResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DoctorsListResponse {
    int id;
    String fullName;
    String specialty;
    int experienceYears;
    double rating;
    String profilePicture;
    int hospitalId;
    int consultationFees;
    List<Language>? language;
    AvailableSlots availableSlots;
    DateTime createdAt;
    DateTime updatedAt;
    Status status;
    String? email;
    String? city;
    String? password;
    Approvals approvals;
    KycStatus kycStatus;
    int? userId;
    dynamic medicalLicenseFile;
    dynamic hospital;
    List<dynamic> appointments;

    DoctorsListResponse({
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

    factory DoctorsListResponse.fromJson(Map<String, dynamic> json) => DoctorsListResponse(
        id: json["id"],
        fullName: json["full_name"],
        specialty: json["specialty"],
        experienceYears: json["experience_years"],
        rating: json["rating"]?.toDouble(),
        profilePicture: json["profile_picture"],
        hospitalId: json["hospital_id"],
        consultationFees: json["consultation_fees"],
        language: json["language"] == null ? [] : List<Language>.from(json["language"]!.map((x) => languageValues.map[x]!)),
        availableSlots: AvailableSlots.fromJson(json["available_slots"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        status: statusValues.map[json["status"]]!,
        email: json["email"],
        city: json["city"],
        password: json["password"],
        approvals: approvalsValues.map[json["Approvals"]]!,
        kycStatus: kycStatusValues.map[json["kyc_status"]]!,
        userId: json["user_id"],
        medicalLicenseFile: json["medical_license_file"],
        hospital: json["hospital"],
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
        "language": language == null ? [] : List<dynamic>.from(language!.map((x) => languageValues.reverse[x])),
        "available_slots": availableSlots.toJson(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "status": statusValues.reverse[status],
        "email": email,
        "city": city,
        "password": password,
        "Approvals": approvalsValues.reverse[approvals],
        "kyc_status": kycStatusValues.reverse[kycStatus],
        "user_id": userId,
        "medical_license_file": medicalLicenseFile,
        "hospital": hospital,
        "appointments": List<dynamic>.from(appointments.map((x) => x)),
    };
}

enum Approvals {
    APPROVED,
    PENDING,
    REJECTED
}

final approvalsValues = EnumValues({
    "Approved": Approvals.APPROVED,
    "pending": Approvals.PENDING,
    "Rejected": Approvals.REJECTED
});

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

enum KycStatus {
    NOT_VERIFIED,
    VERIFIED
}

final kycStatusValues = EnumValues({
    "not_verified": KycStatus.NOT_VERIFIED,
    "verified": KycStatus.VERIFIED
});

enum Language {
    ENGLISH,
    HINDI,
    ML123456
}

final languageValues = EnumValues({
    "English": Language.ENGLISH,
    "Hindi": Language.HINDI,
    "ML123456": Language.ML123456
});

enum Status {
    ACTIVE,
    INACTIVE,
    STATUS_ACTIVE
}

final statusValues = EnumValues({
    "active": Status.ACTIVE,
    "Inactive": Status.INACTIVE,
    "Active": Status.STATUS_ACTIVE
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
