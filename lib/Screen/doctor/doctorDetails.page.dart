import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shiha_health_app/Screen/doctor/controller/doctorDetails.controller.dart';

class DoctorDetailsPage extends ConsumerStatefulWidget {
  final String userID;
  final bool hasChange;
  final String? bookingId;
  const DoctorDetailsPage({
    super.key,
    required this.userID,
    required this.hasChange,
    required this.bookingId,
  });

  @override
  ConsumerState<DoctorDetailsPage> createState() => _DoctorDetailsPageState();
}

class _DoctorDetailsPageState extends ConsumerState<DoctorDetailsPage>
    with DoctorDetailsController<DoctorDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final currentMonthDates = getDatesInCurrentMonth();
    final monthName = DateFormat('MMMM').format(baseMonthDate);
    final doctorDetail = fetchData(id: widget.userID);
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              "assets/homebg.png",
              width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height,
              fit: BoxFit.fill,
            ),
            doctorDetail.when(
              data: (snap) {
                final availableSlots =
                    (jsonDecode(jsonEncode(snap.availableSlots))
                            as Map<String, dynamic>)
                        .map(
                          (key, value) =>
                              MapEntry(key, List<String>.from(value)),
                        );

                List<String> getTimeSlotsForSelectedDate() {
                  final dateKey = DateFormat('yyyy-MM-dd').format(selectedDate);
                  return availableSlots[dateKey] ?? [];
                }

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
                            "Doctor",
                            style: GoogleFonts.poppins(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          Spacer(),
                          // IconButton(
                          //   style: IconButton.styleFrom(
                          //     padding: EdgeInsets.zero,
                          //     minimumSize: Size(0, 0),
                          //     tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          //   ),
                          //   onPressed: () {},
                          //   icon: Icon(Icons.search, color: Colors.white),
                          // ),
                          SizedBox(width: 20.w),
                        ],
                      ),
                      SizedBox(height: 24.h),
                      Container(
                        margin: EdgeInsets.only(left: 20.w, right: 20.w),
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
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.r),
                              child: Image.network(
                                "${snap.profilePicture}",
                                width: 127.w,
                                height: 136.h,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.network(
                                    "https://static.vecteezy.com/system/resources/thumbnails/026/375/249/small_2x/ai-generative-portrait-of-confident-male-doctor-in-white-coat-and-stethoscope-standing-with-arms-crossed-and-looking-at-camera-photo.jpg",
                                    width: 127.w,
                                    height: 136.h,
                                    fit: BoxFit.cover,
                                  );
                                },
                              ),
                            ),
                            SizedBox(width: 15.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(
                                        left: 5.w,
                                        right: 7.w,
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
                                          SizedBox(width: 3.w),
                                          Text(
                                            "4.5/5",
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
                                    Container(
                                      margin: EdgeInsets.only(left: 8.w),
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
                                            backgroundColor: Color(0xFF2ECC71),
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
                                SizedBox(height: 10.h),
                                Text(
                                  overflow: TextOverflow.ellipsis,
                                  snap.fullName,
                                  style: GoogleFonts.poppins(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    letterSpacing: -0.4,
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                Text(
                                  snap.specialty,
                                  style: GoogleFonts.poppins(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFFB0BABF),
                                    letterSpacing: -0.4,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 5.h),
                                  width: 200.w,
                                  child: Divider(color: Colors.white12),
                                ),
                                // SizedBox(height: 20.h),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: snap.hospital == null
                                            ? " "
                                            : snap
                                                      .hospital
                                                      .consultationPriceRange +
                                                  " ",
                                        style: GoogleFonts.poppins(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF067594),
                                          letterSpacing: -0.3,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "Consultation Fees",
                                        style: GoogleFonts.poppins(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFFB0BABF),
                                          letterSpacing: -0.4,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 20.h,
                          left: 20.w,
                          right: 20.w,
                        ),
                        padding: EdgeInsets.only(
                          left: 25.w,
                          right: 25.w,
                          bottom: 15.h,
                          top: 15.h,
                        ),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 16, 31, 45),
                          borderRadius: BorderRadius.circular(10.r),
                          //border: Border.all(color: Colors.white, width: 0.85.w),
                          border: Border(
                            top: BorderSide(color: Colors.white, width: 0.85.w),
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
                                  "Total Patients ",
                                  style: GoogleFonts.poppins(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white70,
                                    letterSpacing: -0.3,
                                  ),
                                ),
                                SizedBox(height: 7.h),
                                Text(
                                  "450",
                                  style: GoogleFonts.poppins(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF067594),
                                    letterSpacing: 0.3,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Container(
                              height: 40.h,
                              width: 1.w,
                              color: Colors.white30,
                            ),
                            Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Total Experience ",
                                  style: GoogleFonts.poppins(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white70,
                                    letterSpacing: -0.3,
                                  ),
                                ),
                                SizedBox(height: 7.h),
                                Text(
                                  "${snap.experienceYears} Years",
                                  style: GoogleFonts.poppins(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF067594),
                                    letterSpacing: -0.3,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Container(
                              height: 40.h,
                              width: 1.w,
                              color: Colors.white30,
                            ),
                            Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Language",
                                  style: GoogleFonts.poppins(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white70,
                                    letterSpacing: -0.3,
                                  ),
                                ),
                                SizedBox(height: 7.h),
                                Text(
                                  "Somalian",
                                  style: GoogleFonts.poppins(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF067594),
                                    letterSpacing: -0.3,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 20.w,
                          right: 20.w,
                          top: 30.h,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "About ${snap.fullName}",
                              style: GoogleFonts.poppins(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                letterSpacing: -0.4,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              "Banadir General Hospital is a leading healthcare provider offering a range of services including pediatrics, surgery, and general medicine. Established in 1990, the hospital serves thousands of patients each year with a commitment to compassionate care.",
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
                        padding: EdgeInsets.only(left: 20.w),
                        child: Text(
                          "Available Slots",
                          style: GoogleFonts.poppins(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            letterSpacing: -0.4,
                          ),
                        ),
                      ),
                      // Container(
                      //   margin: EdgeInsets.only(
                      //     top: 15.h,
                      //     left: 20.w,
                      //     right: 20.w,
                      //   ),
                      //   padding: EdgeInsets.only(
                      //     left: 14.w,
                      //     right: 14.w,
                      //     top: 15.h,
                      //     bottom: 12.h,
                      //   ),
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(20.r),
                      //     color: Color.fromARGB(255, 5, 49, 75),
                      //     border: Border(
                      //       top: BorderSide(color: Colors.white, width: 0.85.w),
                      //       right: BorderSide(
                      //         color: Colors.white,
                      //         width: 0.85.w,
                      //       ),
                      //     ),
                      //   ),
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //         children: [
                      //           Text(
                      //             monthName,
                      //             style: GoogleFonts.poppins(
                      //               fontSize: 14.sp,
                      //               fontWeight: FontWeight.w500,
                      //               color: Colors.white,
                      //               letterSpacing: -0.2,
                      //             ),
                      //           ),
                      //           Row(
                      //             children: [
                      //               IconButton(
                      //                 style: IconButton.styleFrom(
                      //                   minimumSize: Size(0, 0),
                      //                   padding: EdgeInsets.zero,
                      //                   tapTargetSize:
                      //                       MaterialTapTargetSize.shrinkWrap,
                      //                 ),
                      //                 onPressed: () => changeMonth(-1),
                      //                 icon: const Icon(
                      //                   Icons.chevron_left,
                      //                   color: Colors.white,
                      //                 ),
                      //               ),
                      //               IconButton(
                      //                 style: IconButton.styleFrom(
                      //                   minimumSize: Size(0, 0),
                      //                   padding: EdgeInsets.zero,
                      //                   tapTargetSize:
                      //                       MaterialTapTargetSize.shrinkWrap,
                      //                 ),
                      //                 onPressed: () => changeMonth(1),
                      //                 icon: const Icon(
                      //                   Icons.chevron_right,
                      //                   color: Colors.white,
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //         ],
                      //       ),
                      //       SizedBox(height: 16.h),
                      //       // Horizontal date list
                      //       SizedBox(
                      //         height: 60.h,
                      //         child: ListView.builder(
                      //           scrollDirection: Axis.horizontal,
                      //           padding: EdgeInsets.zero,
                      //           itemCount: currentMonthDates.length,
                      //           itemBuilder: (context, index) {
                      //             final date = currentMonthDates[index];
                      //             final isSelected =
                      //                 DateFormat('yyyy-MM-dd').format(date) ==
                      //                 DateFormat(
                      //                   'yyyy-MM-dd',
                      //                 ).format(selectedDate);
                      //
                      //             return GestureDetector(
                      //               onTap: () {
                      //                 setState(() {
                      //                   selectedDate = date;
                      //                 });
                      //               },
                      //               child: Padding(
                      //                 padding: EdgeInsets.only(right: 20.w),
                      //                 child: Column(
                      //                   children: [
                      //                     Text(
                      //                       DateFormat('E')
                      //                           .format(date)
                      //                           .toUpperCase(), // MON, TUE...
                      //                       style: GoogleFonts.poppins(
                      //                         fontSize: 13.sp,
                      //                         fontWeight: FontWeight.w600,
                      //                         color: isSelected
                      //                             ? Color(0xFF067594)
                      //                             : Color(0xFFB0BABF),
                      //                       ),
                      //                     ),
                      //                     SizedBox(height: 8.h),
                      //                     Text(
                      //                       date.day.toString(),
                      //                       style: GoogleFonts.poppins(
                      //                         fontSize: 18.sp,
                      //                         fontWeight: FontWeight.w600,
                      //                         color: isSelected
                      //                             ? Color(0xFF067594)
                      //                             : Color(0xFFB0BABF),
                      //                       ),
                      //                     ),
                      //                   ],
                      //                 ),
                      //               ),
                      //             );
                      //           },
                      //         ),
                      //       ),
                      //       Divider(color: Colors.white30),
                      //       SizedBox(height: 15.h),
                      //       // Time slots
                      //       GridView.builder(
                      //         itemCount: getTimeSlotsForSelectedDate().length,
                      //         padding: EdgeInsets.zero,
                      //         shrinkWrap: true,
                      //         physics: NeverScrollableScrollPhysics(),
                      //         gridDelegate:
                      //             SliverGridDelegateWithFixedCrossAxisCount(
                      //               crossAxisCount: 6,
                      //               childAspectRatio: 1,
                      //               mainAxisSpacing: 9.h,
                      //               crossAxisSpacing: 8.w,
                      //             ),
                      //         itemBuilder: (context, index) {
                      //           final time =
                      //               getTimeSlotsForSelectedDate()[index];
                      //           final isSelected = selectedTime == time;
                      //           return Column(
                      //             children: [
                      //               GestureDetector(
                      //                 onTap: () {
                      //                   setState(() {
                      //                     selectedTime = time;
                      //                   });
                      //                 },
                      //                 child: Container(
                      //                   padding: EdgeInsets.symmetric(
                      //                     horizontal: 10.w,
                      //                     vertical: 8.h,
                      //                   ),
                      //                   decoration: BoxDecoration(
                      //                     color: isSelected
                      //                         ? Color(0xFF067594)
                      //                         : Color.fromARGB(
                      //                             20,
                      //                             255,
                      //                             255,
                      //                             255,
                      //                           ),
                      //                     borderRadius: BorderRadius.circular(
                      //                       15.r,
                      //                     ),
                      //                   ),
                      //                   alignment: Alignment.center,
                      //                   child: Text(
                      //                     time,
                      //                     textAlign: TextAlign.center,
                      //                     style: GoogleFonts.poppins(
                      //                       fontSize: 13.sp,
                      //                       fontWeight: FontWeight.w500,
                      //                       color: isSelected
                      //                           ? Colors.white
                      //                           : Color.fromARGB(
                      //                               153,
                      //                               255,
                      //                               255,
                      //                               255,
                      //                             ),
                      //                       letterSpacing: -0.3,
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ),
                      //             ],
                      //           );
                      //         },
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      SlotPicker(
                        availableSlots:
                            availableSlots, // from your API snap.availableSlots
                        initialDate: DateTime.now(),
                        onSlotSelected: (date, time) {
                          print("Selected Date: $date, Time: $time");
                          setState(() {
                            selectedDate = date;
                            selectedTime = time;
                          });
                        },
                      ),
                      SizedBox(height: 30.h),

                      // if (snap. != null) ...[
                      //   Row(
                      //     children: [
                      //       SizedBox(width: 22.w),
                      //       Text(
                      //         "Patient Reviews",
                      //         style: GoogleFonts.poppins(
                      //           fontSize: 15.sp,
                      //           fontWeight: FontWeight.w500,
                      //           color: Colors.white,
                      //         ),
                      //       ),
                      //       Spacer(),
                      //       Text(
                      //         "View All Reviews",
                      //         style: GoogleFonts.poppins(
                      //           fontSize: 14.sp,
                      //           fontWeight: FontWeight.w500,
                      //           color: Color(0xFF067594),
                      //         ),
                      //       ),
                      //       SizedBox(width: 21.w),
                      //     ],
                      //   ),
                      //   SizedBox(height: 12.h),
                      //   ListView.builder(
                      //     shrinkWrap: true,
                      //     physics: NeverScrollableScrollPhysics(),
                      //     padding: EdgeInsets.zero,
                      //     itemCount: 3,
                      //     itemBuilder: (context, index) {
                      //       return Container(
                      //         margin: EdgeInsets.only(
                      //           left: 20.w,
                      //           right: 20.w,
                      //           top: 10.h,
                      //         ),
                      //         padding: EdgeInsets.only(
                      //           left: 15.w,
                      //           right: 15.w,
                      //           bottom: 15.h,
                      //           top: 15.h,
                      //         ),
                      //         decoration: BoxDecoration(
                      //           color: Color(0xFF0A122A),
                      //           borderRadius: BorderRadius.circular(10.r),
                      //           border: Border(
                      //             top: BorderSide(
                      //               color: Colors.white,
                      //               width: 0.86.w,
                      //             ),
                      //             right: BorderSide(
                      //               color: Colors.white,
                      //               width: 0.86.w,
                      //             ),
                      //           ),
                      //         ),
                      //         child: Column(
                      //           crossAxisAlignment: CrossAxisAlignment.start,
                      //           children: [
                      //             Row(
                      //               children: [
                      //                 Icon(
                      //                   Icons.star,
                      //                   color: Color(0xFFD8A200),
                      //                 ),
                      //                 Icon(
                      //                   Icons.star,
                      //                   color: Color(0xFFD8A200),
                      //                 ),
                      //                 Icon(
                      //                   Icons.star,
                      //                   color: Color(0xFFD8A200),
                      //                 ),
                      //                 Icon(
                      //                   Icons.star,
                      //                   color: Color(0xFFD8A200),
                      //                 ),
                      //                 Icon(
                      //                   Icons.star,
                      //                   color: Color(0xFFD8A200),
                      //                 ),
                      //               ],
                      //             ),
                      //             SizedBox(height: 12.h),
                      //             Text(
                      //               "“Very clean facility and professional staff.”",
                      //               style: GoogleFonts.poppins(
                      //                 fontSize: 13.sp,
                      //                 fontWeight: FontWeight.w400,
                      //                 color: Color(0xFFB0BABF),
                      //                 fontStyle: FontStyle.italic,
                      //               ),
                      //             ),
                      //             Text(
                      //               "- Robert",
                      //               style: GoogleFonts.poppins(
                      //                 fontSize: 12.sp,
                      //                 fontWeight: FontWeight.w400,
                      //                 color: Color(0xFF0A74DA),
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       );
                      //     },
                      //   ),
                      // ],
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
                            if (widget.hasChange == false) {
                              bookAppoinment(
                                doctorId: snap.id,
                                hospitalId: snap.hospitalId,
                              );
                            } else {
                              updateBooking(
                                doctorId: snap.id,
                                hospitalId: snap.hospitalId,
                                bookingId: widget.bookingId ?? "",
                              );
                            }
                          },
                          child: isBTNLoding == false
                              ? Text(
                                  widget.hasChange == false
                                      ? "Book Appointment"
                                      : "Update Booking",
                                  style: GoogleFonts.poppins(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                )
                              : CircularProgressIndicator(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                );
              },
              error: (err, stack) {
                return Center(
                  child: Text(
                    "$err, $stack",
                    style: GoogleFonts.montserrat(color: Colors.white),
                  ),
                );
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
    );
  }
}

