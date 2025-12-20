// To parse this JSON data, do
//
//     final insurancePlanResModel = insurancePlanResModelFromJson(jsonString);

import 'dart:convert';

List<InsurancePlanResModel> insurancePlanResModelFromJson(String str) =>
    List<InsurancePlanResModel>.from(
      json.decode(str).map((x) => InsurancePlanResModel.fromJson(x)),
    );

String insurancePlanResModelToJson(List<InsurancePlanResModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InsurancePlanResModel {
  int id;
  String name;
  double price;
  String? description;
  String providerName;
  String planType;
  String premiumAmount;
  String? deductibleAmount;
  String? benefits;
  String? exclusions;
  String? policyDocument;
  String status;
  int? hospitalId;
  DateTime createdAt;
  DateTime updatedAt;

  InsurancePlanResModel({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.providerName,
    required this.planType,
    required this.premiumAmount,
    required this.deductibleAmount,
    required this.benefits,
    required this.exclusions,
    required this.policyDocument,
    required this.status,
    required this.hospitalId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory InsurancePlanResModel.fromJson(Map<String, dynamic> json) =>
      InsurancePlanResModel(
        id: json["id"],
        name: json["name"],
        price: json["price"]?.toDouble(),
        description: json["description"],
        providerName: json["provider_name"],
        planType: json["plan_type"],
        premiumAmount: json["premium_amount"],
        deductibleAmount: json["deductible_amount"],
        benefits: json["benefits"],
        exclusions: json["exclusions"],
        policyDocument: json["policy_document"],
        status: json["status"],
        hospitalId: json["hospital_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
    "description": description,
    "provider_name": providerName,
    "plan_type": planType,
    "premium_amount": premiumAmount,
    "deductible_amount": deductibleAmount,
    "benefits": benefits,
    "exclusions": exclusions,
    "policy_document": policyDocument,
    "status": status,
    "hospital_id": hospitalId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
