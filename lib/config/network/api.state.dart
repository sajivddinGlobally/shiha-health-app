import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shiha_health_app/data/model/bookAppoinment.req.dart';
import 'package:shiha_health_app/data/model/doctorDetails.model.dart';
import 'package:shiha_health_app/data/model/doctorsList.response.dart';
import 'package:shiha_health_app/data/model/donationList.response.dart';
import 'package:shiha_health_app/data/model/getDonationDetailsRequestModel.dart';
import 'package:shiha_health_app/data/model/getDonationRequestModel.dart';
import 'package:shiha_health_app/data/model/hospitalDetails.response.dart';
import 'package:shiha_health_app/data/model/hospitelList.respo0nse.dart';
import 'package:shiha_health_app/data/model/insurancePlanResModel.dart';
import 'package:shiha_health_app/data/model/loginUserModel.dart';
import 'package:shiha_health_app/data/model/loginUserResModel.dart';
import 'package:shiha_health_app/data/model/otpVerify.req.dart';
import 'package:shiha_health_app/data/model/registerUser.req.dart';
import 'package:shiha_health_app/data/model/reminderResModel.dart';
import 'package:shiha_health_app/data/model/selfCareDatailsResModel.dart';
import 'package:shiha_health_app/data/model/selfCareTips.res.dart';
import 'package:shiha_health_app/data/model/userAppoinmnt.res.dart';
import 'package:shiha_health_app/data/model/userDetails.response.dart';
import 'package:shiha_health_app/data/model/userInsurancePlanResModel.dart';
import 'package:shiha_health_app/data/model/userPurchasePlanBodyModel.dart';
import 'package:shiha_health_app/data/model/userRegister.req.dart';

part 'api.state.g.dart';

@RestApi(baseUrl: "http://sihahealth.globallywebsolutions.com")
abstract class APIStateNetwork {
  factory APIStateNetwork(Dio dio, {String baseUrl}) = _APIStateNetwork;
  //User
  @POST("/api/otp/send")
  Future<LoginUserResModel> loginUser(@Body() LoginUserBodyModel body);
  @POST("/api/otp/verify")
  Future<HttpResponse> verifyOtp(@Body() OtpVerifyRequest body);
  @POST("/api/users")
  Future<HttpResponse> registerUserInit(@Body() UserRegisterRequest body);
  @POST("/api/profiles")
  Future<HttpResponse> registerUser(@Body() RegisterModelRequest body);
  @GET("/api/users/{id}")
  Future<UserDetailsResponse> usereDetails(@Path('id') String id);
  @GET("/api/hospitals")
  Future<List<HospitalListResponse>> fetchAllHospitals();
  @GET("/api/hospitals/{id}")
  Future<HospitalDetailsResponse> fetchHospitalsDetails(@Path('id') String id);
  @GET("/api/appointments/user/{id}")
  Future<UserAppoinmentsListRes> fetchUserAppoinment(@Path('id') String id);
  @GET("/api/donation-requests")
  Future<List<GetDonationRequestModel>> getDonationRequest();
  @GET("/api/donation-requests/{id}")
  Future<GetDonationDetailsRequestModel> getDonationDetailsRequest(
    @Path("id") String id,
  );

  //Doctors
  @GET("/api/doctors")
  Future<List<DoctorsListResponse>> getDoctorsList();
  @GET("/api/doctors/{id}")
  Future<DoctorDetailResponse> getDoctorDetail(@Path('id') String id);
  @POST("/api/appointments")
  Future<HttpResponse<dynamic>> bookAppontment(@Body() BookAppontmentReq body);
  @PUT("/api/appointments/{id}")
  Future<HttpResponse<dynamic>> updateAppontment(
    @Body() BookAppontmentReq body,
    @Path('id') String id,
  );

  //Self Care
  @GET("/api/self-care-tips")
  Future<List<SelfCareTipsResponse>> fetchSelfCare();
  @GET("/api/self-care-tips/{id}")
  Future<SelfCareDetailsResModel> selfCarDetails(@Path('id') String id);

  // Reminder
  @GET("/api/reminders")
  Future<List<ReminderResModel>> reminderGetData();

  //Donation
  @GET("/api/donation-responses")
  Future<List<DonationListResponse>> fetchDonationResponses();

  /////////////////////////////////  insurance plan
  @GET("/api/insurance-plans")
  Future<List<InsurancePlanResModel>> insurancePlan();

  @GET("/api/user-insurances")
  Future<List<UserInsurancePlanResModel>> userInsurancePlan();

  @POST("/api/user-insurances")
  Future<HttpResponse> userPurchasePlan(@Body() UserPurchasePlanBodyModel body);
}
