import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

/// This page for all type of prorduction error
/// Just put in the error section of Async Value
///
///
/// Example
///
/// asyncValueProvider.when(
///   data: (snap){
///     return SizedBox();
///   },
///   loading: (_) => Center(child: CirculerprogresIndicator());
///
///   error: (stactTree, error){
///      return ErrorPaage();
///   }
/// )
///

class ErrorPage extends StatefulWidget {
  const ErrorPage({super.key});

  @override
  State<ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/homebg.png",
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Opps!",
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  "Server error occurred. Please try again later.",
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w300,
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
