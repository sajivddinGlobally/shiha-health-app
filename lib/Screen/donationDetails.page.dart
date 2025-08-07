import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DonationDetailsPage extends StatefulWidget {
  const DonationDetailsPage({super.key});

  @override
  State<DonationDetailsPage> createState() => _DonationDetailsPageState();
}

class _DonationDetailsPageState extends State<DonationDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 2 / 1.4.h,
          child: Stack(
            children: [
              Image.asset(
                "assets/homebg.png",
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 2 / 1.4.h,
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
                          "Donation Details",
                          style: GoogleFonts.poppins(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.w),
                    Container(
                      margin: EdgeInsets.only(left: 20.w, right: 20.w),
                      width: 400.w,
                      height: 24.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: Color(0xFF2ECC71),
                      ),
                      child: Center(
                        child: Text(
                          "Needed By: Today, 8:00 PM",
                          style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF262933),
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.w),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.r),
                            child: Image.asset(
                              "assets/don.png",
                              width: 399.w,
                              height: 212.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 25.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                  left: 10.w,
                                  right: 10.w,
                                  top: 8.h,
                                  bottom: 8.h,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  color: Color(0xFFFF0019),
                                ),
                                child: Text(
                                  "Urgent O+ Blood Needed",
                                  style: GoogleFonts.poppins(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    letterSpacing: -0.4,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                  left: 5.w,
                                  right: 5.w,
                                  top: 5.h,
                                  bottom: 5.h,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40.r),
                                  color: Color.fromARGB(25, 255, 191, 9),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Color(0xFFFFBF00),
                                      size: 15.sp,
                                    ),
                                    Text(
                                      "4 km away",
                                      style: GoogleFonts.poppins(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFFFFBF00),
                                        letterSpacing: -0.3,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15.h),
                          Text(
                            "Neha Sharma (Age 6)",
                            style: GoogleFonts.poppins(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              letterSpacing: -1,
                            ),
                          ),
                          SizedBox(height: 6.h),
                          Text(
                            "City Hospital, Jaipur",
                            style: GoogleFonts.poppins(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF606780),
                              letterSpacing: -1,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20.h),
                            // width: 370.w,
                            // height: 56.h,
                            padding: EdgeInsets.only(
                              left: 15.w,
                              right: 15.w,
                              bottom: 15.h,
                              top: 12.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: Color(0xFF091A34),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Raised: 3 Unit",
                                      style: GoogleFonts.poppins(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF067594),
                                      ),
                                    ),
                                    Text(
                                      "Required : 4 Unit",
                                      style: GoogleFonts.poppins(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF067594),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 13.h),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 5.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.r),
                                    color: Color(0xFF09233E),
                                  ),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      width: 263.w,
                                      height: 5.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          30.r,
                                        ),
                                        color: Color(0xFF067594),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 30.h),
                          Text(
                            "About Case",
                            style: GoogleFonts.poppins(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              letterSpacing: -0.4,
                            ),
                          ),
                          SizedBox(height: 12.h),
                          Text(
                            "Rajeev met with a major road accident and lost significant blood during emergency surgery. He is currently in critical care and needs 2 more units of B+ blood to stabilize. His family is unable to arrange donors quickly due to time sensitivity. Any healthy donor aged 18–55 can help save his life.",
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
                          documentbuild("Doctor's Request Letter (PDF)"),
                          documentbuild("Patient’s ID Proof (PDF)"),
                          documentbuild("Hospital Admission Slip (PDF)"),
                          SizedBox(height: 10.h),
                          Container(
                            width: 400.w,
                            height: 25.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              gradient: LinearGradient(
                                // begin: Alignment(0.00, 0.50),
                                // end: Alignment(1.00, 0.50),
                                colors: [
                                  const Color(0x002ECC71),
                                  const Color(0x4C2ECC71),
                                  const Color(0x002ECC71),
                                ],
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Verified by: Jaipur Blood Helpline (Regd. NGO)",
                                style: GoogleFonts.poppins(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF2ECC71),
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 30.h),
                          Text(
                            "Photos",
                            style: GoogleFonts.poppins(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 12.h),
                          SizedBox(
                            height: 140.h,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10.r),
                                  child: Image.asset(
                                    "assets/don.png",
                                    width: 135.w,
                                    height: 150.h,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10.r),
                                  child: Image.asset(
                                    "assets/don.png",
                                    width: 135.w,
                                    height: 150.h,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10.r),
                                  child: Image.asset(
                                    "assets/don.png",
                                    width: 135.w,
                                    height: 150.h,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 30.h),
                          Text(
                            "Contact Person",
                            style: GoogleFonts.poppins(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 12.h),
                          Container(
                            padding: EdgeInsets.only(
                              left: 10.w,
                              right: 10.w,
                              bottom: 10.h,
                              top: 10,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: Color(0xFF091A34),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 44.w,
                                  height: 44.h,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 18, 37, 48),
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: Icon(
                                    Icons.person,
                                    color: Color(0xFF2ECC71),
                                    size: 20.sp,
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Rohit Sharma (Brother)",
                                      style: GoogleFonts.poppins(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      "+91-9123456789",
                                      style: GoogleFonts.poppins(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF606780),
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Container(
                                  width: 44.w,
                                  height: 44.h,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 24, 34, 61),
                                    borderRadius: BorderRadius.circular(10.r),
                                    border: Border(
                                      top: BorderSide(color: Colors.white),
                                      right: BorderSide(color: Colors.white),
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.call_outlined,
                                    color: Color(0xFF0084FF),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 30.h),
                          Container(
                            width: 400.w,
                            height: 45.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: Color.fromARGB(255, 1, 6, 29),
                              border: Border.all(color: Color(0xFF2ECC71)),
                            ),
                            child: Center(
                              child: Text(
                                "Donate Blood",
                                style: GoogleFonts.poppins(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF2ECC71),
                                ),
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

  Widget documentbuild(String name) {
    return Container(
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
            name,
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
    );
  }
}
