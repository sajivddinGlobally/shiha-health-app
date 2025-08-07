import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class YourDonationDetailsPage extends StatefulWidget {
  const YourDonationDetailsPage({super.key});

  @override
  State<YourDonationDetailsPage> createState() =>
      _YourDonationDetailsPageState();
}

class _YourDonationDetailsPageState extends State<YourDonationDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                        "Your Donation",
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
                  SizedBox(height: 11.w),
                  Container(
                    margin: EdgeInsets.only(left: 20.w, right: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            left: 15.w,
                            right: 15.w,
                            top: 19.h,
                            bottom: 19.h,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                            border: Border.all(color: Color(0xFFFFFFFF)),
                            gradient: RadialGradient(
                              center: Alignment(0.50, 1.00),
                              radius: 1.00,
                              colors: [
                                const Color(0xFF7DFFB4),
                                const Color(0xFF2ECC71),
                              ],
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Thank You for Donating Blood, Abhi!",
                                style: GoogleFonts.poppins(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF262933),
                                  letterSpacing: -0.4,
                                ),
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                "Your act of kindness helped save a life. Here are the details of your donation.",
                                style: GoogleFonts.poppins(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF262933),
                                  letterSpacing: -0.4,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.h),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: Image.asset(
                            "assets/lab.png",
                            width: 401.w,
                            height: 247.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Container(
                          padding: EdgeInsets.only(
                            left: 15.w,
                            right: 15.w,
                            top: 20.h,
                            bottom: 15.h,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color: Color(0xFF0E1329),
                            border: Border(
                              top: BorderSide(color: Colors.white),
                              right: BorderSide(color: Colors.white),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Donation Summary",
                                style: GoogleFonts.poppins(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  letterSpacing: -1,
                                ),
                              ),
                              SizedBox(height: 10.h),
                              Divider(color: Colors.white38),
                              SizedBox(height: 10.h),
                              donationSymmery(
                                "Donation Type",
                                "Blood Donation",
                              ),
                              SizedBox(height: 10.h),
                              Divider(color: Colors.white38),
                              SizedBox(height: 10.h),
                              donationSymmery(
                                "Patient Helped",
                                "Rajeev Sharma (42 y/o)",
                              ),
                              SizedBox(height: 10.h),
                              Divider(color: Colors.white38),
                              SizedBox(height: 10.h),
                              donationSymmery("Blood Group Needed", "B+"),
                              SizedBox(height: 10.h),
                              Divider(color: Colors.white38),
                              SizedBox(height: 10.h),
                              donationSymmery("Units Contributed", "1"),
                              SizedBox(height: 10.h),
                              Divider(color: Colors.white38),
                              SizedBox(height: 10.h),
                              donationSymmery(
                                "Date & Time",
                                "24 July 2025, 11:30 AM",
                              ),
                              SizedBox(height: 10.h),
                              Divider(color: Colors.white38),
                              SizedBox(height: 10.h),
                              donationSymmery(
                                "Donation Center",
                                "City Hospital Blood Bank, Jaipur",
                              ),
                              SizedBox(height: 10.h),
                              Divider(color: Colors.white38),
                              SizedBox(height: 10.h),
                              donationSymmery(
                                "Status",
                                "Completed & Acknowledged",
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30.h),
                        Text(
                          "Patient Recovery Update",
                          style: GoogleFonts.poppins(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            letterSpacing: -0.4,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          "Rajeev successfully received all 4 required blood units and is now stable in recovery. His family has expressed deep gratitude for your help.",
                          style: GoogleFonts.poppins(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(153, 240, 243, 245),
                            letterSpacing: -0.4,
                          ),
                        ),
                        SizedBox(height: 30.h),
                        Text(
                          "Verification & Documents",
                          style: GoogleFonts.poppins(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            letterSpacing: -0.4,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 12.h),
                          padding: EdgeInsets.only(
                            left: 15.w,
                            right: 15.w,
                            bottom: 12.h,
                            top: 12.h,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: Color(0xFF091A34),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.description, color: Color(0xFF0084FF)),
                              SizedBox(width: 10.w),
                              Text(
                                "Certificate of Donation",
                                style: GoogleFonts.poppins(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(153, 240, 243, 245),
                                  letterSpacing: -0.4,
                                ),
                              ),
                              Spacer(),
                              Container(
                                width: 25.w,
                                height: 25.h,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 18, 37, 48),
                                  borderRadius: BorderRadius.circular(5.r),
                                ),
                                child: Icon(
                                  Icons.file_download_outlined,
                                  color: Color(0xFF2ECC71),
                                  size: 20.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 12.h),
                          padding: EdgeInsets.only(
                            left: 15.w,
                            right: 15.w,
                            bottom: 12.h,
                            top: 12.h,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: Color(0xFF091A34),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.description, color: Color(0xFF0084FF)),
                              SizedBox(width: 10.w),
                              Text(
                                "Hospital Acknowledgment",
                                style: GoogleFonts.poppins(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(153, 240, 243, 245),
                                  letterSpacing: -0.4,
                                ),
                              ),
                              Spacer(),
                              Container(
                                width: 25.w,
                                height: 25.h,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 18, 37, 48),
                                  borderRadius: BorderRadius.circular(5.r),
                                ),
                                child: Icon(
                                  Icons.file_download_outlined,
                                  color: Color(0xFF2ECC71),
                                  size: 20.sp,
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
          ],
        ),
      ),
    );
  }

  Widget donationSymmery(String title, String subtitle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(153, 240, 243, 245),
          ),
        ),
        Text(
          subtitle,
          style: GoogleFonts.poppins(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
