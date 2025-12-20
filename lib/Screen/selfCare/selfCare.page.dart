import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shiha_health_app/Screen/selfCare/controller/selfCare.controller.dart';
import 'package:shiha_health_app/Screen/selfCare/selfCareDetails.page.dart';
import 'package:shiha_health_app/data/controller/reminderController.dart';
import 'package:shiha_health_app/data/controller/userDetails.provider.dart';
import 'package:shiha_health_app/data/db/userData.dart';

class SelfCarePage extends ConsumerStatefulWidget {
  const SelfCarePage({super.key});

  @override
  ConsumerState<SelfCarePage> createState() => _SelfCarePageState();
}

class _SelfCarePageState extends ConsumerState<SelfCarePage>
    with SelfCarecontroller<SelfCarePage> {
  int tab = 0;

  List<Map<String, dynamic>> hospitalList = [
    {
      "image": "assets/self3.png",
      "name":
          "A balanced diet is essential for maintaining energy levels and overall health.",
    },
    {
      "image": "assets/self2.png",
      "name":
          "A balanced diet is essential for maintaining energy levels and overall health.",
    },
    {
      "image": "assets/self6.png",
      "name":
          "Regular exercise not only improves physical fitness but also boosts mental well-being.",
    },
    {
      "image": "assets/self4.png",
      "name":
          "Getting enough sleep is crucial for cognitive function and mood regulation.",
    },
    {
      "image": "assets/self5.png",
      "name":
          "Practicing mindfulness can significantly reduce stress and enhance emotional health.",
    },
    {
      "image": "assets/self6.png",
      "name":
          "Limiting screen time promotes better eye health and encourages outdoor activity.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final selfCareData = fetchInit();
    return Scaffold(
      body: Stack(
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
                    // IconButton(
                    //   style: IconButton.styleFrom(
                    //     padding: EdgeInsets.zero,
                    //     minimumSize: const Size(0, 0),
                    //     tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    //   ),
                    //   onPressed: () {
                    //     Navigator.pop(context);
                    //   },
                    //   icon: const Icon(
                    //     Icons.arrow_back_ios,
                    //     color: Colors.white,
                    //   ),
                    // ),
                    SizedBox(width: 10.w),
                    Text(
                      "Self Care",
                      style: GoogleFonts.poppins(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      style: IconButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(0, 0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: () {},
                      icon: const Icon(Icons.search, color: Colors.white),
                    ),
                    SizedBox(width: 20.w),
                  ],
                ),
                SizedBox(height: 20.h),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  height: 45.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border(
                      top: BorderSide(color: Colors.white, width: 1.w),
                      right: BorderSide(color: Colors.white, width: 1.w),
                    ),
                    color: const Color(0xFF0A4D80),
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
                          child: MyWidget(
                            name: 'Tips',
                            bgColor: tab == 0
                                ? const Color(0xFF067594)
                                : const Color(0x66067594),
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
                            name: 'Reminder',
                            bgColor: tab == 1
                                ? const Color(0xFF067594)
                                : const Color(0x66067594),
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
                            name: 'Self Care',
                            bgColor: tab == 2
                                ? const Color(0xFF067594)
                                : const Color(0x66067594),
                            borderColor: tab == 2
                                ? Colors.white
                                : Colors.transparent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Expanded(
                  child: tab == 0
                      ? selfCareData.when(
                          data: (snap) {
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: GridView.builder(
                                padding: EdgeInsets.zero,
                                itemCount: snap.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 15.w,
                                      crossAxisSpacing: 15.h,
                                      childAspectRatio: 0.75,
                                    ),
                                itemBuilder: (context, index) {
                                  final item = snap[index];
                                  return Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Stack(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                // Navigator.push(
                                                //   context,
                                                //   CupertinoPageRoute(
                                                //     builder: (context) =>
                                                //         SelfCareDetailsPage(
                                                //           id: snap[index].id.toString()
                                                //         ),
                                                //   ),
                                                // );
                                              },
                                              child: SizedBox(
                                                width: double.infinity,
                                                height: 120.h,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        10.r,
                                                      ),
                                                  child: Image.asset(
                                                    hospitalList[0]['image']
                                                        .toString(),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned.fill(
                                              child: Icon(
                                                Icons.play_circle_fill_outlined,
                                                size: 40.sp,
                                                color: const Color(0xFF2ECC71),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10.h),
                                        Expanded(
                                          child: Text(
                                            item.description,
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.poppins(
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xFFB0BABF),
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
                          error: (err, stack) {
                            return Center(
                              child: Text(
                                "$err, $stack",
                                style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                ),
                              ),
                            );
                          },
                          loading: () => Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        )
                      : tab == 1
                      ? const RemindScreen()
                      : const SelfScreen(),
                ),
              ],
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
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: borderColor, width: 1.w),
      ),
      child: Text(
        name,
        style: GoogleFonts.poppins(fontSize: 12.sp, color: Colors.white),
      ),
    );
  }
}

//////////////

class RemindScreen extends ConsumerStatefulWidget {
  const RemindScreen({super.key});

  @override
  ConsumerState<RemindScreen> createState() => _RemindScreenState();
}

class _RemindScreenState extends ConsumerState<RemindScreen> {
  String formatTime(String time24) {
    final parts = time24.split(":");
    int hour = int.parse(parts[0]);
    int minute = int.parse(parts[1]);

    final date = DateTime(2025, 1, 1, hour, minute);
    return DateFormat('hh:mm a').format(date); // => 06:00 PM
  }

  @override
  Widget build(BuildContext context) {
    final reminderProvider = ref.watch(reminderController);
    return reminderProvider.when(
      data: (data) {
        return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: data.length,
          itemBuilder: (context, index) {
            final item = data[index];
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF0E1329),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  // CHECKBOX
                  Container(
                    height: 22.h,
                    width: 22.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.white, width: 1.2),
                      color: item.completed == 1
                          ? Colors.blue
                          : Colors.transparent,
                    ),
                    child: item.completed == 1
                        ? Icon(Icons.check, size: 16, color: Colors.white)
                        : null,
                  ),

                  SizedBox(width: 12),

                  // TITLE
                  Expanded(
                    child: Text(
                      item.title ?? "N/A",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 16.sp,
                        decoration: item.completed == 1
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                  ),

                  // TIME
                  Row(
                    children: [
                      Icon(Icons.access_time, color: Colors.white70, size: 18),
                      SizedBox(width: 4),
                      Text(
                        formatTime(item.time.toString()),
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
      error: (error, stackTrace) {
        return Center(
          child: Text(
            error.toString(),
            style: GoogleFonts.poppins(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        );
      },
      loading: () =>
          Center(child: CircularProgressIndicator(color: Colors.white)),
    );
  }
}

//////////////

class SelfScreen extends ConsumerStatefulWidget {
  const SelfScreen({super.key});

  @override
  ConsumerState<SelfScreen> createState() => _SelfScreenState();
}

class _SelfScreenState extends ConsumerState<SelfScreen> {
  List<Map<String, dynamic>> careList = [
    {"name": "Heart Rate", "re": "80", "image": "assets/rate.png", "b": "bpm"},
    {
      "name": "Blood Pressure",
      "re": "120",
      "image": "assets/pressure.png",
      "b": "bpm",
    },
    {"name": "Your Weight", "re": "70", "image": "assets/rate.png", "b": "Kg"},
    {
      "name": "Last Checkup",
      "re": "2 ",
      "image": "assets/rate.png",
      "b": "Weeks ago",
    },
    {
      "name": "Paracetamol",
      "re": "2 ",
      "image": "assets/rate.png",
      "b": "taken out of 7",
    },
  ];
  @override
  Widget build(BuildContext context) {
    final rawData = HiveService().getData<Map<dynamic, dynamic>>(
      key: "user",
      boxName: HiveBoxes.userData,
    );
    final userDetails = ref.watch(userDetailProvider(rawData!['user']['id']));
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: GridView.builder(
        // shrinkWrap: true,
        // physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: careList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 15.h,
          crossAxisSpacing: 15.w,
          childAspectRatio: 0.9,
        ),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: const Color(0xFF0E1329),
              border: const Border(
                top: BorderSide(color: Colors.white),
                right: BorderSide(color: Colors.white),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 18.w, right: 18.w, top: 15.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          careList[index]['name'].toString(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Image.asset(
                        "assets/heart.png",
                        width: 24.w,
                        height: 24.h,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 18.w),
                          child: Text(
                            careList[index]['re'].toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                              fontSize: 36.sp,
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                              height: 1,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 18.w),
                          child: Text(
                            careList[index]['b'].toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w300,
                              color: const Color(0xFFA5A7A8),
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (index == 0 || index == 1)
                      Padding(
                        padding: EdgeInsets.only(right: 18.w),
                        child: Image.asset(
                          careList[index]['image'].toString(),
                          width: 60.w,
                          height: 70.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                  ],
                ),
                SizedBox(height: 10.h),
              ],
            ),
          );
        },
      ),
    );
  }
}
