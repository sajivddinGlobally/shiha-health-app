
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shiha_health_app/Screen/register/controller/register.controller.dart';

class RegisterPage extends StatefulWidget {
  final String userId;
  const RegisterPage({super.key, required this.userId});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> with RegisterController<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: SizedBox(
            height: MediaQuery.of(context).size.height + 130.h,
            child: Stack(
              children: [
                Image.asset(
                  "assets/homebg.png",
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.w, right: 20.w),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 50.h),
                          Text(
                            "Complete your Profile with us ",
                            style: GoogleFonts.poppins(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFFFFFFF),
                              letterSpacing: -1,
                              height: 1,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 10.h),
                          Padding(
                            padding: EdgeInsets.only(left: 6.w),
                            child: Text(
                              "Enter your details to get started with us ",
                              style: GoogleFonts.poppins(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.white70,
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Divider(color: Colors.white38),
                          SizedBox(height: 30.h),
                          Row(
                            children: [
                              Expanded(child: RegisterBody(name: "STATE", keyboardType: TextInputType.text, controller: stateController)),
                              SizedBox(width: 25.w),
                              Expanded(child: RegisterBody(name: 'CITY', keyboardType: TextInputType.text, controller: cityController)),
                            ],
                          ),
                          SizedBox(height: 20.h),
                          RegisterBody(name: "ADDRESS", keyboardType: TextInputType.streetAddress, controller: addressController),
                          SizedBox(height: 20.h),
                          RegisterBody(name: "GENDER", keyboardType: TextInputType.text, controller: genderController),
                          SizedBox(height: 20.h),
                          RegisterBody(name: "HEIGHT (in cm)", keyboardType: TextInputType.number, controller: heightController),
                          SizedBox(height: 20.h),
                          RegisterBody(name: "WEIGHT (in kg)", keyboardType: TextInputType.number, controller: weightController),
                          SizedBox(height: 20.h),
                          RegisterBody(name: "HEART RATE", keyboardType: TextInputType.number, controller: heartController),
                          SizedBox(height: 20.h),
                          RegisterBody(name: "BLOOD PRESSURE", keyboardType: TextInputType.number, controller: bloodPressureController),
                          SizedBox(height: 30.h),
                          InkWell(
                            onTap: () => registerUser(widget.userId),
                            child: Container(
                              width: 400.w,
                              height: 55.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: Color(0xFF067594),
                                border: Border(
                                  top: BorderSide(color: Colors.white, width: 0.85),
                                ),
                              ),
                              child: Center(
                                child: isLoading ? CircularProgressIndicator(
                                  color: Colors.white,
                                ) : Text(
                                  "Register",
                                  style: GoogleFonts.poppins(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}

class RegisterBody extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final String name;
  const RegisterBody({super.key, required this.name, required this.keyboardType, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: GoogleFonts.poppins(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: Colors.white54,
            letterSpacing: 1.5,
          ),
        ),
        SizedBox(height: 10.h),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
              top: 10.h,
              bottom: 10.h,
              left: 20.w,
              right: 20.w,
            ),
            filled: true,
            fillColor: Color(0xFFFFFFFF),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide: BorderSide.none,
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your $name';
            }
            return null;
          },
        ),
      ],
    );
  }
}