// import 'dart:convert';
// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';
// import 'package:shiha_health_app/Screen/doctor/controller/doctorDetails.controller.dart';

// class DoctorDetailsPage extends ConsumerStatefulWidget {
//   final String userID;
//   final bool hasChange;
//   final String? bookingId;
//   const DoctorDetailsPage({
//     super.key,
//     required this.userID,
//     required this.hasChange,
//     required this.bookingId,
//   });

//   @override
//   ConsumerState<DoctorDetailsPage> createState() => _DoctorDetailsPageState();
// }

// class _DoctorDetailsPageState extends ConsumerState<DoctorDetailsPage>
//     with DoctorDetailsController<DoctorDetailsPage> {

//   // Convert DateTime to API weekday key
//   String getWeekdayKey(DateTime date) {
//     switch (date.weekday) {
//       case DateTime.monday:
//         return "mon";
//       case DateTime.tuesday:
//         return "tue";
//       case DateTime.wednesday:
//         return "wed";
//       case DateTime.thursday:
//         return "thu";
//       case DateTime.friday:
//         return "fri";
//       case DateTime.saturday:
//         return "sat";
//       case DateTime.sunday:
//         return "sun";
//       default:
//         return "";
//     }
//   }

//   // Get slots for selected date
//   List<String> getTimeSlotsForSelectedDate(Map<String, List<String>> availableSlots) {
//     final key = getWeekdayKey(selectedDate);
//     return availableSlots[key] ?? [];
//   }

