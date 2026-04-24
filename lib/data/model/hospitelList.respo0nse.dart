// // To parse this JSON data, do
// //
// //     final hospitalListResponse = hospitalListResponseFromJson(jsonString);

// import 'dart:convert';

// List<HospitalListResponse> hospitalListResponseFromJson(String str) => List<HospitalListResponse>.from(json.decode(str).map((x) => HospitalListResponse.fromJson(x)));

// String hospitalListResponseToJson(List<HospitalListResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class HospitalListResponse {
//     int id;
//     String name;
//     String location;
//     String consultationPriceRange;
//     String language;
//     double rating;
//     String servicesOffered;
//     String lat;
//     String lng;
//     List<String> images;
//     String status;
//     int userId;
//     DateTime createdAt;
//     DateTime updatedAt;
//     List<Doctor> doctors;

//     HospitalListResponse({
//         required this.id,
//         required this.name,
//         required this.location,
//         required this.consultationPriceRange,
//         required this.language,
//         required this.rating,
//         required this.servicesOffered,
//         required this.lat,
//         required this.lng,
//         required this.images,
//         required this.status,
//         required this.userId,
//         required this.createdAt,
//         required this.updatedAt,
//         required this.doctors,
//     });

//     factory HospitalListResponse.fromJson(Map<String, dynamic> json) => HospitalListResponse(
//         id: json["id"],
//         name: json["name"],
//         location: json["location"],
//         consultationPriceRange: json["consultation_price_range"],
//         language: json["language"],
//         rating: json["rating"]?.toDouble(),
//         servicesOffered: json["services_offered"],
//         lat: json["lat"],
//         lng: json["lng"],
//         images: List<String>.from(json["images"].map((x) => x)),
//         status: json["status"],
//         userId: json["user_id"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         doctors: List<Doctor>.from(json["doctors"].map((x) => Doctor.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "location": location,
//         "consultation_price_range": consultationPriceRange,
//         "language": language,
//         "rating": rating,
//         "services_offered": servicesOffered,
//         "lat": lat,
//         "lng": lng,
//         "images": List<dynamic>.from(images.map((x) => x)),
//         "status": status,
//         "user_id": userId,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//         "doctors": List<dynamic>.from(doctors.map((x) => x.toJson())),
//     };
// }

// class Doctor {
//     int id;
//     String fullName;
//     String specialty;
//     int experienceYears;
//     double rating;
//     String? profilePicture;
//     int hospitalId;
//     int consultationFees;
//     List<String> language;
//     AvailableSlots availableSlots;
//     DateTime createdAt;
//     DateTime updatedAt;
//     String status;
//     dynamic email;
//     dynamic city;
//     dynamic password;
//     String approvals;
//     String kycStatus;
//     int userId;
//     String? medicalLicenseFile;

//     Doctor({
//         required this.id,
//         required this.fullName,
//         required this.specialty,
//         required this.experienceYears,
//         required this.rating,
//         required this.profilePicture,
//         required this.hospitalId,
//         required this.consultationFees,
//         required this.language,
//         required this.availableSlots,
//         required this.createdAt,
//         required this.updatedAt,
//         required this.status,
//         required this.email,
//         required this.city,
//         required this.password,
//         required this.approvals,
//         required this.kycStatus,
//         required this.userId,
//         required this.medicalLicenseFile,
//     });

//     factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
//         id: json["id"],
//         fullName: json["full_name"],
//         specialty: json["specialty"],
//         experienceYears: json["experience_years"],
//         rating: json["rating"]?.toDouble(),
//         profilePicture: json["profile_picture"],
//         hospitalId: json["hospital_id"],
//         consultationFees: json["consultation_fees"],
//         // language: List<String>.from(json["language"].map((x) => x)),
//         language: List<String>.from(json["language"] ?? []),
//         availableSlots: AvailableSlots.fromJson(json["available_slots"]),
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         status: json["status"],
//         email: json["email"],
//         city: json["city"],
//         password: json["password"],
//         approvals: json["Approvals"],
//         kycStatus: json["kyc_status"],
//         userId: json["user_id"],
//         medicalLicenseFile: json["medical_license_file"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "full_name": fullName,
//         "specialty": specialty,
//         "experience_years": experienceYears,
//         "rating": rating,
//         "profile_picture": profilePicture,
//         "hospital_id": hospitalId,
//         "consultation_fees": consultationFees,
//         "language": List<dynamic>.from(language.map((x) => x)),
//         "available_slots": availableSlots.toJson(),
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//         "status": status,
//         "email": email,
//         "city": city,
//         "password": password,
//         "Approvals": approvals,
//         "kyc_status": kycStatus,
//         "user_id": userId,
//         "medical_license_file": medicalLicenseFile,
//     };
// }

// class AvailableSlots {
//     List<String> mon;
//     List<String> tue;

//     AvailableSlots({
//         required this.mon,
//         required this.tue,
//     });

