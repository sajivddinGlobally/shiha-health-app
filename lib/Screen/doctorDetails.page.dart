import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DoctorDetailsPage extends StatefulWidget {
  const DoctorDetailsPage({super.key});

  @override
  State<DoctorDetailsPage> createState() => _DoctorDetailsPageState();
}

class _DoctorDetailsPageState extends State<DoctorDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/homebg.png",
            width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height,
            fit: BoxFit.fill,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.h),
                Row(
                  children: [
                    SizedBox(width: 20.w),
                    IconButton(
                      style: IconButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size(0, 0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      "All Doctors",
                      style: GoogleFonts.poppins(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      style: IconButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size(0, 0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: () {},
                      icon: Icon(Icons.search, color: Colors.white),
                    ),
                    SizedBox(width: 20.w),
                  ],
                ),
                SizedBox(height: 24.h),
                Container(
                  margin: EdgeInsets.only(left: 20.w, right: 20.w),
                  padding: EdgeInsets.only(
                    left: 10.w,
                    right: 10.w,
                    top: 10.h,
                    bottom: 10.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: Color(0xFF0E1329),
                    border: Border(
                      top: BorderSide(color: Colors.white, width: 1.w),
                      right: BorderSide(color: Colors.white, width: 1.w),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: Image.asset(
                          "assets/d5.png",
                          width: 127.w,
                          height: 136.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 15.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                  left: 5.w,
                                  right: 7.w,
                                  top: 5.h,
                                  bottom: 5.h,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40.r),
                                  color: Color.fromARGB(255, 38, 36, 37),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Color(0xFFD8A200),
                                      size: 15.sp,
                                    ),
                                    SizedBox(width: 3.w),
                                    Text(
                                      "4.5/5",
                                      style: GoogleFonts.poppins(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFFD8A200),
                                        letterSpacing: -0.3,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 8.w),
                                padding: EdgeInsets.only(
                                  left: 5.w,
                                  right: 5.w,
                                  top: 5.h,
                                  bottom: 5.h,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40.r),
                                  color: Color.fromARGB(25, 125, 255, 180),
                                ),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 5.r,
                                      backgroundColor: Color(0xFF2ECC71),
                                    ),
                                    SizedBox(width: 5.w),
                                    Text(
                                      "Active",
                                      style: GoogleFonts.poppins(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF2ECC71),
                                        letterSpacing: -0.3,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            overflow: TextOverflow.ellipsis,
                            "Emily Johnson",
                            style: GoogleFonts.poppins(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              letterSpacing: -0.4,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            "Dermatology",
                            style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFB0BABF),
                              letterSpacing: -0.4,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5.h),
                            width: 200.w,
                            child: Divider(color: Colors.white12),
                          ),
                          // SizedBox(height: 20.h),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "\$150 ",
                                  style: GoogleFonts.poppins(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF067594),
                                    letterSpacing: -0.3,
                                  ),
                                ),
                                TextSpan(
                                  text: "Consultation Fees",
                                  style: GoogleFonts.poppins(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFFB0BABF),
                                    letterSpacing: -0.4,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
                  padding: EdgeInsets.only(
                    left: 25.w,
                    right: 25.w,
                    bottom: 15.h,
                    top: 15.h,
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 16, 31, 45),
                    borderRadius: BorderRadius.circular(10.r),
                    //border: Border.all(color: Colors.white, width: 0.85.w),
                    border: Border(
                      top: BorderSide(color: Colors.white, width: 0.85.w),
                      right: BorderSide(color: Colors.white, width: 0.85.w),
                    ),
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total Patients ",
                            style: GoogleFonts.poppins(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white70,
                              letterSpacing: -0.3,
                            ),
                          ),
                          SizedBox(height: 7.h),
                          Text(
                            "450",
                            style: GoogleFonts.poppins(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF067594),
                              letterSpacing: 0.3,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Container(
                        height: 40.h,
                        width: 1.w,
                        color: Colors.white30,
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total Experience ",
                            style: GoogleFonts.poppins(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white70,
                              letterSpacing: -0.3,
                            ),
                          ),
                          SizedBox(height: 7.h),
                          Text(
                            "08 Years",
                            style: GoogleFonts.poppins(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF067594),
                              letterSpacing: -0.3,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Container(
                        height: 40.h,
                        width: 1.w,
                        color: Colors.white30,
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Language",
                            style: GoogleFonts.poppins(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white70,
                              letterSpacing: -0.3,
                            ),
                          ),
                          SizedBox(height: 7.h),
                          Text(
                            "Somalian",
                            style: GoogleFonts.poppins(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF067594),
                              letterSpacing: -0.3,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 30.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "About Emily Johnson",
                        style: GoogleFonts.poppins(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          letterSpacing: -0.4,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "Banadir General Hospital is a leading healthcare provider offering a range of services including pediatrics, surgery, and general medicine. Established in 1990, the hospital serves thousands of patients each year with a commitment to compassionate care.",
                        style: GoogleFonts.poppins(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFB0BABF),
                          letterSpacing: -0.4,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "Available Slots",
                  style: GoogleFonts.poppins(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    letterSpacing: -0.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
