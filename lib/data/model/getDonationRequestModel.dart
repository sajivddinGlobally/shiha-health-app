// To parse this JSON data, do
//
//     final getDonationRequestModel = getDonationRequestModelFromJson(jsonString);

import 'dart:convert';

List<GetDonationRequestModel> getDonationRequestModelFromJson(String str) => List<GetDonationRequestModel>.from(json.decode(str).map((x) => GetDonationRequestModel.fromJson(x)));

String getDonationRequestModelToJson(List<GetDonationRequestModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetDonationRequestModel {
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

    GetDonationRequestModel({
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

    factory GetDonationRequestModel.fromJson(Map<String, dynamic> json) => GetDonationRequestModel(
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
