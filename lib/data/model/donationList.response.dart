// To parse this JSON data, do
//
//     final donationListResponse = donationListResponseFromJson(jsonString);

import 'dart:convert';

List<DonationListResponse> donationListResponseFromJson(String str) => List<DonationListResponse>.from(json.decode(str).map((x) => DonationListResponse.fromJson(x)));

String donationListResponseToJson(List<DonationListResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DonationListResponse {
    int id;
    int userId;
    int donationRequestId;
    DateTime date;
    String status;
    List<String> verificationDocs;
    dynamic certificateUrl;
    DateTime createdAt;
    DateTime updatedAt;
    User user;
    Request request;

    DonationListResponse({
        required this.id,
        required this.userId,
        required this.donationRequestId,
        required this.date,
        required this.status,
        required this.verificationDocs,
        required this.certificateUrl,
        required this.createdAt,
        required this.updatedAt,
        required this.user,
        required this.request,
    });

    factory DonationListResponse.fromJson(Map<String, dynamic> json) => DonationListResponse(
        id: json["id"],
        userId: json["user_id"],
        donationRequestId: json["donation_request_id"],
        date: DateTime.parse(json["date"]),
        status: json["status"],
        verificationDocs: List<String>.from(json["verification_docs"].map((x) => x)),
        certificateUrl: json["certificate_url"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        user: User.fromJson(json["user"]),
        request: Request.fromJson(json["request"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "donation_request_id": donationRequestId,
        "date": date.toIso8601String(),
        "status": status,
        "verification_docs": List<dynamic>.from(verificationDocs.map((x) => x)),
        "certificate_url": certificateUrl,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "user": user.toJson(),
        "request": request.toJson(),
    };
}

class Request {
    int id;
    String patientName;
    int age;
    String hospitalName;
    String location;
    String bloodGroup;
    int unitsRequired;
    DateTime deadline;
    List<String> documents;
    List<String> photos;
    ContactPerson contactPerson;
    DateTime createdAt;
    DateTime updatedAt;

    Request({
        required this.id,
        required this.patientName,
        required this.age,
        required this.hospitalName,
        required this.location,
        required this.bloodGroup,
        required this.unitsRequired,
        required this.deadline,
        required this.documents,
        required this.photos,
        required this.contactPerson,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Request.fromJson(Map<String, dynamic> json) => Request(
        id: json["id"],
        patientName: json["patient_name"],
        age: json["age"],
        hospitalName: json["hospital_name"],
        location: json["location"],
        bloodGroup: json["blood_group"],
        unitsRequired: json["units_required"],
        deadline: DateTime.parse(json["deadline"]),
        documents: List<String>.from(json["documents"].map((x) => x)),
        photos: List<String>.from(json["photos"].map((x) => x)),
        contactPerson: ContactPerson.fromJson(json["contact_person"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "patient_name": patientName,
        "age": age,
        "hospital_name": hospitalName,
        "location": location,
        "blood_group": bloodGroup,
        "units_required": unitsRequired,
        "deadline": deadline.toIso8601String(),
        "documents": List<dynamic>.from(documents.map((x) => x)),
        "photos": List<dynamic>.from(photos.map((x) => x)),
        "contact_person": contactPerson.toJson(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

class ContactPerson {
    String name;
    String phone;

    ContactPerson({
        required this.name,
        required this.phone,
    });

    factory ContactPerson.fromJson(Map<String, dynamic> json) => ContactPerson(
        name: json["name"],
        phone: json["phone"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "phone": phone,
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
    dynamic hospitalId;

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
        required this.hospitalId,
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
        hospitalId: json["hospital_id"],
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
        "hospital_id": hospitalId,
    };
}
