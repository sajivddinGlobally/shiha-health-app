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
    List<String>? language;
    dynamic availableSlots;
    DateTime createdAt;
    DateTime updatedAt;
    DoctorsListResponseStatus status;
    String? email;
    String? city;
    String? password;
    Approvals approvals;
    KycStatus kycStatus;
    Hospital? hospital;
    List<Appointment> appointments;

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
        language: json["language"] == null ? [] : List<String>.from(json["language"]!.map((x) => x)),
        availableSlots: json["available_slots"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        status: doctorsListResponseStatusValues.map[json["status"]]!,
        email: json["email"],
        city: json["city"],
        password: json["password"] ??"",
        approvals: approvalsValues.map[json["Approvals"]]!,
        kycStatus: kycStatusValues.map[json["kyc_status"]]!,
        hospital: json["hospital"] == null ? null : Hospital.fromJson(json["hospital"]),
        appointments: List<Appointment>.from(json["appointments"].map((x) => Appointment.fromJson(x))),
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
        "available_slots": availableSlots,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "status": doctorsListResponseStatusValues.reverse[status],
        "email": email,
        "city": city,
        "password": passwordValues.reverse[password],
        "Approvals": approvalsValues.reverse[approvals],
        "kyc_status": kycStatusValues.reverse[kycStatus],
        "hospital": hospital?.toJson(),
        "appointments": List<dynamic>.from(appointments.map((x) => x.toJson())),
    };
}

class Appointment {
    int id;
    int userId;
    int doctorId;
    int hospitalId;
    DateTime date;
    String time;
    AppointmentStatus status;
    DateTime createdAt;
    DateTime updatedAt;

    Appointment({
        required this.id,
        required this.userId,
        required this.doctorId,
        required this.hospitalId,
        required this.date,
        required this.time,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Appointment.fromJson(Map<String, dynamic> json) => Appointment(
        id: json["id"],
        userId: json["user_id"],
        doctorId: json["doctor_id"],
        hospitalId: json["hospital_id"],
        date: DateTime.parse(json["date"]),
        time: json["time"],
        status: appointmentStatusValues.map[json["status"]]!,
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "doctor_id": doctorId,
        "hospital_id": hospitalId,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "time": time,
        "status": appointmentStatusValues.reverse[status],
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

enum AppointmentStatus {
    SCHEDULED
}

final appointmentStatusValues = EnumValues({
    "Scheduled": AppointmentStatus.SCHEDULED
});

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
    Name name;
    Location location;
    ConsultationPriceRange consultationPriceRange;
    Language language;
    double rating;
    ServicesOffered servicesOffered;
    String? lat;
    String? lng;
    List<String> images;
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
        name: nameValues.map[json["name"]]!,
        location: locationValues.map[json["location"]]!,
        consultationPriceRange: consultationPriceRangeValues.map[json["consultation_price_range"]]!,
        language: languageValues.map[json["language"]]!,
        rating: json["rating"]?.toDouble(),
        servicesOffered: servicesOfferedValues.map[json["services_offered"]]!,
        lat: json["lat"],
        lng: json["lng"],
        images: List<String>.from(json["images"].map((x) => x)),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse[name],
        "location": locationValues.reverse[location],
        "consultation_price_range": consultationPriceRangeValues.reverse[consultationPriceRange],
        "language": languageValues.reverse[language],
        "rating": rating,
        "services_offered": servicesOfferedValues.reverse[servicesOffered],
        "lat": lat,
        "lng": lng,
        "images": List<dynamic>.from(images.map((x) => x)),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

enum ConsultationPriceRange {
    THE_2001500,
    THE_300800
}

final consultationPriceRangeValues = EnumValues({
    "200 - 1500": ConsultationPriceRange.THE_2001500,
    "₹300 - ₹800": ConsultationPriceRange.THE_300800
});

enum Language {
    ENGLISH_HINDI_MARATHI,
    HINDI_ENGLISH
}

final languageValues = EnumValues({
    "[\"English\",\"Hindi\",\"Marathi\"]": Language.ENGLISH_HINDI_MARATHI,
    "\"[\\\"Hindi\\\",\\\"English\\\"]\"": Language.HINDI_ENGLISH
});

enum Location {
    DELHI,
    MUMBAI
}

final locationValues = EnumValues({
    "Delhi": Location.DELHI,
    "Mumbai": Location.MUMBAI
});

enum Name {
    APOLLO_HOSPITAL
}

final nameValues = EnumValues({
    "Apollo Hospital": Name.APOLLO_HOSPITAL
});

enum ServicesOffered {
    CARDIOLOGY_NEUROLOGY,
    OPD_EMERGENCY
}

final servicesOfferedValues = EnumValues({
    "[\"Cardiology\",\"Neurology\"]": ServicesOffered.CARDIOLOGY_NEUROLOGY,
    "\"[\\\"OPD\\\",\\\"Emergency\\\"]\"": ServicesOffered.OPD_EMERGENCY
});

enum KycStatus {
    NOT_VERIFIED,
    VERIFIED
}

final kycStatusValues = EnumValues({
    "not_verified": KycStatus.NOT_VERIFIED,
    "verified": KycStatus.VERIFIED
});

enum Password {
    PASSWORD123,
    THE_2_Y_126_C_S7_HY_P_HWG_UF_PE_H0_ZDL_KUE_R_MD3_KJ_UYSY_BR_SP_LC_UC_DU_SOAK_L0_H_JC2_C
}

final passwordValues = EnumValues({
    "password123": Password.PASSWORD123,
    "\u00242y\u002412\u00246cS7hyPHwgUfPeH0ZdlKueRMd3kjUysyBrSpLcUcDUSoakL0hJC2C": Password.THE_2_Y_126_C_S7_HY_P_HWG_UF_PE_H0_ZDL_KUE_R_MD3_KJ_UYSY_BR_SP_LC_UC_DU_SOAK_L0_H_JC2_C
});

enum DoctorsListResponseStatus {
    ACTIVE,
    INACTIVE,
    STATUS_ACTIVE
}

final doctorsListResponseStatusValues = EnumValues({
    "active": DoctorsListResponseStatus.ACTIVE,
    "Inactive": DoctorsListResponseStatus.INACTIVE,
    "Active": DoctorsListResponseStatus.STATUS_ACTIVE
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
