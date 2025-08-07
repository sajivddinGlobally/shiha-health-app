// To parse this JSON data, do
//
//     final loginUserBodyModel = loginUserBodyModelFromJson(jsonString);

import 'dart:convert';

LoginUserBodyModel loginUserBodyModelFromJson(String str) => LoginUserBodyModel.fromJson(json.decode(str));

String loginUserBodyModelToJson(LoginUserBodyModel data) => json.encode(data.toJson());

class LoginUserBodyModel {
    String phoneNumber;

    LoginUserBodyModel({
        required this.phoneNumber,
    });

    factory LoginUserBodyModel.fromJson(Map<String, dynamic> json) => LoginUserBodyModel(
        phoneNumber: json["phone_number"],
    );

    Map<String, dynamic> toJson() => {
        "phone_number": phoneNumber,
    };
}
