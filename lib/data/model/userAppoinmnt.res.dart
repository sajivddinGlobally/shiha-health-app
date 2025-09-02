// To parse this JSON data, do
//
//     final userAppoinmentsListRes = userAppoinmentsListResFromJson(jsonString);

import 'dart:convert';

UserAppoinmentsListRes userAppoinmentsListResFromJson(String str) => UserAppoinmentsListRes.fromJson(json.decode(str));

String userAppoinmentsListResToJson(UserAppoinmentsListRes data) => json.encode(data.toJson());

class UserAppoinmentsListRes {
    bool status;
    String message;
    List<Datum> data;

    UserAppoinmentsListRes({
        required this.status,
        required this.message,
        required this.data,
    });

    factory UserAppoinmentsListRes.fromJson(Map<String, dynamic> json) => UserAppoinmentsListRes(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int id;
    int userId;
    int doctorId;
    int hospitalId;
    DateTime date;
    String time;
    String status;
    DateTime createdAt;
    DateTime updatedAt;
    User user;
    Doctor doctor;
    Hospital hospital;
    UserProfile userProfile;

    Datum({
        required this.id,
        required this.userId,
        required this.doctorId,
        required this.hospitalId,
        required this.date,
        required this.time,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
        required this.user,
        required this.doctor,
        required this.hospital,
        required this.userProfile,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        doctorId: json["doctor_id"],
        hospitalId: json["hospital_id"],
        date: DateTime.parse(json["date"]),
        time: json["time"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        user: User.fromJson(json["user"]),
        doctor: Doctor.fromJson(json["doctor"]),
        hospital: Hospital.fromJson(json["hospital"]),
        userProfile: UserProfile.fromJson(json["user_profile"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "doctor_id": doctorId,
        "hospital_id": hospitalId,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "time": time,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "user": user.toJson(),
        "doctor": doctor.toJson(),
        "hospital": hospital.toJson(),
        "user_profile": userProfile.toJson(),
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
    String lat;
    String lng;
    String images;
    String status;
    dynamic userId;
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
        images: json["images"],
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
        "images": images,
        "status": status,
        "user_id": userId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

class User {
    int id;
    String fullName;
    dynamic age;
    dynamic gender;
    dynamic address;
    dynamic verificationStatus;
    dynamic status;
    dynamic price;
    dynamic patientImage;
    String phoneNumber;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic email;
    dynamic password;
    String role;
    dynamic bookings;
    dynamic language;
    dynamic timezone;

    User({
        required this.id,
        required this.fullName,
        required this.age,
        required this.gender,
        required this.address,
        required this.verificationStatus,
        required this.status,
        required this.price,
        required this.patientImage,
        required this.phoneNumber,
        required this.createdAt,
        required this.updatedAt,
        required this.email,
        required this.password,
        required this.role,
        required this.bookings,
        required this.language,
        required this.timezone,
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
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        email: json["email"],
        password: json["password"],
        role: json["role"],
        bookings: json["bookings"],
        language: json["language"],
        timezone: json["timezone"],
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
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "email": email,
        "password": password,
        "role": role,
        "bookings": bookings,
        "language": language,
        "timezone": timezone,
    };
}

class UserProfile {
    int id;
    int userId;
    String state;
    String city;
    String address;
    String gender;
    int heightCm;
    int weightKg;
    int heartRate;
    String bloodPressure;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic userProfile;

    UserProfile({
        required this.id,
        required this.userId,
        required this.state,
        required this.city,
        required this.address,
        required this.gender,
        required this.heightCm,
        required this.weightKg,
        required this.heartRate,
        required this.bloodPressure,
        required this.createdAt,
        required this.updatedAt,
        required this.userProfile,
    });

    factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        id: json["id"],
        userId: json["user_id"],
        state: json["state"],
        city: json["city"],
        address: json["address"],
        gender: json["gender"],
        heightCm: json["height_cm"],
        weightKg: json["weight_kg"],
        heartRate: json["heart_rate"],
        bloodPressure: json["blood_pressure"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        userProfile: json["user_profile"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "state": state,
        "city": city,
        "address": address,
        "gender": gender,
        "height_cm": heightCm,
        "weight_kg": weightKg,
        "heart_rate": heartRate,
        "blood_pressure": bloodPressure,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "user_profile": userProfile,
    };
}
