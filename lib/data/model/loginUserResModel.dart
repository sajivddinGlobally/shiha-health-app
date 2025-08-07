// To parse this JSON data, do
//
//     final loginUserResModel = loginUserResModelFromJson(jsonString);

import 'dart:convert';

LoginUserResModel loginUserResModelFromJson(String str) => LoginUserResModel.fromJson(json.decode(str));

String loginUserResModelToJson(LoginUserResModel data) => json.encode(data.toJson());

class LoginUserResModel {
    String message;
    int otpCode;

    LoginUserResModel({
        required this.message,
        required this.otpCode,
    });

    factory LoginUserResModel.fromJson(Map<String, dynamic> json) => LoginUserResModel(
        message: json["message"],
        otpCode: json["otp_code"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "otp_code": otpCode,
    };
}