//     factory AvailableSlots.fromJson(Map<String, dynamic> json) => AvailableSlots(
//         mon: List<String>.from(json["mon"].map((x) => x)),
//         tue: List<String>.from(json["tue"].map((x) => x)),
//     );

//     Map<String, dynamic> toJson() => {
//         "mon": List<dynamic>.from(mon.map((x) => x)),
//         "tue": List<dynamic>.from(tue.map((x) => x)),
//     };
// }


// To parse this JSON data, do
//
//     final hospitalListResponse = hospitalListResponseFromJson(jsonString);

import 'dart:convert';

List<HospitalListResponse> hospitalListResponseFromJson(String str) => List<HospitalListResponse>.from(json.decode(str).map((x) => HospitalListResponse.fromJson(x)));

String hospitalListResponseToJson(List<HospitalListResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HospitalListResponse {
    int? id;
    String? name;
    String? location;
    String? consultationPriceRange;
    String? language;
    double? rating;
    String? servicesOffered;
    String? lat;
    String? lng;
    List<String>? images;
    String? status;
    int? userId;
    DateTime? createdAt;
    DateTime? updatedAt;
    List<Doctor>? doctors;

    HospitalListResponse({
        this.id,
        this.name,
        this.location,
        this.consultationPriceRange,
        this.language,
        this.rating,
        this.servicesOffered,
        this.lat,
        this.lng,
        this.images,
        this.status,
        this.userId,
        this.createdAt,
        this.updatedAt,
        this.doctors,
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
        images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
        status: json["status"],
        userId: json["user_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        doctors: json["doctors"] == null ? [] : List<Doctor>.from(json["doctors"]!.map((x) => Doctor.fromJson(x))),
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
        "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "status": status,
        "user_id": userId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "doctors": doctors == null ? [] : List<dynamic>.from(doctors!.map((x) => x.toJson())),
    };
}

class Doctor {
    int? id;
    String? fullName;
    String? specialty;
    int? experienceYears;
    double? rating;
    String? profilePicture;
    int? hospitalId;
    int? consultationFees;
    List<String>? language;
    AvailableSlots? availableSlots;
    DateTime? createdAt;
    DateTime? updatedAt;
    Status? status;
    dynamic email;
    dynamic city;
    dynamic password;
    Approvals? approvals;
    KycStatus? kycStatus;
    int? userId;
    String? medicalLicenseFile;

    Doctor({
        this.id,
        this.fullName,
        this.specialty,
        this.experienceYears,
        this.rating,
        this.profilePicture,
        this.hospitalId,
        this.consultationFees,
        this.language,
        this.availableSlots,
        this.createdAt,
        this.updatedAt,
        this.status,
        this.email,
        this.city,
        this.password,
        this.approvals,
        this.kycStatus,
        this.userId,
        this.medicalLicenseFile,
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
        language: json["language"] == null ? [] : List<String>.from(json["language"]!.map((x) => x)),
        availableSlots: json["available_slots"] == null ? null : AvailableSlots.fromJson(json["available_slots"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        status: statusValues.map[json["status"]]!,
        email: json["email"],
        city: json["city"],
        password: json["password"],
        approvals: approvalsValues.map[json["Approvals"]]!,
        kycStatus: kycStatusValues.map[json["kyc_status"]]!,
        userId: json["user_id"],
        medicalLicenseFile: json["medical_license_file"],
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
        "language": language == null ? [] : List<dynamic>.from(language!.map((x) => x)),
        "available_slots": availableSlots?.toJson(),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "status": statusValues.reverse[status],
        "email": email,
        "city": city,
        "password": password,
        "Approvals": approvalsValues.reverse[approvals],
        "kyc_status": kycStatusValues.reverse[kycStatus],
        "user_id": userId,
        "medical_license_file": medicalLicenseFile,
    };
}

enum Approvals {
    PENDING
}

final approvalsValues = EnumValues({
    "pending": Approvals.PENDING
});

class AvailableSlots {
    List<Mon>? mon;
    List<String>? tue;

    AvailableSlots({
        this.mon,
        this.tue,
    });

    factory AvailableSlots.fromJson(Map<String, dynamic> json) => AvailableSlots(
        mon: json["mon"] == null ? [] : List<Mon>.from(json["mon"]!.map((x) => monValues.map[x]!)),
        tue: json["tue"] == null ? [] : List<String>.from(json["tue"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "mon": mon == null ? [] : List<dynamic>.from(mon!.map((x) => monValues.reverse[x])),
        "tue": tue == null ? [] : List<dynamic>.from(tue!.map((x) => x)),
    };
}

enum Mon {
    THE_1020,
    THE_1100
}

final monValues = EnumValues({
    "10:20": Mon.THE_1020,
    "11:00": Mon.THE_1100
});

enum KycStatus {
    NOT_VERIFIED
}

final kycStatusValues = EnumValues({
    "not_verified": KycStatus.NOT_VERIFIED
});

enum Status {
    INACTIVE
}

final statusValues = EnumValues({
    "Inactive": Status.INACTIVE
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
