import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:shiha_health_app/Screen/homepage/home.page.dart';
import 'package:shiha_health_app/Screen/widgets/errorShowFLushBar.dart';
import 'package:shiha_health_app/config/network/api.state.dart';
import 'package:shiha_health_app/config/utils/pretty.dio.dart';
import 'package:shiha_health_app/data/db/userData.dart';
import 'package:shiha_health_app/data/model/loginUserModel.dart';
import 'package:shiha_health_app/data/model/otpVerify.req.dart';
import 'package:shiha_health_app/data/model/otpVerify.res.dart';

mixin OtpController<T extends StatefulWidget> on State<T> {
  String otpCode = "";
  bool isLoading = false;

  Future<void> verifyOtp({required String number}) async {
    if (isLoading == false) {
      if (otpCode.isNotEmpty) {
        try {
          setState(() {
            isLoading = true;
          });

          final api = APIStateNetwork(await createDio());
          final body = OtpVerifyRequest(phoneNumber: number, otpCode: otpCode);
          final response = await api.verifyOtp(body);

          setState(() {
            isLoading = false;
          });

          if (response.response.statusCode == 200 ||
              response.response.statusCode == 201) {
            final loginResponse = OtpVerifyResponse.fromJson(response.data);
            await saveData(response: loginResponse);
            showSuccessMessage(context, "Login successful");

            Future.delayed(Duration(seconds: 2), () {
              Navigator.pushAndRemoveUntil(
                context,
                CupertinoPageRoute(builder: (context) => BottomNavigation()),
                (route) => false,
              );
            });
          }
        } on DioException catch (e) {
          setState(() {
            isLoading = false;
          });

          showErrorMessage("Invalid Or Expired OTP");
        }
      } else {
        showErrorMessage("Invalid Or Expired OTP");
      }
    } else {
      showErrorMessage("Please enter a valid OTP");
    }
  }

  Future<void> resendOtp({required String phoneNumber}) async {
    try {
      setState(() {
        isLoading = true;
      });

      final api = APIStateNetwork(await createDio());
      final body = LoginUserBodyModel(phoneNumber: phoneNumber);
      final response = await api.loginUser(body);

      setState(() {
        isLoading = false;
      });

      if (response != null) {
        showSuccessMessage(context, "New Otp Sent");
      }
    } on DioException {
      setState(() {
        isLoading = false;
      });
      showErrorMessage("User not found");
    }
  }

  Future<void> saveData({required OtpVerifyResponse response}) async {
    await HiveService().saveData<Map<String, dynamic>?>(
      key: "user",
      data: response.toJson(),
      boxName: HiveBoxes.userData,
    );
  }

  void setOtpCode(String code) {
    setState(() {
      otpCode = code;
    });
  }
}
