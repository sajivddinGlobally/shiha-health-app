import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shiha_health_app/Screen/donationDetails.page.dart';
import 'package:shiha_health_app/Screen/yourDonation.page.dart';
import 'package:shiha_health_app/data/controller/getDonationRequestController.dart';

class DonationPage extends ConsumerStatefulWidget {
  const DonationPage({super.key});

  @override
  ConsumerState<DonationPage> createState() => _DonationPageState();
}

class _DonationPageState extends ConsumerState<DonationPage> {
  List<Map<String, dynamic>> donationList = [
    {"image": "assets/don.png"},
    {"image": "assets/don1.png"},
    {"image": "assets/don.png"},
  ];
  bool isShow = false;
  final searchControlelr = TextEditingController();
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final donationData = ref.watch(getDonationRequestController);
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
                SizedBox(height: 20.h),
                Row(
                  children: [
                    SizedBox(width: 20.w),

                    // Back button (optional)
                    // IconButton(
                    //   padding: EdgeInsets.zero,
                    //   constraints: BoxConstraints(),
                    //   onPressed: () => Navigator.pop(context),
                    //   icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                    // ),
                    Expanded(
                      child: isShow
                          ? TextField(
                              onChanged: (value) {
                                setState(() {
                                  searchQuery = value;
                                });
                              },
                              controller: searchControlelr,
                              style: GoogleFonts.poppins(
                                fontSize: 18.sp,
                                color: Colors.white,
                              ),
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                isDense: true,
                                hintText: "Search...",
                                hintStyle: GoogleFonts.poppins(
                                  color: Colors.white70,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 12.h,
                                  horizontal: 10.w,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                            )
                          : Text(
                              "Donation",
                              style: GoogleFonts.poppins(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                    ),
                    SizedBox(width: 10.w),
                    IconButton(
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      onPressed: () {
                        setState(() {
                          isShow = !isShow;
                        });
                      },
                      icon: Icon(
                        isShow ? Icons.close : Icons.search,
                        color: Colors.white,
                        size: 30.sp,
                      ),
                    ),
                    SizedBox(width: 10.w),
                  ],
                ),
                if (isShow) SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 20.w),
                    donationBuild("assets/blood.png", "Donate Blood"),
                    donationBuild("assets/money.png", "Donate Money"),
                    donationBuild("assets/Consultation.png", "Request Help"),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => YourDonationPage(),
                          ),
                        );
                      },
                      child: donationBuild(
                        "assets/donation.png",
                        "Your Donations",
                      ),
                    ),
                    SizedBox(width: 20.w),
                  ],
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Text(
                    "Donation Requests",
                    style: GoogleFonts.poppins(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      letterSpacing: -0.4,
                    ),
                  ),
                ),
                donationData.when(
                  data: (donation) {
                    final queryText = searchControlelr.text
                        .toLowerCase()
                        .trim();

                    final filterData = donation.where((q) {
                      final group = q.bloodGroup.toLowerCase();
                      final pname = q.patientName.toLowerCase();
                      final hname = q.hospitalName.toLowerCase();

                      return group.contains(queryText) ||
                          pname.contains(queryText) ||
                          hname.contains(queryText);
                    }).toList();

                    if (filterData.isEmpty) {
                      return Center(
                        child: Text(
                          "No Request Found",
                          style: GoogleFonts.poppins(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      );
                    }
                    
                    return Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: filterData.length,
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
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                        builder: (context) =>
                                            DonationDetailsPage(
                                              id: donation[index].id.toString(),
                                            ),
                                      ),
                                    );
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.r),
                                    child: Image.asset(
                                      //donationList[index]['image'].toString(),
                                      filterData[index].photos.first,
                                      width: 380.w,
                                      height: 162.h,
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error, stackTrace) {
                                        return Image.network(
                                          "https://img.freepik.com/vecteurs-premium/vecteur-icone-image-par-defaut-page-image-manquante-pour-conception-site-web-application-mobile-aucune-photo-disponible_87543-11093.jpg",
                                          width: 380.w,
                                          height: 162.h,
                                          fit: BoxFit.cover,
                                        );
                                      },
                                    ),
                                  ),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Type ${filterData[index].bloodGroup}- Blood Required",
                                          style: GoogleFonts.poppins(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                            letterSpacing: -0.4,
                                          ),
                                        ),

                                        Text(
                                          // "Rahul Singh (Age 32)",
                                          "${filterData[index].patientName} (Age ${donation[index].age})",
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
                                        // "SMS Hospital",
                                        filterData[index].hospitalName,
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
                                        Icons.calendar_today_outlined,
                                        color: Color(0xFF067594),
                                        size: 20.sp,
                                      ),
                                      SizedBox(width: 7.w),
                                      Text(
                                        "4.2 km away",
                                        style: GoogleFonts.poppins(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF067594),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 12.h),
                                Text(
                                  "Neha Sharma is in critical condition and requires blood transfusions to stabilize her health.",
                                  style: GoogleFonts.poppins(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(153, 240, 243, 245),
                                    letterSpacing: -0.4,
                                  ),
                                ),
                                SizedBox(height: 15.h),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFF0E1329),
                                    minimumSize: Size(376.w, 39.h),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                      side: BorderSide(
                                        color: Color(0xFF2ECC71),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    "Donate Blood",
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
                    );
                  },
                  error: (error, stackTrace) {
                    log(stackTrace.toString());
                    return Center(
                      child: Text(
                        error.toString(),
                        style: GoogleFonts.poppins(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                  loading: () => Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget donationBuild(String image, String name) {
    return Container(
      width: 94.w,
      height: 97.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Color(0xFF0E1329),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image),
          SizedBox(height: 6.h),
          Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w),
            child: Text(
              textAlign: TextAlign.center,
              name,
              style: GoogleFonts.poppins(
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
