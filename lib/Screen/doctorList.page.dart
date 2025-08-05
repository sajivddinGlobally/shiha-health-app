import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shiha_health_app/Screen/doctorDetails.page.dart';
import 'package:shiha_health_app/Screen/hospitalListing.page.dart';

class DoctorListPage extends StatefulWidget {
  const DoctorListPage({super.key});

  @override
  State<DoctorListPage> createState() => _DoctorListPageState();
}

class _DoctorListPageState extends State<DoctorListPage> {
  List<Map<String, dynamic>> doctorList = [
    {
      "image": "assets/d1.png",
      "reting": "4.2/5",
      "name": "Robert Smith",
      "title": "Paediatrics (6 Yrs experience)",
    },
    {
      "image": "assets/d2.png",
      "reting": "4.5/5",
      "name": "Emily Johnson",
      "title": "Dermatology (8 Yrs experience)",
    },
    {
      "image": "assets/d3.png",
      "reting": "4.8/5",
      "name": "Michael Brown",
      "title": "Orthopedics (10 Yrs experience)",
    },
    {
      "image": "assets/d4.png",
      "reting": "4.0/5",
      "name": "Addis Ababa Medical Center",
      "title": "Consultation Price: ",
    },
    {
      "image": "assets/d5.png",
      "reting": "4.5/5",
      "name": "Sarah Davis",
      "title": "General Surgery (5 Yrs experience)",
    },
    {
      "image": "assets/d6.png",
      "reting": "4.6/5",
      "name": "James Wilson",
      "title": "Cardiology (7 Yrs experience)",
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
                SizedBox(height: 20.h),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SizedBox(width: 20.w),
                      buildFilter(name: "Speciality"),
                      SizedBox(width: 8.w),
                      buildFilter(name: "Price"),
                      SizedBox(width: 8.w),
                      buildFilter(name: "Availability"),
                      SizedBox(width: 8.w),
                      buildFilter(name: "Rating"),
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
                      itemCount: doctorList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 15.w,
                        crossAxisSpacing: 15.h,
                        childAspectRatio: 0.65,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => DoctorDetailsPage(),
                              ),
                            );
                          },
                          child: Container(
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
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: SizedBox(
                                    width: 170.w,
                                    height: 170.h,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.r),
                                      child: Image.asset(
                                        doctorList[index]['image'].toString(),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 12.h),
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
                                        borderRadius: BorderRadius.circular(
                                          40.r,
                                        ),
                                        color: Color.fromARGB(255, 38, 36, 37),
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Color(0xFFD8A200),
                                            size: 15.sp,
                                          ),
                                          Text(
                                            doctorList[index]['reting']
                                                .toString(),
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
                                    if (index == 1 || index == 4)
                                      Container(
                                        margin: EdgeInsets.only(left: 6.w),
                                        padding: EdgeInsets.only(
                                          left: 5.w,
                                          right: 5.w,
                                          top: 5.h,
                                          bottom: 5.h,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            40.r,
                                          ),
                                          color: Color.fromARGB(
                                            25,
                                            125,
                                            255,
                                            180,
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 5.r,
                                              backgroundColor: Color(
                                                0xFF2ECC71,
                                              ),
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
                                SizedBox(height: 7.h),
                                SizedBox(
                                  width: 161.w,
                                  child: Text(
                                    overflow: TextOverflow.ellipsis,
                                    doctorList[index]['name'].toString(),
                                    style: GoogleFonts.poppins(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      letterSpacing: -0.4,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 7.h),
                                Text(
                                  doctorList[index]['title'].toString(),
                                  style: GoogleFonts.poppins(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFFB0BABF),
                                    letterSpacing: -0.3,
                                  ),
                                ),
                              ],
                            ),
                          ),
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
}
