// // To parse this JSON data, do
// //
// //     final userDetailsResponse = userDetailsResponseFromJson(jsonString);

// import 'dart:convert';

// UserDetailsResponse userDetailsResponseFromJson(String str) => UserDetailsResponse.fromJson(json.decode(str));

// String userDetailsResponseToJson(UserDetailsResponse data) => json.encode(data.toJson());

// class UserDetailsResponse {
//     int id;
//     String fullName;
//     String phoneNumber;
//     DateTime createdAt;
//     DateTime updatedAt;
//     String role;
//     dynamic email;
//     dynamic password;
//     Profile profile;
//     List<dynamic> appointments;

//     UserDetailsResponse({
//         required this.id,
//         required this.fullName,
//         required this.phoneNumber,
//         required this.createdAt,
//         required this.updatedAt,
//         required this.role,
//         required this.email,
//         required this.password,
//         required this.profile,
//         required this.appointments,
//     });

//     factory UserDetailsResponse.fromJson(Map<String, dynamic> json) => UserDetailsResponse(
//         id: json["id"],
//         fullName: json["full_name"],
//         phoneNumber: json["phone_number"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         role: json["role"],
//         email: json["email"],
//         password: json["password"],
//         profile: Profile.fromJson(json["profile"]),
//         appointments: List<dynamic>.from(json["appointments"].map((x) => x)),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "full_name": fullName,
//         "phone_number": phoneNumber,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//         "role": role,
//         "email": email,
//         "password": password,
//         "profile": profile.toJson(),
//         "appointments": List<dynamic>.from(appointments.map((x) => x)),
//     };
// }

// class Profile {
//     int id;
//     int userId;
//     String state;
//     String city;
//     String address;
//     String gender;
//     int heightCm;
//     int weightKg;
//     int heartRate;
//     String bloodPressure;
//     DateTime createdAt;
//     DateTime updatedAt;

//     Profile({
//         required this.id,
//         required this.userId,
//         required this.state,
//         required this.city,
//         required this.address,
//         required this.gender,
//         required this.heightCm,
//         required this.weightKg,
//         required this.heartRate,
//         required this.bloodPressure,
//         required this.createdAt,
//         required this.updatedAt,
//     });

//     factory Profile.fromJson(Map<String, dynamic> json) => Profile(
//         id: json["id"],
//         userId: json["user_id"],
//         state: json["state"],
//         city: json["city"],
//         address: json["address"],
//         gender: json["gender"],
//         heightCm: json["height_cm"],
//         weightKg: json["weight_kg"],
//         heartRate: json["heart_rate"],
//         bloodPressure: json["blood_pressure"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "user_id": userId,
//         "state": state,
//         "city": city,
//         "address": address,
//         "gender": gender,
//         "height_cm": heightCm,
//         "weight_kg": weightKg,
//         "heart_rate": heartRate,
//         "blood_pressure": bloodPressure,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//     };
// }

// To parse this JSON data, do
//
//     final userDetailsResponse = userDetailsResponseFromJson(jsonString);

import 'dart:convert';

UserDetailsResponse userDetailsResponseFromJson(String str) =>
    UserDetailsResponse.fromJson(json.decode(str));

String userDetailsResponseToJson(UserDetailsResponse data) =>
    json.encode(data.toJson());

class UserDetailsResponse {
  int? id;
  String? fullName;
  dynamic age;
  dynamic gender;
  dynamic address;
  dynamic verificationStatus;
  dynamic status;
  dynamic price;
  dynamic patientImage;
  String? phoneNumber;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic email;
  dynamic password;
  String? role;
  dynamic bookings;
  dynamic language;
  dynamic timezone;
  dynamic hospitalId;
  Profile? profile;
  List<Appointment>? appointments;

  UserDetailsResponse({
    this.id,
    this.fullName,
    this.age,
    this.gender,
    this.address,
    this.verificationStatus,
    this.status,
    this.price,
    this.patientImage,
    this.phoneNumber,
    this.createdAt,
    this.updatedAt,
    this.email,
    this.password,
    this.role,
    this.bookings,
    this.language,
    this.timezone,
    this.hospitalId,
    this.profile,
    this.appointments,
  });

  factory UserDetailsResponse.fromJson(Map<String, dynamic> json) =>
      UserDetailsResponse(
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
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        email: json["email"],
        password: json["password"],
        role: json["role"],
        bookings: json["bookings"],
        language: json["language"],
        timezone: json["timezone"],
        hospitalId: json["hospital_id"],
        profile: json["profile"] == null
            ? null
            : Profile.fromJson(json["profile"]),
        appointments: json["appointments"] == null
            ? []
            : List<Appointment>.from(
                json["appointments"].map((x) => Appointment.fromJson(x)),
              ),
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
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "email": email,
    "password": password,
    "role": role,
    "bookings": bookings,
    "language": language,
    "timezone": timezone,
    "hospital_id": hospitalId,
    "profile": profile?.toJson(),
    "appointments": appointments?.map((x) => x.toJson()).toList() ?? [],
  };
}

class Appointment {
  int? id;
  int? userId;
  int? doctorId;
  int? hospitalId;
  DateTime? date;
  String? time;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  Appointment({
    this.id,
    this.userId,
    this.doctorId,
    this.hospitalId,
    this.date,
    this.time,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) => Appointment(
    id: json["id"],
    userId: json["user_id"],
    doctorId: json["doctor_id"],
    hospitalId: json["hospital_id"],
    date: json["date"] == null ? null : DateTime.tryParse(json["date"]),
    time: json["time"],
    status: json["status"],
    createdAt: json["created_at"] == null
        ? null
        : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null
        ? null
        : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "doctor_id": doctorId,
    "hospital_id": hospitalId,
    "date": date == null
        ? null
        : "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "time": time,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class Profile {
  int? id;
  int? userId;
  String? state;
  String? city;
  String? address;
  String? gender;
  int? heightCm;
  int? weightKg;
  int? heartRate;
  String? bloodPressure;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic userProfile;

  Profile({
    this.id,
    this.userId,
    this.state,
    this.city,
    this.address,
    this.gender,
    this.heightCm,
    this.weightKg,
    this.heartRate,
    this.bloodPressure,
    this.createdAt,
    this.updatedAt,
    this.userProfile,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
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
    createdAt: json["created_at"] == null
        ? null
        : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null
        ? null
        : DateTime.parse(json["updated_at"]),
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
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "user_profile": userProfile,
  };
}
