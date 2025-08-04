import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HospitalListingPage extends StatefulWidget {
  const HospitalListingPage({super.key});

  @override
  State<HospitalListingPage> createState() => _HospitalListingPageState();
}

class _HospitalListingPageState extends State<HospitalListingPage> {
  List<Map<String, dynamic>> hospitalList = [
    {
      "image": "assets/checkup.png",
      "address": "KM4, Mogadishu",
      "reting": "4.2/5",
      "name": "Banadir General Hospital",
      "title": "Consultation Price: ",
      "ammount": "\$15–\$40",
    },
    {
      "image": "assets/h2.png",
      "address": "K57, Nairobi",
      "reting": "4.5/5",
      "name": "Nairobi West Hospital",
      "title": "Consultation Price: ",
      "ammount": "\$20–\$45",
    },
    {
      "image": "assets/h3.png",
      "address": "K7, Kampala",
      "reting": "4.3/5",
      "name": "Mulago National Hospital",
      "title": "Consultation Price: ",
      "ammount": "\$20–\$45",
    },
    {
      "image": "assets/h4.png",
      "address": "A5, Addis Ababa",
      "reting": "4.6/5",
      "name": "Addis Ababa Medical Center",
      "title": "Consultation Price: ",
      "ammount": "\$20–\$45",
    },
    {
      "image": "assets/h6.png",
      "address": "M9, Dakar",
      "reting": "4.1/5",
      "name": "Dakar General Hospital",
      "title": "Consultation Price: ",
      "ammount": "\$20–\$45",
    },
    {
      "image": "assets/h7.png",
      "address": "R3, Accra",
      "reting": "4.4/5",
      "name": "Korle Bu Teaching Hospital",
      "title": "Consultation Price: ",
      "ammount": "\$20–\$45",
    },
    {
      "image": "assets/h8.png",
      "address": "R3, Accra",
      "reting": "4.4/5",
      "name": "Korle Bu Teaching Hospital",
      "title": "Consultation Price: ",
      "ammount": "\$20–\$45",
    },
    {
      "image": "assets/h1.png",
      "address": "R3, Accra",
      "reting": "4.4/5",
      "name": "Korle Bu Teaching Hospital",
      "title": "Consultation Price: ",
      "ammount": "\$20–\$45",
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
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SizedBox(width: 20.w),
                      buildFilter("Speciality"),
                      SizedBox(width: 8.w),
                      buildFilter("Price"),
                      SizedBox(width: 8.w),
                      buildFilter("Availability"),
                      SizedBox(width: 8.w),
                      buildFilter("Rating"),
                      SizedBox(width: 8.w),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.w, right: 20.w),
                    child: GridView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: hospitalList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 15.w,
                        crossAxisSpacing: 15.h,
                        childAspectRatio: 0.90,
                      ),
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 190.w,
                              height: 130.h,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.r),
                                child: Image.asset(
                                  hospitalList[index]['image'].toString(),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 15.h),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(
                                    left: 5.w,
                                    right: 5.w,
                                    top: 5.h,
                                    bottom: 5.h,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40.r),
                                    color: Color.fromARGB(25, 0, 132, 255),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        color: Color(0xFF067594),
                                        size: 15.sp,
                                      ),
                                      Text(
                                        hospitalList[index]['address']
                                            .toString(),
                                        style: GoogleFonts.poppins(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF067594),
                                          letterSpacing: -0.3,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Flexible(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 6.w),
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
                                          hospitalList[index]['reting']
                                              .toString(),
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
                                ),
                              ],
                            ),
                            SizedBox(height: 7.h),
                            Text(
                              hospitalList[index]['name'].toString(),
                              style: GoogleFonts.poppins(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                letterSpacing: -0.4,
                              ),
                            ),
                            SizedBox(height: 7.h),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: hospitalList[index]['title']
                                        .toString(),
                                    style: GoogleFonts.poppins(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromARGB(153, 240, 243, 245),
                                      letterSpacing: -0.3,
                                    ),
                                  ),
                                  TextSpan(
                                    text: hospitalList[index]['ammount']
                                        .toString(),
                                    style: GoogleFonts.poppins(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF067594),
                                      letterSpacing: -0.3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFilter(String name) {
    return Container(
      padding: EdgeInsets.only(left: 15.w, right: 10.w, top: 3.h, bottom: 3.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: Colors.white, width: 1.w),
      ),
      child: Row(
        children: [
          Text(
            name,
            style: GoogleFonts.poppins(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white,
              letterSpacing: -0.4,
            ),
          ),
          SizedBox(height: 10.w),
          Icon(
            Icons.keyboard_arrow_down_outlined,
            color: Colors.white,
            size: 25.sp,
          ),
        ],
      ),
    );
  }
}
