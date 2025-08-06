import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shiha_health_app/Screen/appointment.page.dart';
import 'package:shiha_health_app/Screen/donation.page.dart';
import 'package:shiha_health_app/Screen/healthInsurance.page.dart';
import 'package:shiha_health_app/Screen/hospitalListing.page.dart';
import 'package:shiha_health_app/Screen/laboratoryService.page.dart';
import 'package:shiha_health_app/Screen/selfCare.page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int tab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: SizedBox(
        width: 280.w,
        child: Drawer(
          child: Stack(
            children: [
              Image.asset(
                "assets/drawerimage.png",
                width: 280.w,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.fill,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 30.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "SiHHA",
                        style: GoogleFonts.poppins(
                          fontSize: 36.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      Divider(color: Colors.white38),
                      SizedBox(height: 20.h),
                      Text(
                        "MAIN MENU",
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFB0BABF),
                          letterSpacing: 1.5,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        leading: Icon(
                          Icons.home_outlined,
                          size: 30.sp,
                          color: Colors.white60,
                        ),
                        title: Text(
                          "Home",
                          style: GoogleFonts.poppins(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFB0BABF),
                          ),
                        ),
                      ),
                      ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        leading: Icon(
                          Icons.calendar_today_outlined,
                          size: 28.sp,
                          color: Colors.white60,
                        ),
                        title: Text(
                          "Appointments",
                          style: GoogleFonts.poppins(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFB0BABF),
                          ),
                        ),
                      ),
                      ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        leading: Icon(
                          Icons.description,
                          size: 30.sp,
                          color: Colors.white60,
                        ),
                        title: Text(
                          "Insurance",
                          style: GoogleFonts.poppins(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFB0BABF),
                          ),
                        ),
                      ),
                      ListTile(
                        dense: true, // space ko kam karega
                        contentPadding: EdgeInsets.zero,
                        leading: Icon(
                          Icons.person_outline,
                          size: 30.sp,
                          color: Colors.white60,
                        ),
                        title: Text(
                          "Profile",
                          style: GoogleFonts.poppins(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFB0BABF),
                          ),
                        ),
                      ),
                      ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        leading: Icon(
                          Icons.device_thermostat_outlined,
                          size: 30.sp,
                          color: Colors.white60,
                        ),
                        title: Text(
                          "Laboratory",
                          style: GoogleFonts.poppins(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFB0BABF),
                          ),
                        ),
                      ),
                      ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        leading: Icon(
                          Icons.map_outlined,
                          size: 30.sp,
                          color: Colors.white60,
                        ),
                        title: Text(
                          "International",
                          style: GoogleFonts.poppins(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFB0BABF),
                          ),
                        ),
                      ),
                      ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        leading: Icon(
                          Icons.favorite_border,
                          size: 30.sp,
                          color: Colors.white60,
                        ),
                        title: Text(
                          "Self Care",
                          style: GoogleFonts.poppins(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFB0BABF),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Divider(color: Colors.white38, height: 1),
                      SizedBox(height: 20.h),
                      Text(
                        "Settings",
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFB0BABF),
                          letterSpacing: 2,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        leading: Icon(
                          Icons.headphones,
                          size: 30.sp,
                          color: Colors.white60,
                        ),
                        title: Text(
                          "Support",
                          style: GoogleFonts.poppins(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFB0BABF),
                          ),
                        ),
                      ),
                      ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        leading: Icon(
                          Icons.settings,
                          size: 30.sp,
                          color: Colors.white60,
                        ),
                        title: Text(
                          "Settings",
                          style: GoogleFonts.poppins(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFB0BABF),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 20.h,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20.w),
                      width: 44.w,
                      height: 44.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        // border: Border.all(color: Colors.white, width: 1.w),
                        image: DecorationImage(
                          image: AssetImage("assets/profile.png"),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Amina Sharma",
                          style: GoogleFonts.poppins(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            letterSpacing: -0.5,
                          ),
                        ),
                        Text(
                          "sharam21@gmail.com",
                          style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(178, 255, 255, 255),
                            letterSpacing: -0.4,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
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
              alignment: Alignment.topCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30.h),
                  Row(
                    children: [
                      SizedBox(width: 20.w),
                      InkWell(
                        onTap: () {
                          _scaffoldKey.currentState!.openDrawer();
                        },
                        child: Container(
                          width: 45.w,
                          height: 45.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF2ECC71),
                          ),
                          child: Icon(Icons.menu, color: Colors.white),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hi, Amina",
                            style: GoogleFonts.poppins(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              letterSpacing: -1,
                            ),
                          ),
                          Text(
                            "Start your health journey here",
                            style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(178, 255, 255, 255),
                              letterSpacing: -0.4,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Container(
                        width: 45.w,
                        height: 45.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          // gradient: LinearGradient(
                          //   begin: Alignment.bottomRight,
                          //   end: Alignment.topRight,
                          //   colors: [
                          //     // Color.fromARGB(114, 255, 255, 255),
                          //     // Color.fromARGB(165, 123, 128, 168),
                          //     // Color.fromARGB(255, 37, 65, 86),
                          //   ],
                          // ),
                          border: Border(
                            right: BorderSide(color: Colors.white, width: 1.w),
                            top: BorderSide(color: Colors.white, width: 1.w),
                          ),
                        ),
                        child: Icon(
                          Icons.notifications_none,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Container(
                        width: 45.w,
                        height: 45.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          // gradient: LinearGradient(
                          //   begin: Alignment.bottomRight,
                          //   end: Alignment.topRight,
                          //   colors: [
                          //     Color.fromARGB(114, 255, 255, 255),
                          //     Color.fromARGB(165, 123, 128, 168),
                          //     Color.fromARGB(255, 37, 65, 86),
                          //   ],
                          // ),
                          border: Border(
                            right: BorderSide(color: Colors.white, width: 1.w),
                            top: BorderSide(color: Colors.white, width: 1.w),
                          ),
                        ),
                        child: Icon(
                          Icons.wb_sunny_outlined,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 20.w),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w, right: 20.w),
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                          left: 18.w,
                          right: 18.w,
                          top: 15.h,
                          bottom: 15.h,
                        ),
                        filled: true,
                        //  fillColor: Color(0xFFD9D9D9),
                        fillColor: const Color(0xFFD9D9D9),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.r),
                          borderSide: BorderSide(
                            color: Color(0xFFFFFFFF),
                            width: 1.w,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.r),
                          borderSide: BorderSide(
                            color: Color(0xFFFFFFFF),
                            width: 1.w,
                          ),
                        ),
                        hint: Text(
                          "Search Doctor, Hospital, Test...",
                          style: GoogleFonts.poppins(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF000000),
                          ),
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Color(0xFF067594),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 22.h),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w, right: 15.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        hearbuild("Heart\nRate", "80", 'bpm'),
                        hearbuild("Blood\nPressure", '160', "mg/hg"),
                        hearbuild("Your\nWeight", "60", "kg"),
                        hearbuild("Last\nCheckup", "2", "Week ago"),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    // width: 448.w,
                    // height: 59.h,
                    decoration: BoxDecoration(
                      color: Color(0xFF012B2B),
                      // gradient: LinearGradient(
                      //   begin: Alignment(0.01, 0.51),
                      //   end: Alignment(1.00, 0.51),
                      //   colors: [
                      //     const Color(0x6675FFBA),
                      //     const Color(0xC030FF97),
                      //     const Color(0xFF00FF7F),
                      //     const Color(0x6200FF7F),
                      //     const Color(0x4C00FF7F),
                      //   ],
                      // ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 17.h,
                        bottom: 17.h,
                        left: 50.w,
                        right: 40.w,
                      ),
                      child: Text(
                        textAlign: TextAlign.center,
                        "Drink enough water daily for kidney health - Aim for at least 8 glasses a day unless otherwise advised.",
                        style: GoogleFonts.poppins(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white60,
                          letterSpacing: -0.6,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w, right: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => SelfCarePage(),
                              ),
                            );
                          },
                          child: namebuild(
                            "assets/Consultation.png",
                            "Consultation",
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => DonationPage(),
                              ),
                            );
                          },
                          child: namebuild(
                            "assets/Int. Doctors.png",
                            "Int. Doctors",
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => HospitalListingPage(),
                              ),
                            );
                          },
                          child: namebuild("assets/Hospitals.png", "Hospitals"),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w, right: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => LaboratoryServicePage(),
                              ),
                            );
                          },
                          child: namebuild(
                            "assets/Laboratory.png",
                            "Laboratory",
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => AppointmentPage(),
                              ),
                            );
                          },
                          child: namebuild(
                            "assets/Appointments.png",
                            "Appointments",
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => HealthInsurancePage(),
                              ),
                            );
                          },
                          child: namebuild("assets/Pharmacy.png", "Pharmacy"),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w, right: 20.h),
                    child: Stack(
                      children: [
                        Image.asset("assets/ai.png"),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 15.w, top: 15.h),
                              child: Text(
                                "AI Symptom Checker",
                                style: GoogleFonts.poppins(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFFFFFFFF),
                                  letterSpacing: -1,
                                ),
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Divider(color: Colors.white30, height: 1.h),
                            SizedBox(height: 15.h),
                            Padding(
                              padding: EdgeInsets.only(left: 15.w, right: 15.w),
                              child: TextField(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                    left: 15.w,
                                    right: 15.w,
                                    top: 14.h,
                                    bottom: 14.h,
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
                                  hint: Text(
                                    "Explain your symptoms here",
                                    style: GoogleFonts.poppins(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF067594),
                                      letterSpacing: -0.4,
                                    ),
                                  ),
                                  prefixIcon: SizedBox(
                                    child: Image.asset("assets/symbal.png"),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 14.h),
                            Center(
                              child: Text(
                                "Learn how AI can help identify health issues",
                                style: GoogleFonts.poppins(
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFFB0BABF),
                                  letterSpacing: -0.4,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
                      // gradient: LinearGradient(
                      //   begin: Alignment(0.05, 0.03),
                      //   end: Alignment(0.95, 0.90),
                      //   colors: [
                      //     const Color(0xFF0084FF),
                      //     const Color(0xFF339CFF),
                      //     const Color(0xFF0084FF),
                      //   ],
                      // ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 5.w,
                        top: 5.h,
                        bottom: 5.h,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                tab = 0;
                              });
                            },
                            child: MyWidget(
                              name: 'Booking',
                              bgColor: tab == 0
                                  ? Color(0xFF067594)
                                  : Color(0x66067594),
                              borderColor: tab == 0
                                  ? Colors.white
                                  : Colors.transparent,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                tab = 1;
                              });
                            },
                            child: MyWidget(
                              name: 'Consultation',
                              bgColor: tab == 1
                                  ? Color(0xFF067594)
                                  : Color(0x66067594),
                              borderColor: tab == 1
                                  ? Colors.white
                                  : Colors.transparent,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                tab = 2;
                              });
                            },
                            child: MyWidget(
                              name: 'Lab Tests',
                              bgColor: tab == 2
                                  ? Color(0xFF067594)
                                  : Color(0x66067594),
                              borderColor: tab == 2
                                  ? Colors.white
                                  : Colors.transparent,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  SizedBox(
                    height: 185.h,
                    child: ListView.builder(
                      itemCount: 2,
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(left: 20.w),
                          padding: EdgeInsets.only(
                            left: 15.w,
                            right: 15.w,
                            top: 15.h,
                            //bottom: 10.h,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color: Color(0xFF0E1329),
                            border: Border.all(
                              color: Color.fromARGB(51, 255, 255, 255),
                              width: 1.w,
                            ),
                          ),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10.r),
                                    child: Image.asset(
                                      "assets/checkup.png",
                                      width: 80.w,
                                      height: 90.h,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(width: 15.w),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                              top: 5.h,
                                              bottom: 5.h,
                                              left: 8.w,
                                              right: 8.w,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(40.r),
                                              color: Color.fromARGB(
                                                25,
                                                29,
                                                206,
                                                6,
                                              ),
                                            ),
                                            child: Row(
                                              children: [
                                                Container(
                                                  // width: 10.w,
                                                  // height: 10.h,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Color(0xFF1DCE06),
                                                  ),
                                                  child: Icon(
                                                    Icons.done,
                                                    size: 15.sp,
                                                  ),
                                                ),
                                                SizedBox(width: 6.w),
                                                Text(
                                                  "Confirmed",
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 10.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xFF1DCE06),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(width: 8.w),
                                          Container(
                                            padding: EdgeInsets.only(
                                              top: 5.h,
                                              bottom: 5.h,
                                              left: 8.w,
                                              right: 8.w,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(40.r),
                                              color: Color.fromARGB(
                                                25,
                                                29,
                                                206,
                                                6,
                                              ),
                                            ),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.calendar_today,
                                                  size: 15.sp,
                                                  color: Color(0xFF067594),
                                                ),
                                                SizedBox(width: 6.w),
                                                Text(
                                                  "28 June 2025",
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 10.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xFF067594),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 6.h),
                                      SizedBox(
                                        width: 200.w,
                                        child: Text(
                                          "General Check-up – LifeCare Hospital",
                                          style: GoogleFonts.poppins(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFFFFFFFF),
                                            letterSpacing: -0.4,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "Jaipur, Rajasthan",
                                        style: GoogleFonts.poppins(
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white38,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.h),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors
                                      .transparent, // 👈 background hata diya
                                  elevation: 0,
                                  minimumSize: Size(285.w, 36.h),
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
                                  "Reschedule",
                                  style: GoogleFonts.poppins(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF067594),
                                    letterSpacing: -0.3,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.w),
                    padding: EdgeInsets.only(
                      left: 15.w,
                      right: 15.w,
                      bottom: 20.h,
                      top: 20.h,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFF0E1329),
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border(
                        top: BorderSide(color: Colors.white54, width: 1.w),
                        right: BorderSide(color: Colors.white54, width: 1.w),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Reminders',
                          style: GoogleFonts.poppins(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Divider(color: Colors.white24, thickness: 1),
                        SizedBox(height: 10.h),
                        ReminderTile(
                          isCompleted: true,
                          title: 'Blood Pressure Check – Due in 3 days',
                        ),
                        SizedBox(height: 8.h),
                        ReminderTile(
                          isCompleted: false,
                          title:
                              'Medication Refill – “Vitamin D3 tablets” runs out in 5 days',
                        ),
                        SizedBox(height: 8.h),
                        ReminderTile(
                          isCompleted: false,
                          title:
                              'Next Vaccine Dose – Typhoid booster due on 10 July 2025',
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

  Widget hearbuild(String name, String number, String par) {
    return Container(
      // padding: EdgeInsets.only(
      //   left: 12.w,
      //   right: 20.w,
      //   top: 12.h,
      //   bottom: 12.h,
      // ),
      width: 95.w,
      // height: 110.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Color(0xFF0E1329),
        border: Border(
          top: BorderSide(color: Colors.white, width: 1.w),
          right: BorderSide(color: Colors.white, width: 1.w),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 12.w, top: 12.h, bottom: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/heart.png"),
            SizedBox(height: 10.h),
            Text(
              name,
              style: GoogleFonts.poppins(
                fontSize: 11.sp,
                fontWeight: FontWeight.w400,
                // color: Color(0xFFFFFFFF),
                color: Colors.white60,
              ),
            ),
            SizedBox(height: 10.h),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: number,
                    style: GoogleFonts.poppins(
                      fontSize: 20.sp, // bada size
                      fontWeight: FontWeight.w300,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                  TextSpan(
                    text: par,
                    style: GoogleFonts.poppins(
                      fontSize: 12.sp, // chhota size
                      fontWeight: FontWeight.w300,
                      color: Color(0xFFA5A7A8),
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

  Widget namebuild(String image, String name) {
    return Container(
      width: 126.w,
      height: 90.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Color(0xFF0E1329),
        border: Border(
          top: BorderSide(color: Colors.white, width: 1.w),
          right: BorderSide(color: Colors.white, width: 1.w),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image),
          SizedBox(height: 6.h),
          Text(
            name,
            style: GoogleFonts.poppins(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: Color(0xFFFFFFFF),
            ),
          ),
        ],
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  final String name;
  final Color bgColor;
  final Color borderColor;
  const MyWidget({
    super.key,
    required this.name,
    required this.bgColor,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130.w,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: bgColor,
        border: Border(
          top: BorderSide(color: borderColor, width: 1.w),
        ),
      ),
      child: Center(
        child: Text(
          name,
          style: GoogleFonts.poppins(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            letterSpacing: -0.4,
          ),
        ),
      ),
    );
  }
}

class ReminderTile extends StatelessWidget {
  final bool isCompleted;
  final String title;

  const ReminderTile({Key? key, required this.isCompleted, required this.title})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
          color: isCompleted ? Color(0xFF1DCE06) : Colors.white38,
          size: 20.sp,
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
              color: Color(0xFFB0BABF),
              letterSpacing: -0.4,
            ),
          ),
        ),
      ],
    );
  }
}
