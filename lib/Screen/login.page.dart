
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shiha_health_app/Screen/loginpage/widgets/login_controller.dart';
import 'package:shiha_health_app/Screen/signup/signUp.page.dart';



  
class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> with LoginController<LoginPage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Image.asset(
                "assets/si.png",
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.fill,
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    SizedBox(height: 70.h),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Siha",
                            style: GoogleFonts.poppins(
                              fontSize: 40.sp,
                              fontWeight: FontWeight.w300,
                              color: Color(0xFFFFFFFF),
                              letterSpacing: -1,
                            ),
                          ),
                          TextSpan(
                            text: "Health",
                            style: GoogleFonts.poppins(
                              fontSize: 40.sp,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFFFFFFF),
                              letterSpacing: -1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40.h),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      child: Text(
                        "POWER UP YOUR HEALTH JOURNEY",
                        style: GoogleFonts.poppins(
                          fontSize: 32.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFFFFFFF),
                          letterSpacing: -1,
                          height: 1,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Center(
                      child: Text(
                        "Enter your details to get started with us",
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 500.h),
                width: double.infinity,
                //height: 500.h,
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/bottom.png",
                      width: MediaQuery.of(context).size.width,
                      // height: 460.h,
                      fit: BoxFit.fill,
                      alignment: Alignment.bottomCenter,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 70.h),
                          Text(
                            "Welcome Back ",
                            style: GoogleFonts.poppins(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              letterSpacing: -1,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            "Enter your details to continue",
                            style: GoogleFonts.poppins(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.white60,
                              letterSpacing: -0.4,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Divider(color: Colors.white24, height: 1.h),
                          SizedBox(height: 20.h),
                          IntlPhoneField(
                         
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                left: 18.w,
                                right: 18.w,
                                top: 15.h,
                                bottom: 15.h,
                              ),
                              counterText: "",
                              filled: true,
                              fillColor: Color(0xFFD9D9D9),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.r),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.r),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.r),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.r),
                              ),
                              hint: Text("Phone"),
                            ),
                            initialCountryCode: "SO",
                            onChanged: (phone) {
                            setState(() {
                                phoneController.text = phone.completeNumber;
                            });
                            },
                            validator: (value){
                              if (value == null || value.number.isEmpty) {
                                return 'Please enter your phone number';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 30.h),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(400.w, 55.h),
                              backgroundColor: Color(0xFF067594),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                side: BorderSide(),
                              ),
                            ),
                            onPressed: isLoading
                                ? null
                                : () => login(),
                            child: isLoading == true
                                ? Center(child: CircularProgressIndicator(
                                  color: Colors.white,
                                ))
                                : Text(
                                    "Login",
                                    style: GoogleFonts.poppins(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFFFFFFFF),
                                    ),
                                  ),
                          ),
                          SizedBox(height: 20.h),
                          InkWell(
                            onTap: () => sendToSignUpPage(),
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Don’t have an account? ",
                                    style: GoogleFonts.poppins(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF717F8D),
                                      letterSpacing: -1,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Sign up",
                                    style: GoogleFonts.poppins(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF2998FF),
                                      letterSpacing: -1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
