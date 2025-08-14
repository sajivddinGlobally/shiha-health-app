// To parse this JSON data, do
//
//     final doctorsListResponse = doctorsListResponseFromJson(jsonString);

import 'dart:convert';

List<DoctorsListResponse> doctorsListResponseFromJson(String str) => List<DoctorsListResponse>.from(json.decode(str).map((x) => DoctorsListResponse.fromJson(x)));

String doctorsListResponseToJson(List<DoctorsListResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DoctorsListResponse {
    int id;
    int? userId;
    String fullName;
    String specialty;
    int experienceYears;
    double rating;
    String profilePicture;
    int hospitalId;
    int? consultationFees;
    List<Language> language;
    dynamic availableSlots;
    DateTime createdAt;
    DateTime updatedAt;
    int approvalStatus;
    String? qualifications;
    Language? medicalLicenseNumber;
    String? medicalLicenseFile;
    String? consultationFee;
    int? reviewsId;
    Hospital hospital;
    List<Appointment> appointments;

    DoctorsListResponse({
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
        required this.hospital,
        required this.appointments,
    });

    factory DoctorsListResponse.fromJson(Map<String, dynamic> json) => DoctorsListResponse(
        id: json["id"],
        userId: json["user_id"],
        fullName: json["full_name"],
        specialty: json["specialty"],
        experienceYears: json["experience_years"],
        rating: json["rating"]?.toDouble(),
        profilePicture: json["profile_picture"],
        hospitalId: json["hospital_id"],
        consultationFees: json["consultation_fees"],
        language: List<Language>.from(json["language"].map((x) => languageValues.map[x]!)),
        availableSlots: json["available_slots"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        approvalStatus: json["approval_status"],
        qualifications: json["qualifications"],
        medicalLicenseNumber: languageValues.map[json["medical_license_number"]]!,
        medicalLicenseFile: json["medical_license_file"],
        consultationFee: json["consultation_fee"],
        reviewsId: json["reviews_id"],
        hospital: Hospital.fromJson(json["hospital"]),
        appointments: List<Appointment>.from(json["appointments"].map((x) => Appointment.fromJson(x))),
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
        "language": List<dynamic>.from(language.map((x) => languageValues.reverse[x])),
        "available_slots": availableSlots,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "approval_status": approvalStatus,
        "qualifications": qualifications,
        "medical_license_number": languageValues.reverse[medicalLicenseNumber],
        "medical_license_file": medicalLicenseFile,
        "consultation_fee": consultationFee,
        "reviews_id": reviewsId,
        "hospital": hospital.toJson(),
        "appointments": List<dynamic>.from(appointments.map((x) => x.toJson())),
    };
}

class Appointment {
    int id;
    int userId;
    int doctorId;
    int hospitalId;
    DateTime date;
    dynamic time;
    dynamic status;

    Appointment({
        required this.id,
        required this.userId,
        required this.doctorId,
        required this.hospitalId,
        required this.date,
        required this.time,
        required this.status,
    });

    factory Appointment.fromJson(Map<String, dynamic> json) => Appointment(
        id: json["id"],
        userId: json["user_id"],
        doctorId: json["doctor_id"],
        hospitalId: json["hospital_id"],
        date: DateTime.parse(json["date"]),
        time: json["time"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "doctor_id": doctorId,
        "hospital_id": hospitalId,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "time": time,
        "status": status,
    };
}

class AvailableSlotsClass {
    List<String> the20250801;

    AvailableSlotsClass({
        required this.the20250801,
    });

    factory AvailableSlotsClass.fromJson(Map<String, dynamic> json) => AvailableSlotsClass(
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

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
