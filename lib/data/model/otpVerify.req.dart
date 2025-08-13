// To parse this JSON data, do
//
//     final otpVerifyRequest = otpVerifyRequestFromJson(jsonString);

import 'dart:convert';

OtpVerifyRequest otpVerifyRequestFromJson(String str) => OtpVerifyRequest.fromJson(json.decode(str));

String otpVerifyRequestToJson(OtpVerifyRequest data) => json.encode(data.toJson());

class OtpVerifyRequest {
    String phoneNumber;
    String otpCode;

    OtpVerifyRequest({
        required this.phoneNumber,
        required this.otpCode,
    });

    factory OtpVerifyRequest.fromJson(Map<String, dynamic> json) => OtpVerifyRequest(
        phoneNumber: json["phone_number"],
        otpCode: json["otp_code"],
    );

    Map<String, dynamic> toJson() => {
        "phone_number": phoneNumber,
        "otp_code": otpCode,
    };
}
