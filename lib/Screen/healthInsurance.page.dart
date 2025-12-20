import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shiha_health_app/Screen/homepage/home.page.dart';
import 'package:shiha_health_app/Screen/widgets/errorShowFLushBar.dart';
import 'package:shiha_health_app/config/network/api.state.dart';
import 'package:shiha_health_app/config/utils/pretty.dio.dart';
import 'package:shiha_health_app/data/controller/insurancePlanController.dart';
import 'package:shiha_health_app/data/db/userData.dart';
import 'package:shiha_health_app/data/model/insurancePlanResModel.dart';
import 'package:shiha_health_app/data/model/userPurchasePlanBodyModel.dart';

class HealthInsurancePage extends ConsumerStatefulWidget {
  const HealthInsurancePage({super.key});

  @override
  ConsumerState<HealthInsurancePage> createState() =>
      _HealthInsurancePageState();
}

class _HealthInsurancePageState extends ConsumerState<HealthInsurancePage> {
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
  bool isLoading = false;
  bool isShow = false;
  final searchControlelr = TextEditingController();
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final insurancePlanData = ref.watch(insurancePlanController);
    final userInsuranceData = ref.watch(userInsuranceController);
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
            child: insurancePlanData.when(
              data: (data) {
                return Column(
                  children: [
                    SizedBox(height: 20.h),
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
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              : Text(
                                  "Health Insurance",
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
                    SizedBox(height: 15.h),
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
                    // Expanded(
                    //   child: ListView.builder(
                    //     padding: EdgeInsets.zero,
                    //     itemCount: data.length,
                    //     itemBuilder: (context, index) {
                    //       return Container(
                    //         margin: EdgeInsets.only(
                    //           left: 20.w,
                    //           right: 20.w,
                    //           top: 10.h,
                    //         ),
                    //         padding: EdgeInsets.only(
                    //           left: 12.w,
                    //           right: 12.w,
                    //           top: 12.h,
                    //           bottom: 12.h,
                    //         ),
                    //         decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(20.r),
                    //           color: Color(0xFF0E1329),
                    //           border: Border.all(
                    //             color: Colors.white,
                    //             width: 1.w,
                    //           ),
                    //         ),
                    //         child: Column(
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //             ClipRRect(
                    //               borderRadius: BorderRadius.circular(10.r),
                    //               child: Image.asset(
                    //                 "assets/he1.png",
                    //                 width: 376.w,
                    //                 height: 158.h,
                    //                 fit: BoxFit.cover,
                    //               ),
                    //             ),
                    //             SizedBox(height: 12.h),
                    //             Row(
                    //               children: [
                    //                 Container(
                    //                   width: 52.w,
                    //                   height: 52.h,
                    //                   decoration: BoxDecoration(
                    //                     shape: BoxShape.circle,
                    //                     color: Color.fromARGB(255, 13, 29, 52),
                    //                   ),
                    //                   child: Center(
                    //                     child: Icon(
                    //                       Icons.calendar_today_outlined,
                    //                       size: 20.sp,
                    //                       color: Color(0xFF067594),
                    //                     ),
                    //                   ),
                    //                 ),
                    //                 SizedBox(width: 10.w),
                    //                 Column(
                    //                   crossAxisAlignment:
                    //                       CrossAxisAlignment.start,
                    //                   children: [
                    //                     Text(
                    //                       // healthList[index]['name'].toString(),
                    //                       data[index].name,
                    //                       style: GoogleFonts.poppins(
                    //                         fontSize: 14.sp,
                    //                         fontWeight: FontWeight.w500,
                    //                         color: Colors.white,
                    //                         letterSpacing: -1,
                    //                       ),
                    //                     ),
                    //                     Text(
                    //                       // healthList[index]['month'].toString(),
                    //                       // "month": "\$10/month",
                    //                       "₹${data[index].deductibleAmount ?? 0}/month",
                    //                       style: GoogleFonts.poppins(
                    //                         fontSize: 12.sp,
                    //                         fontWeight: FontWeight.w500,
                    //                         color: Color(0xFF067594),
                    //                       ),
                    //                     ),
                    //                   ],
                    //                 ),
                    //               ],
                    //             ),
                    //             SizedBox(width: 12.w),
                    //             Text(
                    //               //healthList[index]['desc'].toString(),
                    //               data[index].description ?? "No discription",
                    //               style: GoogleFonts.poppins(
                    //                 fontSize: 13.sp,
                    //                 fontWeight: FontWeight.w500,
                    //                 color: Color.fromARGB(153, 240, 243, 245),
                    //                 letterSpacing: -1,
                    //               ),
                    //             ),
                    //             SizedBox(height: 20.w),
                    //             Container(
                    //               width: 400.w,
                    //               height: 50.h,
                    //               decoration: BoxDecoration(
                    //                 borderRadius: BorderRadius.circular(10.r),
                    //                 color: Color(0xFF067594),
                    //                 border: Border(
                    //                   top: BorderSide(
                    //                     color: Colors.white,
                    //                     width: 0.85,
                    //                   ),
                    //                 ),
                    //               ),
                    //               child: Center(
                    //                 child: Text(
                    //                   "Register",
                    //                   style: GoogleFonts.poppins(
                    //                     fontSize: 16.sp,
                    //                     fontWeight: FontWeight.w500,
                    //                     color: Colors.white,
                    //                   ),
                    //                 ),
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       );
                    //     },
                    //   ),
                    // ),
                    SizedBox(height: 10.h),
                    Expanded(
                      child: () {
                        if (tab == 0) {
                          return insurancePlanData.when(
                            data: (data) {
                              final queryTxt = searchControlelr.text.trim();
                              final filterData = data.where((q) {
                                final name = q.name.toLowerCase();
                                return name.contains(queryTxt);
                              }).toList();

                              if (filterData.isEmpty) {
                                return Center(
                                  child: Text(
                                    "No Insurance Plans Available",
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              }
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                itemCount: filterData.length,
                                itemBuilder: (context, index) {
                                  return AllInsuranceCard(
                                    data: filterData[index],
                                  );
                                },
                              );
                            },
                            loading: () => Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ),
                            error: (e, _) => Center(
                              child: Text(
                                "Error: $e",
                                style: GoogleFonts.poppins(color: Colors.white),
                              ),
                            ),
                          );
                        }
                        // TAB 1 ---------------- Your Insurance -----------------
                        else if (tab == 1) {
                          return userInsuranceData.when(
                            data: (data) {
                              if (data.isEmpty) {
                                return Center(
                                  child: Text(
                                    "No Insurance Registered",
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              }
                              return RefreshIndicator(
                                backgroundColor: Color(0xFF01061D),
                                color: Colors.white,
                                onRefresh: () async {
                                  await ref.refresh(userInsuranceController);
                                },
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  itemCount: data.length,
                                  itemBuilder: (context, index) {
                                    String formattedStart =
                                        data[index].startDate
                                            ?.toString()
                                            .split(" ")
                                            .first ??
                                        "";
                                    String formattedEnd =
                                        data[index].endDate
                                            ?.toString()
                                            .split(" ")
                                            .first ??
                                        "";
                                    return userInsuranceCard(
                                      name: data[index].plan!.name ?? "",
                                      desc:
                                          data[index].plan?.description ??
                                          "No description",
                                      amount:
                                          data[index].plan?.deductibleAmount ??
                                          0,

                                      status: data[index].status ?? "N/A",

                                      startDate: formattedStart,
                                      endDate: formattedEnd,
                                      provider:
                                          data[index].plan?.providerName ?? "",
                                      planType:
                                          data[index].plan?.planType ?? "",
                                    );
                                  },
                                ),
                              );
                            },
                            loading: () => Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ),
                            error: (e, _) => Center(
                              child: Text(
                                "Error: $e",
                                style: GoogleFonts.poppins(color: Colors.white),
                              ),
                            ),
                          );
                        }
                        // TAB 2 ---------------- Support -----------------
                        else {
                          return Center(
                            child: Text(
                              "Support Coming Soon...",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          );
                        }
                      }(),
                    ),
                  ],
                );
              },
              error: (error, stackTrace) {
                log(stackTrace.toString());
                return Center(
                  child: Text(
                    error.toString(),
                    style: GoogleFonts.poppins(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                );
              },
              loading: () =>
                  Center(child: CircularProgressIndicator(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  Widget userInsuranceCard({
    required String name,
    required String desc,
    required dynamic amount,
    required String status,
    required String startDate,
    required String endDate,
    required String provider,
    required String planType,
  }) {
    return Container(
      margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xFF0E1329),
        border: Border.all(color: Colors.white),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              "assets/he1.png",
              height: 158.h,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 12),
          Text(
            name,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          Text(
            "Provider: $provider",
            style: TextStyle(color: Colors.white70, fontSize: 13),
          ),

          // PLAN TYPE
          Text(
            "Type: $planType",
            style: TextStyle(color: Colors.white70, fontSize: 13),
          ),

          SizedBox(height: 5),
          Text(
            "₹$amount/month",
            style: GoogleFonts.poppins(
              color: Color(0xFF067594),
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
          // STATUS
          Text(
            "Status: $status",
            style: TextStyle(
              color: status == "active" ? Colors.greenAccent : Colors.redAccent,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),

          SizedBox(height: 5),
          Text(
            "Valid: $startDate → $endDate",
            style: TextStyle(color: Colors.white70, fontSize: 13),
          ),
          SizedBox(height: 8.h),
          Text(
            desc,
            style: GoogleFonts.poppins(color: Colors.white70, fontSize: 15.sp),
          ),
          SizedBox(height: 15.h),
        ],
      ),
    );
  }
}

class AllInsuranceCard extends ConsumerStatefulWidget {
  final InsurancePlanResModel data;
  const AllInsuranceCard({super.key, required this.data});

  @override
  ConsumerState<AllInsuranceCard> createState() => _AllInsuranceCardState();
}

class _AllInsuranceCardState extends ConsumerState<AllInsuranceCard> {
  bool isLoading = false;
  bool isShow = false;
  final searchControlelr = TextEditingController();
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xFF0E1329),
        border: Border.all(color: Colors.white),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              "assets/he1.png",
              height: 158.h,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 12),
          Text(
            widget.data.name,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          Text(
            "Provider: ${widget.data.providerName}",
            style: TextStyle(color: Colors.white70, fontSize: 13),
          ),

          // PLAN TYPE
          Text(
            "Type: ${widget.data.planType}",
            style: TextStyle(color: Colors.white70, fontSize: 13),
          ),

          SizedBox(height: 5),
          Text(
            "₹${widget.data.deductibleAmount ?? 0}/month",
            style: GoogleFonts.poppins(
              color: Color(0xFF067594),
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            widget.data.description ?? "No Description",
            style: GoogleFonts.poppins(color: Colors.white70, fontSize: 15.sp),
          ),
          SizedBox(height: 15.h),
          InkWell(
            onTap: isLoading
                ? null
                : () async {
                    final rawData = HiveService()
                        .getData<Map<dynamic, dynamic>>(
                          key: "user",
                          boxName: HiveBoxes.userData,
                        );

                    final endDate = DateTime(
                      DateTime.now().year + 1,
                      DateTime.now().month,
                      DateTime.now().day,
                    );
                    setState(() {
                      isLoading = true;
                    });
                    try {
                      final body = UserPurchasePlanBodyModel(
                        userId: rawData!['user']['id'],
                        planId: widget.data.id,
                        status: widget.data.status,
                        startDate: DateTime.now(),
                        endDate: endDate,
                      );
                      final service = APIStateNetwork(createDio());
                      final response = await service.userPurchasePlan(body);
                      if (response != null) {
                        ref.invalidate(userInsuranceController);
                        showSuccessMessage(context, "Register sucess");
                        setState(() {
                          isLoading = false;
                        });
                      } else {
                        showErrorMessage(
                          response.response.data['message'] ?? "Error",
                        );
                      }
                    } catch (e) {
                      setState(() {
                        isLoading = false;
                      });
                      log(e.toString());
                      showErrorMessage("API Error : $e");
                    } finally {
                      setState(() {
                        isLoading = false;
                      });
                    }
                  },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Color(0xFF067594),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: isLoading
                    ? SizedBox(
                        height: 22,
                        width: 22,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : Text(
                        "Register",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 16.sp,
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
