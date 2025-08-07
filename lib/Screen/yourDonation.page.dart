import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class YourDonationPage extends StatefulWidget {
  const YourDonationPage({super.key});

  @override
  State<YourDonationPage> createState() => _YourDonationPageState();
}

class _YourDonationPageState extends State<YourDonationPage> {
  List<Map<String, dynamic>> donationList = [
    {"image": "assets/don.png"},
    {"image": "assets/don1.png"},
    {"image": "assets/don.png"},
  ];
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
                SizedBox(height: 20.w),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 20.w),
                    Container(
                      width: 127.w,
                      height: 95.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Color(0xFF0E1329),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 15.w, top: 15.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/heart.png"),
                            SizedBox(height: 6.h),
                            Text(
                              "Total Donations",
                              style: GoogleFonts.poppins(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.white60,
                              ),
                            ),
                            Text(
                              "15",
                              style: GoogleFonts.poppins(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 127.w,
                      height: 95.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Color(0xFF0E1329),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 15.w, top: 15.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/heart.png",
                              color: Color(0xFF2ECC71),
                            ),
                            SizedBox(height: 6.h),
                            Text(
                              "Blood Donations",
                              style: GoogleFonts.poppins(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.white60,
                              ),
                            ),
                            Text(
                              "12",
                              style: GoogleFonts.poppins(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 127.w,
                      height: 95.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Color(0xFF0E1329),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 15.w, top: 15.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/heart.png",
                              color: Color(0xFFFF0000),
                            ),
                            SizedBox(height: 6.h),
                            Text(
                              "Money Donated",
                              style: GoogleFonts.poppins(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.white60,
                              ),
                            ),
                            Text(
                              "₹8,500",
                              style: GoogleFonts.poppins(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 20.w),
                  ],
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Text(
                    "Your Past Donation",
                    style: GoogleFonts.poppins(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      letterSpacing: -0.4,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: donationList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(
                          left: 20.w,
                          right: 20.w,
                          top: 15.h,
                        ),
                        padding: EdgeInsets.only(
                          left: 10.w,
                          right: 10.w,
                          top: 10.h,
                          bottom: 12.h,
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
                            Image.asset(
                              donationList[index]['image'].toString(),
                              width: 380.w,
                              height: 162.h,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              children: [
                                Container(
                                  width: 52.w,
                                  height: 52.h,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color.fromARGB(255, 25, 59, 59),
                                  ),
                                  child: Image.asset("assets/bl.png"),
                                ),
                                SizedBox(width: 12.h),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Type O- Blood Required",
                                      style: GoogleFonts.poppins(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                        letterSpacing: -0.4,
                                      ),
                                    ),

                                    Text(
                                      "Rahul Singh (Age 32)",
                                      style: GoogleFonts.poppins(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFFB0BABF),
                                        letterSpacing: -0.4,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Container(
                              padding: EdgeInsets.only(
                                top: 12.h,
                                bottom: 12.h,
                                left: 14.w,
                                right: 14.w,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: Color.fromARGB(255, 27, 32, 54),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    color: Color(0xFF067594),
                                    size: 20.sp,
                                  ),
                                  SizedBox(width: 7.w),
                                  Text(
                                    "SMS Hospital",
                                    style: GoogleFonts.poppins(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF067594),
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    width: 1.w,
                                    height: 17.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.r),
                                      color: Color(0xFF8D93AA),
                                    ),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.access_alarm,
                                    color: Color(0xFF067594),
                                    size: 20.sp,
                                  ),
                                  SizedBox(width: 7.w),
                                  Text(
                                    "11:30 AM",
                                    style: GoogleFonts.poppins(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF067594),
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    width: 1.w,
                                    height: 17.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.r),
                                      color: Color(0xFF8D93AA),
                                    ),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.check_circle_outline_sharp,
                                    color: Color(0xFF067594),
                                    size: 20.sp,
                                  ),
                                  SizedBox(width: 7.w),
                                  Text(
                                    "Completed",
                                    style: GoogleFonts.poppins(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF067594),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 15.h),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF0E1329),
                                minimumSize: Size(376.w, 39.h),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                  side: BorderSide(color: Color(0xFF2ECC71)),
                                ),
                              ),
                              onPressed: () {},
                              child: Text(
                                "View Details",
                                style: GoogleFonts.poppins(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF2ECC71),
                                  letterSpacing: -0.4,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
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
