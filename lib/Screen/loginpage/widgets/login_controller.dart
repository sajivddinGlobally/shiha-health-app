import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shiha_health_app/Screen/loginpage/otp.page.dart';
import 'package:shiha_health_app/Screen/signup/signUp.page.dart';
import 'package:shiha_health_app/Screen/widgets/errorShowFLushBar.dart';
import 'package:shiha_health_app/config/network/api.state.dart';
import 'package:shiha_health_app/config/utils/pretty.dio.dart';
import 'package:shiha_health_app/data/model/loginUserModel.dart';

mixin LoginController<T extends ConsumerStatefulWidget> on ConsumerState<T> {
  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  Future<void> login() async {
    if (formKey.currentState!.validate() && phoneController.text.trim().isNotEmpty) {
      try {
        setState(() {
          isLoading = true;
        });

        final api = APIStateNetwork(await createDio());
        final body = LoginUserBodyModel(phoneNumber: phoneController.text);
        final response = await api.loginUser(body);

        setState(() {
          isLoading = false;
        });

        if (response != null) {
          Navigator.push(
            context,
            CupertinoPageRoute(builder: (context) =>  OtpPage(phone: phoneController.text,)),
          );
          showSuccessMessage(context, response.message);
        }
      } on DioException {
        setState(() {
          isLoading = false;
        });
        showErrorMessage("User not found");
      }
    }else{
      showErrorMessage("Please enter a valid phone number");
    }
  }

  void sendToSignUpPage() {
    Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => SignUpPage()),
    );
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }
}
