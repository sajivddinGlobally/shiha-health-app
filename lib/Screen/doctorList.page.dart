import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shiha_health_app/Screen/doctor/doctorDetails.page.dart';
import 'package:shiha_health_app/Screen/hospitalListing.page.dart';
import 'package:shiha_health_app/data/controller/doctorsList.provider.dart';
import 'package:shiha_health_app/data/model/doctorsList.response.dart';

class DoctorListPage extends ConsumerStatefulWidget {
  const DoctorListPage({super.key});

  @override
  ConsumerState<DoctorListPage> createState() => _DoctorListPageState();
}

class _DoctorListPageState extends ConsumerState<DoctorListPage> {
  bool isSearching = false;
  String searchQuery = "";
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final doctorsList = ref.watch(doctorsListProvider);

    return Scaffold(
      body: doctorsList.when(
        data: (snap) {
          // Filter based on search query
          final filteredDoctors = snap.where((doctor) {
            final nameMatch = doctor.fullName.toLowerCase().contains(searchQuery.toLowerCase());
            final specialtyMatch = doctor.specialty.toLowerCase().contains(searchQuery.toLowerCase());
            return nameMatch || specialtyMatch;
          }).toList();

          return Stack(
            children: [
              Image.asset(
                "assets/homebg.png",
                width: MediaQuery.of(context).size.width,
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
                            if (isSearching) {
                              setState(() {
                                isSearching = false;
                                searchQuery = "";
                                searchController.clear();
                              });
                            } else {
                              Navigator.pop(context);
                            }
                          },
                          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                        ),
                        SizedBox(width: 10.w),

                        // Title or Search Field
                        isSearching
                            ? Expanded(
                                child: TextField(
                                  controller: searchController,
                                  autofocus: true,
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    hintText: "Search by name or specialty",
                                    hintStyle: TextStyle(color: Colors.white54),
                                    border: InputBorder.none,
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      searchQuery = value;
                                    });
                                  },
                                ),
                              )
                            : Text(
                                "All Doctors",
                                style: GoogleFonts.poppins(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),

                        Spacer(),

                        // Search Icon
                        IconButton(
                          style: IconButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size(0, 0),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          onPressed: () {
                            setState(() {
                              isSearching = !isSearching;
                              if (!isSearching) {
                                searchQuery = "";
                                searchController.clear();
                              }
                            });
                          },
                          icon: Icon(Icons.search, color: Colors.white),
                        ),
                        SizedBox(width: 20.w),
                      ],
                    ),
                    SizedBox(height: 20.h),

                    // Filters row (unchanged)
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

                    // Doctor List
                    Expanded(
                      child: ClipPath(
                        clipper: TopCurveClipper(),
                        child: Container(
                          color: Colors.transparent,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: GridView.builder(
                              padding: EdgeInsets.only(top: 45.h),
                              itemCount: filteredDoctors.length,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 15.w,
                                crossAxisSpacing: 15.h,
                                childAspectRatio: 0.65,
                              ),
                              itemBuilder: (context, index) {
                                return DoctorsTab(data: filteredDoctors[index]);
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
        error: (err, stack) => Center(child: Text("$err, $stack")),
        loading: () => Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/homebg.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Center(child: CircularProgressIndicator(color: Colors.white)),
        ),
      ),
    );
  }
}

class DoctorsTab extends StatefulWidget {
  final DoctorsListResponse data;
  const DoctorsTab({super.key, required this.data});

  @override
  State<DoctorsTab> createState() => _DoctorsTabState();
}

class _DoctorsTabState extends State<DoctorsTab> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(builder: (context) => DoctorDetailsPage(userID: widget.data.id.toString(), hasChange: false, bookingId: null,)),
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
            top: BorderSide(color: Colors.white, width: 1.w),
            right: BorderSide(color: Colors.white, width: 1.w),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           SizedBox(
                width: 170.w,
                height: 170.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: Image.network(
                    "http://sihahealth.globallywebsolutions.com"+widget.data.profilePicture.toString(),
                    fit: BoxFit.cover,
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
                    borderRadius: BorderRadius.circular(40.r),
                    color: Color.fromARGB(255, 38, 36, 37),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.star, color: Color(0xFFD8A200), size: 15.sp),
                      Text(
                        widget.data.rating.toStringAsFixed(2),
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
              //   if (index == 1 || index == 4)
              //     Container(
              //       margin: EdgeInsets.only(left: 6.w),
              //       padding: EdgeInsets.only(
              //         left: 5.w,
              //         right: 5.w,
              //         top: 5.h,
              //         bottom: 5.h,
              //       ),
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(
              //           40.r,
              //         ),
              //         color: Color.fromARGB(
              //           25,
              //           125,
              //           255,
              //           180,
              //         ),
              //       ),
              //       child: Row(
              //         children: [
              //           CircleAvatar(
              //             radius: 5.r,
              //             backgroundColor: Color(
              //               0xFF2ECC71,
              //             ),
              //           ),
              //           SizedBox(width: 5.w),
              //           Text(
              //             "Active",
              //             style: GoogleFonts.poppins(
              //               fontSize: 10.sp,
              //               fontWeight: FontWeight.w500,
              //               color: Color(0xFF2ECC71),
              //               letterSpacing: -0.3,
              //             ),
              //           ),
              //         ],
              //       ),
              //   //   ),
              // ],
              ]
            ),
            SizedBox(height: 7.h),
            SizedBox(
              width: 161.w,
              child: Text(
                overflow: TextOverflow.ellipsis,
                widget.data.fullName,
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
              widget.data.specialty,
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
  }
}



class TopCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // Start point bottom left
    path.moveTo(0, 50);

    // Top curve
    path.quadraticBezierTo(
      size.width / 2, 0, // control point
      size.width, 50,    // end point
    );

    // Rest rectangle
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}