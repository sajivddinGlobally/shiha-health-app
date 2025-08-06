import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shiha_health_app/Screen/login.page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height + 60.h,
          child: Stack(
            children: [
              Image.asset(
                "assets/homebg.png",
                width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height,
                fit: BoxFit.fill,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w),
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
                          Expanded(child: RegisterBody(name: "STATE")),
                          SizedBox(width: 25.w),
                          Expanded(child: RegisterBody(name: 'CITY')),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      RegisterBody(name: "ADDRESS"),
                      SizedBox(height: 20.h),
                      RegisterBody(name: "GENDER"),
                      SizedBox(height: 20.h),
                      RegisterBody(name: "HEIGHT (in cm)"),
                      SizedBox(height: 20.h),
                      RegisterBody(name: "WEIGHT (in kg)"),
                      SizedBox(height: 20.h),
                      RegisterBody(name: "HEART RATE"),
                      SizedBox(height: 20.h),
                      RegisterBody(name: "BLOOD PRESSURE"),
                      SizedBox(height: 30.h),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        },
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
                            child: Text(
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
                    ],
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
  final String name;
  const RegisterBody({super.key, required this.name});

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
            letterSpacing: 2,
          ),
        ),
        SizedBox(height: 10.h),
        TextFormField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 10.h, bottom: 10.h),
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
        ),
      ],
    );
  }
}
