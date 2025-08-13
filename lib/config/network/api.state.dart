import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shiha_health_app/data/model/loginUserModel.dart';
import 'package:shiha_health_app/data/model/loginUserResModel.dart';
import 'package:shiha_health_app/data/model/otpVerify.req.dart';
import 'package:shiha_health_app/data/model/otpVerify.res.dart';
import 'package:shiha_health_app/data/model/registerUser.req.dart';
import 'package:shiha_health_app/data/model/userRegister.req.dart';

part 'api.state.g.dart';

@RestApi(baseUrl: "http://sihahealth.globallywebsolutions.com")
abstract class APIStateNetwork {
  factory APIStateNetwork(Dio dio, {String baseUrl}) = _APIStateNetwork;

  @POST("/api/otp/send")
  Future<LoginUserResModel> loginUser(@Body() LoginUserBodyModel body);
  @POST("/api/otp/verify")
  Future<HttpResponse> verifyOtp(@Body() OtpVerifyRequest body);
  @POST("/api/users")
  Future<HttpResponse> registerUserInit(@Body() UserRegisterRequest body);
  @POST("/api/profiles")
  Future<HttpResponse> registerUser(
    @Body() RegisterModelRequest body,
  );

}
