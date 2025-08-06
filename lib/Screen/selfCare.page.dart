import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shiha_health_app/Screen/home.page.dart';

class SelfCarePage extends StatefulWidget {
  const SelfCarePage({super.key});

  @override
  State<SelfCarePage> createState() => _SelfCarePageState();
}

class _SelfCarePageState extends State<SelfCarePage> {
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
                      "Self Care",
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
                            name: 'Tips',
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
                            name: 'Reminder',
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
                            name: 'Self Care',
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
                SizedBox(height: 20.h),
                tab == 0
                    ? Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 20.w, right: 20.w),
                          child: GridView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: hospitalList.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 15.w,
                                  crossAxisSpacing: 15.h,
                                  //childAspectRatio: 0.90,
                                ),
                            itemBuilder: (context, index) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: SizedBox(
                                          width: 190.w,
                                          height: 130.h,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              10.r,
                                            ),
                                            child: Image.asset(
                                              hospitalList[index]['image']
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
                                          color: Color(0xFF2ECC71),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 15.h),
                                  Text(
                                    hospitalList[index]['name'].toString(),
                                    style: GoogleFonts.poppins(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFFB0BABF),
                                      letterSpacing: -0.3,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      )
                    : RemindScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RemindScreen extends StatefulWidget {
  const RemindScreen({super.key});

  @override
  State<RemindScreen> createState() => _RemindScreenState();
}

class _RemindScreenState extends State<RemindScreen> {
  bool isCheck = false;

  List<Map<String, dynamic>> reminders = [
    {'label': 'Drink Water', 'time': '10:00 PM', 'isChecked': true},
    {
      'label': 'Take Blood Pressure Medication',
      'time': '10:00 PM',
      'isChecked': true,
    },
    {
      'label': 'Perform Breathing Exercises',
      'time': '10:00 PM',
      'isChecked': true,
    },
    {'label': 'Log Daily Steps', 'time': '10:00 PM', 'isChecked': false},
    {'label': 'Prepare Healthy Snack', 'time': '10:15 PM', 'isChecked': false},
    {
      'label': 'Check Blood Sugar Levels',
      'time': '10:30 PM',
      'isChecked': false,
    },
    {
      'label': 'Schedule Doctor\'s Appointment',
      'time': '10:45 PM',
      'isChecked': false,
    },
    {'label': 'Read Health Article', 'time': '11:00 PM', 'isChecked': false},
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Your Reminders",
                style: GoogleFonts.poppins(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  letterSpacing: -0.3,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(86.w, 28.h),
                  backgroundColor: Color(0xFF2ECC71),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "Add New",
                  style: GoogleFonts.poppins(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF010D16),
                    letterSpacing: -0.3,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Container(
            padding: EdgeInsets.only(
              left: 15.w,
              top: 15.h,
              right: 15.w,
              bottom: 15.h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Color(0xFF081028),
              border: Border(
                top: BorderSide(color: Colors.white, width: 1.w),
                right: BorderSide(color: Colors.white, width: 1.w),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 20.w,
                      height: 20.h,
                      child: Transform.scale(
                        scale: 1,
                        child: Checkbox(
                          side: BorderSide(
                            color: Color(0xFF76BDFF),
                            width: 1.w,
                          ),
                          value: isCheck,
                          onChanged: (value) {
                            setState(() {
                              isCheck = !isCheck;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      "Took Paracetamol Today",
                      style: GoogleFonts.poppins(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFB0BABF),
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.access_alarm,
                      color: Color(0xFF067594),
                      size: 20.sp,
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      "09:00 PM",
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF067594),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 13.h),
                Container(
                  // width: 370.w,
                  // height: 56.h,
                  padding: EdgeInsets.only(
                    left: 15.w,
                    right: 15.w,
                    bottom: 12.h,
                    top: 12.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Color(0xFF091A34),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Taken : 6",
                            style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF067594),
                            ),
                          ),
                          Text(
                            "Goal : 7",
                            style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF067594),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 13.h),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 5.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.r),
                          color: Color(0xFF09233E),
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: 263.w,
                            height: 5.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.r),
                              color: Color(0xFF067594),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: reminders.length,
            itemBuilder: (context, index) {
              final item = reminders[index];
              return Container(
                margin: EdgeInsets.only(top: 10.h),
                padding: EdgeInsets.only(
                  left: 15.w,
                  top: 15.h,
                  right: 15.w,
                  bottom: 15.h,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Color(0xFF081028),
                  border: Border(
                    top: BorderSide(color: Colors.white, width: 1.w),
                    right: BorderSide(color: Colors.white, width: 1.w),
                  ),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 20.w,
                      height: 20.h,
                      child: Transform.scale(
                        scale: 1,
                        child: Checkbox(
                          value: item['isChecked'],
                          onChanged: (val) {
                            setState(() {
                              reminders[index]['isChecked'] = val!;
                            });
                          },
                          side: BorderSide(
                            color: Color(0xFF76BDFF),
                            width: 1.w,
                          ),
                          activeColor: Color(0xFF067594),
                          checkColor: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      item['label'],
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFB0BABF),
                        decoration: item['isChecked']
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        decorationThickness: 1.2,
                        decorationColor: Colors.white,
                      ),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Icon(
                          Icons.alarm,
                          color: Color(0xFF067594),
                          size: 20.sp,
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          item['time'],
                          style: GoogleFonts.poppins(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF067594),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
