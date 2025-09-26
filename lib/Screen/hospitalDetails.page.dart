import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shiha_health_app/Screen/doctorList.page.dart';
import 'package:shiha_health_app/data/controller/hospitalDetails.provider.dart';


class HospitalDetailsPage extends ConsumerStatefulWidget {
  final String id;
  const HospitalDetailsPage({super.key, required this.id});

  @override
  ConsumerState<HospitalDetailsPage> createState() =>
      _HospitalDetailsPageState();
}

class _HospitalDetailsPageState extends ConsumerState<HospitalDetailsPage> {
  Set<String> selectedOptions = {};
  List<String> interestedlist = [
    "Pediatrics",
    "Cardiology",
    "Dermatology",
    "Neurology",
    "Oncology",
    "Orthopedics",
    "Surgery",
    "Gastroenterology",
    "Psychiatry",
  ];

  Set<String> selectinterested = {}; // Store selected items

  @override
  Widget build(BuildContext context) {
    final hospital = ref.watch(hospitalDetailsProvider(widget.id));
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height + 250.h,
          child: Stack(
            children: [
              Image.asset(
                "assets/homebg.png",
                width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height,
                fit: BoxFit.fill,
              ),
              hospital.when(
                data: (snap) {
                  List<dynamic> decoded = jsonDecode(snap.servicesOffered);
                   List<String> listService = List<String>.from(decoded);
                  return Align(
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
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Text(
                              "Hospital Overview",
                              style: GoogleFonts.poppins(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15.h),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 248.h,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.r),
                            child: Image.network(
                              "http://sihahealth.globallywebsolutions.com${snap.images[0]}",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          children: [
                            SizedBox(width: 20.w),
                            Text(
                              "${snap.name}",
                              style: GoogleFonts.poppins(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                letterSpacing: -0.7,
                              ),
                            ),
                            Spacer(),
                            Container(
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
                                    size: 18.sp,
                                  ),
                                  Text(
                                    "${snap.rating}",
                                    style: GoogleFonts.poppins(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFFD8A200),
                                      letterSpacing: -0.3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 20.w),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20.w),
                          child: Text(
                            snap.location,
                            style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFB0BABF),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: 20.h,
                            left: 20.w,
                            right: 20.w,
                          ),
                          padding: EdgeInsets.only(
                            left: 20.w,
                            right: 20.w,
                            bottom: 10.h,
                            top: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 16, 31, 45),
                            borderRadius: BorderRadius.circular(10.r),
                            //border: Border.all(color: Colors.white, width: 0.85.w),
                            border: Border(
                              top: BorderSide(
                                color: Colors.white,
                                width: 0.85.w,
                              ),
                              right: BorderSide(
                                color: Colors.white,
                                width: 0.85.w,
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Consultation Price",
                                    style: GoogleFonts.poppins(
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white70,
                                      letterSpacing: 2,
                                    ),
                                  ),
                                  SizedBox(height: 7.h),
                                  Text(
                                    "${snap.consultationPriceRange}",
                                    style: GoogleFonts.poppins(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF067594),
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Container(
                                height: 40.h,
                                width: 1.w,
                                color: Colors.white60,
                              ),
                              Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "language",
                                    style: GoogleFonts.poppins(
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white70,
                                      letterSpacing: 2,
                                    ),
                                  ),
                                  SizedBox(height: 7.h),
                                  Text(
                                    "${snap.language}",
                                    style: GoogleFonts.poppins(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF067594),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30.h),
                        Padding(
                          padding: EdgeInsets.only(left: 20.w, right: 20.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "About ${snap.name}",
                                style: GoogleFonts.poppins(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  letterSpacing: -0.4,
                                ),
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                "Banadir General Hospital is a leading healthcare provider offering a range of services including pediatrics, surgery, and general medicine.",
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
                        SizedBox(height: 20.h),
                        Padding(
                          padding: EdgeInsets.only(left: 20.w, right: 20.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Services Offered",
                                style: GoogleFonts.poppins(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  letterSpacing: -0.4,
                                ),
                              ),
                              SizedBox(height: 10.h),
                              Wrap(
                                // runSpacing: 10.w,
                                spacing: 10.h,
                                children: listService.map((filter) {
                                  final isSelected = selectinterested.contains(
                                    filter,
                                  );
                                  return FilterChip(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40.r),
                                      side: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    label: Text(
                                      filter,
                                      style: GoogleFonts.poppins(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF067594),
                                      ),
                                    ),
                                    showCheckmark: false,
                                    //  / selectedColor: Color(0xFFFE9F0F),
                                    selected: selectinterested.contains(filter),
                                    backgroundColor: Color.fromARGB(
                                      255,
                                      2,
                                      17,
                                      48,
                                    ),
                                    onSelected: (isSelected) {
                                      setState(() {
                                        if (isSelected) {
                                          selectinterested.add(filter);
                                        } else {
                                          selectinterested.remove(filter);
                                        }
                                      });
                                    },
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 25.h),
                        Padding(
                          padding: EdgeInsets.only(left: 20.w, right: 20.w),
                          child: Text(
                            "Location on Map",
                            style: GoogleFonts.poppins(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 10.w,
                            right: 20.w,
                            top: 15.h,
                          ),
                          child: Image.asset(
                            "assets/locatio.png",
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.w, right: 20.w),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(400.w, 55.h),
                              backgroundColor: Color(0xFF067594),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => DoctorListPage(),
                                ),
                              );
                            },
                            child: Text(
                              "View Doctors",
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
                error: (err, stack) {
                  return Center(child: Text("$err"));
                },
                loading: () => SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: CircularProgressIndicator(color: Colors.white),
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
