import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shiha_health_app/Screen/home.page.dart';

class HealthInsurancePage extends StatefulWidget {
  const HealthInsurancePage({super.key});

  @override
  State<HealthInsurancePage> createState() => _HealthInsurancePageState();
}

class _HealthInsurancePageState extends State<HealthInsurancePage> {
  int tab = 0;
  List<Map<String, dynamic>> healthList = [
    {
      "image": "assets/he1.png",
      "name": "Mother & Child Insurance",
      "month": "\$10/month",
      "desc":
          "Our coverage offers financial protection for both mothers and their children, ensuring peace of mind during pregnancy and beyond. Benefits include prenatal care, postnatal support, and pediatric services, all tailored to meet your family's needs. Get started today to secure a healthy future!",
      "button": "Register Now",
    },
    {
      "image": "assets/he2.png",
      "name": "Family Health Package",
      "month": "\$25/month",
      "desc":
          "This comprehensive health package provides extensive coverage for all family members, focusing on preventative care and wellness. Enjoy benefits such as regular check-ups, vaccinations, and access to a network of healthcare professionals dedicated to your family's health.",
      "button": "Join Today",
    },
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
                      "Book Hospitals",
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
                    padding: EdgeInsets.only(left: 5.w, top: 5.h, bottom: 5.h),
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
                            name: 'All Insurances',
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
                            name: 'Your Insurance',
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
                            name: 'Support',
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
                SizedBox(height: 10.h),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: healthList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(
                          left: 20.w,
                          right: 20.w,
                          top: 10.h,
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
                          border: Border.all(color: Colors.white, width: 1.w),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.r),
                              child: Image.asset(
                                healthList[index]['image'].toString(),
                                width: 376.w,
                                height: 158.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 12.h),
                            Row(
                              children: [
                                Container(
                                  width: 52.w,
                                  height: 52.h,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color.fromARGB(255, 13, 29, 52),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.calendar_today_outlined,
                                      size: 20.sp,
                                      color: Color(0xFF067594),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      healthList[index]['name'].toString(),
                                      style: GoogleFonts.poppins(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                        letterSpacing: -1,
                                      ),
                                    ),
                                    Text(
                                      healthList[index]['month'].toString(),
                                      style: GoogleFonts.poppins(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF067594),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(width: 12.w),
                            Text(
                              healthList[index]['desc'].toString(),
                              style: GoogleFonts.poppins(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(153, 240, 243, 245),
                                letterSpacing: -1,
                              ),
                            ),
                            SizedBox(height: 20.w),
                            Container(
                              width: 400.w,
                              height: 50.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: Color(0xFF067594),
                                border: Border(
                                  top: BorderSide(
                                    color: Colors.white,
                                    width: 0.85,
                                  ),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  healthList[index]['button'].toString(),
                                  style: GoogleFonts.poppins(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
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
