import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shiha_health_app/data/model/loginUserModel.dart';
import 'package:shiha_health_app/data/model/loginUserResModel.dart';

part 'api.state.g.dart';

@RestApi(baseUrl: "http://sihahealth.globallywebsolutions.com")
abstract class APIStateNetwork {
  factory APIStateNetwork(Dio dio, {String baseUrl}) = _APIStateNetwork;

  @POST("/api/otp/send")
  Future<LoginUserResModel> loginUser(@Body() LoginUserBodyModel body);
}
