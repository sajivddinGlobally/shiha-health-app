import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shiha_health_app/Screen/login.page.dart';
import 'package:shiha_health_app/Screen/widgets/errorShowFLushBar.dart';
import 'package:shiha_health_app/config/network/api.state.dart';
import 'package:shiha_health_app/config/utils/pretty.dio.dart';
import 'package:shiha_health_app/data/model/registerUser.req.dart';

mixin RegisterController<T extends StatefulWidget> on State<T> {
  final formKey = GlobalKey<FormState>();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final addressController = TextEditingController();
  final genderController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  final heartController = TextEditingController();
  final bloodPressureController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    cityController.dispose();
    stateController.dispose();
    addressController.dispose();
    genderController.dispose();
    heightController.dispose();
    weightController.dispose();
    heartController.dispose();
    bloodPressureController.dispose();
    super.dispose();
  }

  void registerUser(String userId) async {
    if (formKey.currentState!.validate()) {
      try {
        setState(() {
          isLoading = true;
        });
        final api = APIStateNetwork(await createDio());
        final response = await api.registerUser(
          RegisterModelRequest(
            userId: userId,
            state: stateController.text,
            city: cityController.text,
            address: addressController.text,
            gender: genderController.text,
            heightCm: heightController.text,
            weightKg: weightController.text,
            heartRate: heartController.text,
            bloodPressure: bloodPressureController.text,
          ),
        );
        if (response.response.statusCode == 200 ||
            response.response.statusCode == 201) {
          // Handle successful registration
          showSuccessMessage(context, "User registered successfully");
          Future.delayed(Duration(seconds: 2), () {
            sendToLoginPage();
          });
        } else {
          showErrorMessage("${response.response.data["message"]}");
          setState(() {
            isLoading = false;
          });
        }
      } on DioException catch (e) {
        log(e.toString());
        showErrorMessage("Registration failed");
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  void sendToLoginPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }
}