//   @override
//   Widget build(BuildContext context) {
//     final currentMonthDates = getDatesInCurrentMonth();
//     final monthName = DateFormat('MMMM').format(baseMonthDate);
//     final doctorDetail = fetchData(id: widget.userID);

//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Stack(
//           children: [
//             Image.asset(
//               "assets/homebg.png",
//               width: MediaQuery.of(context).size.width,
//               fit: BoxFit.fill,
//             ),
//             doctorDetail.when(
//               data: (snap) {
//                 final availableSlots = (jsonDecode(jsonEncode(snap.availableSlots))
//                         as Map<String, dynamic>)
//                     .map((key, value) => MapEntry(key, List<String>.from(value)));

//                 final slots = getTimeSlotsForSelectedDate(availableSlots);

//                 return Align(
//                   alignment: Alignment.topLeft,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(height: 30.h),
//                       Row(
//                         children: [
//                           SizedBox(width: 20.w),
//                           IconButton(
//                             style: IconButton.styleFrom(
//                               padding: EdgeInsets.zero,
//                               minimumSize: Size(0, 0),
//                               tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                             ),
//                             onPressed: () => Navigator.pop(context),
//                             icon: Icon(Icons.arrow_back_ios, color: Colors.white),
//                           ),
//                           SizedBox(width: 10.w),
//                           Text(
//                             "Doctor",
//                             style: GoogleFonts.poppins(
//                               fontSize: 18.sp,
//                               fontWeight: FontWeight.w500,
//                               color: Colors.white,
//                             ),
//                           ),
//                           Spacer(),
//                           SizedBox(width: 20.w),
//                         ],
//                       ),
//                       SizedBox(height: 24.h),
//                       // Doctor info card
//                       Container(
//                         margin: EdgeInsets.symmetric(horizontal: 20.w),
//                         padding: EdgeInsets.all(10.w),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20.r),
//                           color: Color(0xFF0E1329),
//                           border: Border(
//                             top: BorderSide(color: Colors.white, width: 1.w),
//                             right: BorderSide(color: Colors.white, width: 1.w),
//                           ),
//                         ),
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             ClipRRect(
//                               borderRadius: BorderRadius.circular(10.r),
//                               child: Image.network(
//                                 "${snap.profilePicture}",
//                                 width: 127.w,
//                                 height: 136.h,
//                                 fit: BoxFit.cover,
//                                 errorBuilder: (context, error, stackTrace) {
//                                   return Image.network(
//                                     "https://static.vecteezy.com/system/resources/thumbnails/026/375/249/small_2x/ai-generative-portrait-of-confident-male-doctor-in-white-coat-and-stethoscope-standing-with-arms-crossed-and-looking-at-camera-photo.jpg",
//                                     width: 127.w,
//                                     height: 136.h,
//                                     fit: BoxFit.cover,
//                                   );
//                                 },
//                               ),
//                             ),
//                             SizedBox(width: 15.w),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Row(
//                                   children: [
//                                     Container(
//                                       padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 5.h),
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(40.r),
//                                         color: Color.fromARGB(255, 38, 36, 37),
//                                       ),
//                                       child: Row(
//                                         children: [
//                                           Icon(Icons.star, color: Color(0xFFD8A200), size: 15.sp),
//                                           SizedBox(width: 3.w),
//                                           Text(
//                                             "4.5/5",
//                                             style: GoogleFonts.poppins(
//                                               fontSize: 12.sp,
//                                               fontWeight: FontWeight.w500,
//                                               color: Color(0xFFD8A200),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     Container(
//                                       margin: EdgeInsets.only(left: 8.w),
//                                       padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(40.r),
//                                         color: Color.fromARGB(25, 125, 255, 180),
//                                       ),
//                                       child: Row(
//                                         children: [
//                                           CircleAvatar(radius: 5.r, backgroundColor: Color(0xFF2ECC71)),
//                                           SizedBox(width: 5.w),
//                                           Text(
//                                             "Active",
//                                             style: GoogleFonts.poppins(
//                                               fontSize: 10.sp,
//                                               fontWeight: FontWeight.w500,
//                                               color: Color(0xFF2ECC71),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 SizedBox(height: 10.h),
//                                 Text(
//                                   snap.fullName,
//                                   overflow: TextOverflow.ellipsis,
//                                   style: GoogleFonts.poppins(
//                                     fontSize: 14.sp,
//                                     fontWeight: FontWeight.w500,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                                 SizedBox(height: 10.h),
//                                 Text(
//                                   snap.specialty,
//                                   style: GoogleFonts.poppins(
//                                     fontSize: 12.sp,
//                                     fontWeight: FontWeight.w500,
//                                     color: Color(0xFFB0BABF),
//                                   ),
//                                 ),
//                                 Container(
//                                   margin: EdgeInsets.only(top: 5.h),
//                                   width: 200.w,
//                                   child: Divider(color: Colors.white12),
//                                 ),
//                                 Text.rich(
//                                   TextSpan(
//                                     children: [
//                                       TextSpan(
//                                         text: snap.hospital?.consultationPriceRange ?? "",
//                                         style: GoogleFonts.poppins(
//                                           fontSize: 18.sp,
//                                           fontWeight: FontWeight.w500,
//                                           color: Color(0xFF067594),
//                                         ),
//                                       ),
//                                       TextSpan(
//                                         text: " Consultation Fees",
//                                         style: GoogleFonts.poppins(
//                                           fontSize: 12.sp,
//                                           fontWeight: FontWeight.w500,
//                                           color: Color(0xFFB0BABF),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(height: 20.h),
//                       // Date picker
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 20.w),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               monthName,
//                               style: GoogleFonts.poppins(
//                                 fontSize: 14.sp,
//                                 fontWeight: FontWeight.w500,
//                                 color: Colors.white,
//                               ),
//                             ),
//                             Row(
//                               children: [
//                                 IconButton(
//                                   style: IconButton.styleFrom(
//                                     minimumSize: Size(0, 0),
//                                     padding: EdgeInsets.zero,
//                                   ),
//                                   onPressed: () => changeMonth(-1),
//                                   icon: Icon(Icons.chevron_left, color: Colors.white),
//                                 ),
//                                 IconButton(
//                                   style: IconButton.styleFrom(
//                                     minimumSize: Size(0, 0),
//                                     padding: EdgeInsets.zero,
//                                   ),
//                                   onPressed: () => changeMonth(1),
//                                   icon: Icon(Icons.chevron_right, color: Colors.white),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: 60.h,
//                         child: ListView.builder(
//                           scrollDirection: Axis.horizontal,
//                           padding: EdgeInsets.zero,
//                           itemCount: currentMonthDates.length,
//                           itemBuilder: (context, index) {
//                             final date = currentMonthDates[index];
//                             final isSelected = DateFormat('yyyy-MM-dd').format(date) ==
//                                 DateFormat('yyyy-MM-dd').format(selectedDate);
//                             return GestureDetector(
//                               onTap: () {
//                                 setState(() {
//                                   selectedDate = date;
//                                   selectedTime = null;
//                                 });
//                               },
//                               child: Padding(
//                                 padding: EdgeInsets.only(right: 20.w),
//                                 child: Column(
//                                   children: [
//                                     Text(
//                                       DateFormat('E').format(date).toUpperCase(),
//                                       style: GoogleFonts.poppins(
//                                         fontSize: 13.sp,
//                                         fontWeight: FontWeight.w600,
//                                         color: isSelected ? Color(0xFF067594) : Color(0xFFB0BABF),
//                                       ),
//                                     ),
//                                     SizedBox(height: 8.h),
//                                     Text(
//                                       date.day.toString(),
//                                       style: GoogleFonts.poppins(
//                                         fontSize: 18.sp,
//                                         fontWeight: FontWeight.w600,
//                                         color: isSelected ? Color(0xFF067594) : Color(0xFFB0BABF),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                       Divider(color: Colors.white30),
//                       SizedBox(height: 15.h),
//                       // Time slots
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 20.w),
//                         child: GridView.builder(
//                           itemCount: slots.length,
//                           padding: EdgeInsets.zero,
//                           shrinkWrap: true,
//                           physics: NeverScrollableScrollPhysics(),
//                           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisCount: 6,
//                             childAspectRatio: 1,
//                             mainAxisSpacing: 9.h,
//                             crossAxisSpacing: 8.w,
//                           ),
//                           itemBuilder: (context, index) {
//                             final time = slots[index];
//                             final isSelected = selectedTime == time;
//                             return GestureDetector(
//                               onTap: () {
//                                 setState(() => selectedTime = time);
//                               },
//                               child: Container(
//                                 padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
//                                 decoration: BoxDecoration(
//                                   color: isSelected
//                                       ? Color(0xFF067594)
//                                       : Color.fromARGB(20, 255, 255, 255),
//                                   borderRadius: BorderRadius.circular(15.r),
//                                 ),
//                                 alignment: Alignment.center,
//                                 child: Text(
//                                   time,
//                                   textAlign: TextAlign.center,
//                                   style: GoogleFonts.poppins(
//                                     fontSize: 13.sp,
//                                     fontWeight: FontWeight.w500,
//                                     color: isSelected
//                                         ? Colors.white
//                                         : Color.fromARGB(153, 255, 255, 255),
//                                   ),
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                       SizedBox(height: 30.h),
//                       // Book / Update button
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 20.w),
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             minimumSize: Size(400.w, 55.h),
//                             backgroundColor: Color(0xFF067594),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10.r),
//                             ),
//                           ),
//                           onPressed: () {
//                             if (widget.hasChange == false) {
//                               bookAppoinment(
//                                 doctorId: snap.id,
//                                 hospitalId: snap.hospitalId,
//                               );
//                             } else {
//                               updateBooking(
//                                 doctorId: snap.id,
//                                 hospitalId: snap.hospitalId,
//                                 bookingId: widget.bookingId ?? "",
//                               );
//                             }
//                           },
//                           child: isBTNLoding == false
//                               ? Text(
//                                   widget.hasChange == false ? "Book Appointment" : "Update Booking",
//                                   style: GoogleFonts.poppins(
//                                     fontSize: 16.sp,
//                                     fontWeight: FontWeight.w500,
//                                     color: Colors.white,
//                                   ),
//                                 )
//                               : CircularProgressIndicator(color: Colors.white),
//                         ),
//                       ),
//                       SizedBox(height: 30.h),
//                     ],
//                   ),
//                 );
//               },
//               error: (err, stack) {
//                 return Center(
//                   child: Text(
//                     "$err, $stack",
//                     style: GoogleFonts.montserrat(color: Colors.white),
//                   ),
//                 );
//               },
//               loading: () => SizedBox(
//                 height: MediaQuery.of(context).size.height,
//                 width: MediaQuery.of(context).size.width,
//                 child: Center(child: CircularProgressIndicator(color: Colors.white)),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class SlotPicker extends StatefulWidget {
  final Map<String, List<String>> availableSlots;
  final DateTime initialDate;
  final Function(DateTime date, String? time) onSlotSelected;

  const SlotPicker({
    super.key,
    required this.availableSlots,
    required this.initialDate,
    required this.onSlotSelected,
  });

  @override
  State<SlotPicker> createState() => _SlotPickerState();
}

