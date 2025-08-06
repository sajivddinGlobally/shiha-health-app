import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  int tab = 0;
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
                      "Appointment",
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
                SizedBox(height: 20.h),
                Container(
                  margin: EdgeInsets.only(left: 20.w, right: 20.w),
                  width: 400.w,
                  height: 45.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border(
                      top: BorderSide(color: Colors.white, width: 1.w),
                      right: BorderSide(color: Colors.white, width: 1.w),
                    ),
                    color: Color(0xFF0A4D80),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 5.w, top: 5.h, bottom: 5.h),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              tab = 0;
                            });
                          },
                          child: Container(
                            width: 195.w,
                            height: MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              color: tab == 0
                                  ? Color(0xFF067594)
                                  : Color(0x66067594),
                              border: Border(
                                top: BorderSide(
                                  color: Colors.white,
                                  width: 1.w,
                                ),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Upcoming ",
                                style: GoogleFonts.poppins(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  letterSpacing: -0.4,
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              tab = 1;
                            });
                          },
                          child: Container(
                            width: 195.w,
                            height: MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              color: tab == 1
                                  ? Color(0xFF067594)
                                  : Color(0x66067594),
                              border: Border(
                                top: BorderSide(
                                  color: tab == 0
                                      ? Colors.white
                                      : Colors.transparent,
                                  width: 1.w,
                                ),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Missed",
                                style: GoogleFonts.poppins(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  letterSpacing: -0.4,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                tab == 0
                    ? Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(
                                left: 20.w,
                                right: 20.w,
                                top: 15.h,
                              ),
                              padding: EdgeInsets.only(
                                left: 12.w,
                                right: 12.w,
                                top: 12.h,
                                bottom: 12.h,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                                color: Color(0xFF0E1329),
                                border: Border(
                                  top: BorderSide(
                                    color: Colors.white,
                                    width: 1.w,
                                  ),
                                  right: BorderSide(
                                    color: Colors.white,
                                    width: 1.w,
                                  ),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 52.w,
                                        height: 52.h,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            image: AssetImage(
                                              "assets/robot.png",
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 12.w),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Robert Smith",
                                            style: GoogleFonts.poppins(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xFFFFFFFF),
                                              letterSpacing: -0.3,
                                            ),
                                          ),
                                          Text(
                                            "Paediatrics (6 Years experience)",
                                            style: GoogleFonts.poppins(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xFFB0BABF),
                                              letterSpacing: -0.3,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 12.h),
                                  Container(
                                    padding: EdgeInsets.only(
                                      top: 12.h,
                                      bottom: 12.h,
                                      left: 16.w,
                                      right: 16.w,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      color: Color.fromARGB(255, 27, 32, 54),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.calendar_today_outlined,
                                          color: Color(0xFF067594),
                                          size: 20.sp,
                                        ),
                                        SizedBox(width: 8.w),
                                        Text(
                                          "25 April",
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
                                            borderRadius: BorderRadius.circular(
                                              5.r,
                                            ),
                                            color: Color(0xFF8D93AA),
                                          ),
                                        ),
                                        Spacer(),
                                        Icon(
                                          Icons.access_alarm,
                                          color: Color(0xFF067594),
                                          size: 20.sp,
                                        ),
                                        SizedBox(width: 8.w),
                                        Text(
                                          "10:00 AM",
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
                                            borderRadius: BorderRadius.circular(
                                              5.r,
                                            ),
                                            color: Color(0xFF8D93AA),
                                          ),
                                        ),
                                        Spacer(),
                                        Icon(
                                          Icons.location_on_outlined,
                                          color: Color(0xFF067594),
                                          size: 20.sp,
                                        ),
                                        SizedBox(width: 8.w),
                                        Text(
                                          "Banadir Hospital",
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
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(0xFF0E1329),
                                          minimumSize: Size(170.w, 39.h),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              10.r,
                                            ),
                                            side: BorderSide(
                                              color: Color(0xFF2ECC71),
                                              width: 1.w,
                                            ),
                                          ),
                                        ),
                                        onPressed: () {},
                                        child: Text(
                                          "Change Appointment",
                                          style: GoogleFonts.poppins(
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFF2ECC71),
                                            letterSpacing: -0.4,
                                          ),
                                        ),
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(0xFF0E1329),
                                          minimumSize: Size(170.w, 39.h),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              10.r,
                                            ),
                                            side: BorderSide(
                                              color: Color(0xFFDA110A),
                                              width: 1.w,
                                            ),
                                          ),
                                        ),
                                        onPressed: () {},
                                        child: Text(
                                          "Delete Appointment ",
                                          style: GoogleFonts.poppins(
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFFDA110A),
                                            letterSpacing: -0.4,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    : MissedAppointment(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MissedAppointment extends StatelessWidget {
  const MissedAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 15.h),
            padding: EdgeInsets.only(
              left: 12.w,
              right: 12.w,
              top: 12.h,
              bottom: 12.h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: Color(0xFF0E1329),
              border: Border(
                top: BorderSide(color: Colors.white, width: 1.w),
                right: BorderSide(color: Colors.white, width: 1.w),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 52.w,
                      height: 52.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage("assets/robot.png"),
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Robert Smith",
                          style: GoogleFonts.poppins(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFFFFFFF),
                            letterSpacing: -0.3,
                          ),
                        ),
                        Text(
                          "Paediatrics (6 Years experience)",
                          style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFB0BABF),
                            letterSpacing: -0.3,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                      width: 66.w,
                      height: 28.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.r),
                        color: Color.fromARGB(25, 218, 17, 10),
                      ),
                      child: Center(
                        child: Text(
                          "Missed",
                          style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFDA110A),
                            letterSpacing: -0.3,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Container(
                  padding: EdgeInsets.only(
                    top: 12.h,
                    bottom: 12.h,
                    left: 16.w,
                    right: 16.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Color.fromARGB(255, 27, 32, 54),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.calendar_today_outlined,
                        color: Color(0xFF8D93AA),
                        size: 20.sp,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        "25 April",
                        style: GoogleFonts.poppins(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF8D93AA),
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
                        color: Color(0xFF8D93AA),
                        size: 20.sp,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        "10:00 AM",
                        style: GoogleFonts.poppins(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF8D93AA),
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
                        Icons.location_on_outlined,
                        color: Color(0xFF8D93AA),
                        size: 20.sp,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        "Banadir Hospital",
                        style: GoogleFonts.poppins(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF8D93AA),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF0E1329),
                        minimumSize: Size(170.w, 39.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          side: BorderSide(
                            color: Color(0xFF067594),
                            width: 1.w,
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Check availability",
                        style: GoogleFonts.poppins(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF067594),
                          letterSpacing: -0.4,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF0E1329),
                        minimumSize: Size(170.w, 39.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          side: BorderSide(
                            color: Color(0xFF2ECC71),
                            width: 1.w,
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Make new Appointment",
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
              ],
            ),
          );
        },
      ),
    );
  }
}
