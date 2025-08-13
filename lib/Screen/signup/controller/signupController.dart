import 'dart:developer';
import 'dart:math' hide log;

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:shiha_health_app/Screen/login.page.dart';
import 'package:shiha_health_app/Screen/register/register.page.dart';
import 'package:shiha_health_app/Screen/widgets/errorShowFLushBar.dart';
import 'package:shiha_health_app/config/network/api.state.dart';
import 'package:shiha_health_app/config/utils/pretty.dio.dart';
import 'package:shiha_health_app/data/model/userRegister.req.dart';
import 'package:shiha_health_app/data/model/userResgiter.res.dart';

mixin SignupController<T extends StatefulWidget> on State<T> {
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  void dispose() {
    nameController.dispose();
    mobileController.dispose();
    super.dispose();
  }

  void signUp() async {
    if (formKey.currentState!.validate()) {
      try {
        setState(() {
          isLoading = true;
        });
        final api = APIStateNetwork(await createDio());
        final response = await api.registerUserInit(
          UserRegisterRequest(
            fullName: nameController.text,
            phoneNumber: mobileController.text,
          ),
        );
        if (response.response.statusCode == 200 ||
            response.response.statusCode == 201) {
          setState(() {
            isLoading = false;
          });
          final modelResponse = UserRegisterResponse.fromJson(response.data);
          sendNext(modelResponse.id.toString());
        } else {
          setState(() {
            isLoading = false;
          });
          showErrorMessage("Registration failed");
        }
      } on DioException catch (e) {
        setState(() {
          isLoading = false;
        });
        log(e.toString());
        showErrorMessage("User already exists");
      }
    }
  }

  void sendNext(String userId) {
    Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => RegisterPage(userId: userId)),
    );
  }

  void sendToLoginPage() {
    Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => const LoginPage()),
    );
  }
}