class _SlotPickerState extends State<SlotPicker> {
  late DateTime selectedDate;
  String? selectedTime;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.initialDate;
  }

  // Convert DateTime to weekday key like API
  String getWeekdayKey(DateTime date) {
    switch (date.weekday) {
      case DateTime.monday:
        return "mon";
      case DateTime.tuesday:
        return "tue";
      case DateTime.wednesday:
        return "wed";
      case DateTime.thursday:
        return "thu";
      case DateTime.friday:
        return "fri";
      case DateTime.saturday:
        return "sat";
      case DateTime.sunday:
        return "sun";
      default:
        return "";
    }
  }

  List<String> getTimeSlotsForSelectedDate() {
    final key = getWeekdayKey(selectedDate);
    return widget.availableSlots[key] ?? [];
  }

  List<DateTime> getDatesInMonth(DateTime base) {
    final firstDay = DateTime(base.year, base.month, 1);
    final nextMonth = DateTime(base.year, base.month + 1, 1);
    final daysInMonth = nextMonth.difference(firstDay).inDays;
    return List.generate(daysInMonth, (i) => firstDay.add(Duration(days: i)));
  }

  @override
  Widget build(BuildContext context) {
    final currentMonthDates = getDatesInMonth(selectedDate);
    final monthName = DateFormat('MMMM').format(selectedDate);

    final slots = getTimeSlotsForSelectedDate();

    return Container(
      margin: EdgeInsets.only(top: 15.h, left: 20.w, right: 20.w),
      padding: EdgeInsets.only(
        left: 14.w,
        right: 14.w,
        top: 15.h,
        bottom: 12.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: Color.fromARGB(255, 5, 49, 75),
        border: Border(
          top: BorderSide(color: Colors.white, width: 0.85.w),
          right: BorderSide(color: Colors.white, width: 0.85.w),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 0.w, right: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  monthName,
                  style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          SizedBox(
            height: 60.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.zero,
              itemCount: currentMonthDates.length,
              itemBuilder: (context, index) {
                final date = currentMonthDates[index];
                final isSelected =
                    DateFormat('yyyy-MM-dd').format(date) ==
                    DateFormat('yyyy-MM-dd').format(selectedDate);
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedDate = date;
                      selectedTime = null;
                    });
                    widget.onSlotSelected(selectedDate, selectedTime);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: 20.w),
                    child: Column(
                      children: [
                        Text(
                          DateFormat('E').format(date).toUpperCase(),
                          style: GoogleFonts.poppins(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600,
                            color: isSelected
                                ? Color(0xFF067594)
                                : Color(0xFFB0BABF),
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          date.day.toString(),
                          style: GoogleFonts.poppins(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: isSelected
                                ? Color(0xFF067594)
                                : Color(0xFFB0BABF),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Divider(color: Colors.white30),
          SizedBox(height: 15.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: GridView.builder(
              itemCount: slots.length,
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                childAspectRatio: 1,
                mainAxisSpacing: 9.h,
                crossAxisSpacing: 8.w,
              ),
              itemBuilder: (context, index) {
                final time = slots[index];
                final isSelected = selectedTime == time;
                return GestureDetector(
                  onTap: () {
                    setState(() => selectedTime = time);
                    widget.onSlotSelected(selectedDate, selectedTime);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 8.h,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Color(0xFF067594)
                          : Color.fromARGB(20, 255, 255, 255),
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      time,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        color: isSelected
                            ? Colors.white
                            : Color.fromARGB(153, 255, 255, 255),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
