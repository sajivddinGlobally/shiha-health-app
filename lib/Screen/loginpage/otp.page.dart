import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_pin_field/otp_pin_field.dart';
import 'package:shiha_health_app/Screen/loginpage/controller/otp.controller.dart';

class OtpPage extends StatefulWidget {
  final String phone;
  const OtpPage({super.key, required this.phone});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> with OtpController<OtpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Image.asset(
                "assets/si.png",
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.fill,
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    SizedBox(height: 50.h),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Siha",
                            style: GoogleFonts.poppins(
                              fontSize: 40.sp,
                              fontWeight: FontWeight.w300,
                              color: Color(0xFFFFFFFF),
                              letterSpacing: -1,
                            ),
                          ),
                          TextSpan(
                            text: "Health",
                            style: GoogleFonts.poppins(
                              fontSize: 40.sp,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFFFFFFF),
                              letterSpacing: -1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40.h),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      child: Text(
                        "POWER UP YOUR HEALTH JOURNEY",
                        style: GoogleFonts.poppins(
                          fontSize: 32.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFFFFFFF),
                          letterSpacing: -1,
                          height: 1,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Center(
                      child: Text(
                        "Enter your details to get started with us",
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 500.h),
                width: double.infinity,
                //height: 500.h,
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/bottom.png",
                      width: MediaQuery.of(context).size.width,
                      // height: 460.h,
                      fit: BoxFit.fill,
                      alignment: Alignment.bottomCenter,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 70.h),
                          Text(
                            "Enter OTP",
                            style: GoogleFonts.poppins(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              letterSpacing: -1,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            "We sent a 6-digit code to ${widget.phone}",
                            style: GoogleFonts.poppins(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.white60,
                              letterSpacing: -0.4,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Divider(color: Colors.white24, height: 1.h),
                          SizedBox(height: 20.h),
                          OtpPinField(
                            fieldHeight: 55.h,
                            fieldWidth: 55.w,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            otpPinFieldDecoration:
                                OtpPinFieldDecoration.defaultPinBoxDecoration,
                            otpPinFieldStyle: OtpPinFieldStyle(
                              fieldBorderWidth: 0,
                              defaultFieldBorderColor: Colors.grey,
                              activeFieldBorderColor: Colors.blue,
                              defaultFieldBackgroundColor:
                                  Colors.white, // Background white
                              activeFieldBackgroundColor: Colors.white,
                            ),
                            maxLength: 6,
                            onSubmit: (text) async {
                              await verifyOtp(number: widget.phone);
                            },
                            onChange: (text) {
                              setOtpCode(text);
                            },
                          ),
                          SizedBox(height: 30.h),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(400.w, 55.h),
                              backgroundColor: Color(0xFF067594),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ),
                            onPressed: () async =>
                                await verifyOtp(number: widget.phone),
                            child: isLoading == false
                                ? Text(
                                    "Verify OTP",
                                    style: GoogleFonts.poppins(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFFFFFFFF),
                                    ),
                                  )
                                : Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  ),
                          ),
                          SizedBox(height: 20.h),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "Didn’t receive OTP? ",
                                  style: GoogleFonts.poppins(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF717F8D),
                                    letterSpacing: -1,
                                  ),
                                ),
                                TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () async {
                                      await resendOtp(
                                        phoneNumber: widget.phone,
                                      );
                                    },
                                  text: "Resend",
                                  style: GoogleFonts.poppins(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF2998FF),
                                    letterSpacing: -1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'dart:math';
// import 'dart:ui';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:otp_pin_field/otp_pin_field.dart';
// import 'package:shiha_health_app/Screen/loginpage/controller/otp.controller.dart';

// class OtpPage extends StatefulWidget {
//   final String phone;
//   const OtpPage({super.key, required this.phone});

//   @override
//   State<OtpPage> createState() => _OtpPageState();
// }

// class _OtpPageState extends State<OtpPage>
//     with OtpController<OtpPage>, TickerProviderStateMixin {
//   // ─── Controllers ───────────────────────────────────────────────
//   late AnimationController _bgController;
//   late AnimationController _headerController;
//   late AnimationController _cardController;
//   late AnimationController _otpController;
//   late AnimationController _particleController;
//   late AnimationController _pulseController;
//   late AnimationController _shimmerController;

//   // ─── Animations ────────────────────────────────────────────────
//   late Animation<double> _bgFade;
//   late Animation<double> _headerFade;
//   late Animation<Offset> _headerSlide;
//   late Animation<double> _cardSlide;
//   late Animation<double> _cardFade;
//   late Animation<double> _otpFade;
//   late Animation<double> _otpScale;
//   late Animation<double> _pulse;
//   late Animation<double> _shimmer;

//   bool _buttonPressed = false;

//   @override
//   void initState() {
//     super.initState();
//     _initControllers();
//     _initAnimations();
//     _startSequence();
//   }

//   void _initControllers() {
//     _bgController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 900),
//     );
//     _headerController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 800),
//     );
//     _cardController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 750),
//     );
//     _otpController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 700),
//     );
//     _particleController = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 10),
//     )..repeat();
//     _pulseController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 2000),
//     )..repeat(reverse: true);
//     _shimmerController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 2200),
//     )..repeat();
//   }

//   void _initAnimations() {
//     _bgFade = Tween<double>(
//       begin: 0,
//       end: 1,
//     ).animate(CurvedAnimation(parent: _bgController, curve: Curves.easeIn));
//     _headerFade = Tween<double>(begin: 0, end: 1).animate(
//       CurvedAnimation(parent: _headerController, curve: Curves.easeOut),
//     );
//     _headerSlide = Tween<Offset>(begin: const Offset(0, -0.3), end: Offset.zero)
//         .animate(
//           CurvedAnimation(
//             parent: _headerController,
//             curve: Curves.easeOutCubic,
//           ),
//         );
//     _cardSlide = Tween<double>(begin: 80, end: 0).animate(
//       CurvedAnimation(parent: _cardController, curve: Curves.easeOutCubic),
//     );
//     _cardFade = Tween<double>(
//       begin: 0,
//       end: 1,
//     ).animate(CurvedAnimation(parent: _cardController, curve: Curves.easeIn));
//     _otpFade = Tween<double>(
//       begin: 0,
//       end: 1,
//     ).animate(CurvedAnimation(parent: _otpController, curve: Curves.easeOut));
//     _otpScale = Tween<double>(begin: 0.85, end: 1.0).animate(
//       CurvedAnimation(parent: _otpController, curve: Curves.easeOutBack),
//     );
//     _pulse = Tween<double>(begin: 0.96, end: 1.04).animate(
//       CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
//     );
//     _shimmer = Tween<double>(begin: -2.0, end: 3.0).animate(
//       CurvedAnimation(parent: _shimmerController, curve: Curves.easeInOut),
//     );
//   }

//   Future<void> _startSequence() async {
//     await Future.delayed(const Duration(milliseconds: 100));
//     _bgController.forward();
//     await Future.delayed(const Duration(milliseconds: 280));
//     _headerController.forward();
//     await Future.delayed(const Duration(milliseconds: 380));
//     _cardController.forward();
//     await Future.delayed(const Duration(milliseconds: 300));
//     _otpController.forward();
//   }

//   @override
//   void dispose() {
//     _bgController.dispose();
//     _headerController.dispose();
//     _cardController.dispose();
//     _otpController.dispose();
//     _particleController.dispose();
//     _pulseController.dispose();
//     _shimmerController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;

//     return Scaffold(
//       backgroundColor: const Color(0xFFF0F6FA),
//       body: Stack(
//         children: [
//           // ── 1. Light background image ────────────────────────────
//           FadeTransition(
//             opacity: _bgFade,
//             child: SizedBox(
//               width: size.width,
//               height: size.height * 0.5,
//               child: Image.asset("assets/si.png", fit: BoxFit.cover),
//             ),
//           ),

//           // ── 2. Light overlay gradient ────────────────────────────
//           Container(
//             width: size.width,
//             height: size.height * 0.54,
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [
//                   Color(0xBB0A3D52),
//                   Color(0x550A3D52),
//                   Color(0xFFF0F6FA),
//                 ],
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 stops: [0.0, 0.45, 1.0],
//               ),
//             ),
//           ),

//           // ── 3. Particles (light subtle) ──────────────────────────
//           AnimatedBuilder(
//             animation: _particleController,
//             builder: (_, __) => CustomPaint(
//               size: Size(size.width, size.height * 0.45),
//               painter: _LightParticlePainter(_particleController.value),
//             ),
//           ),

//           // ── 4. Top soft glow ─────────────────────────────────────
//           Positioned(
//             top: -80,
//             left: -50,
//             right: -50,
//             child: Container(
//               height: 240,
//               decoration: BoxDecoration(
//                 borderRadius: const BorderRadius.only(
//                   bottomLeft: Radius.circular(200),
//                   bottomRight: Radius.circular(200),
//                 ),
//                 gradient: RadialGradient(
//                   center: Alignment.topCenter,
//                   radius: 0.9,
//                   colors: [
//                     const Color(0xFF00BFA5).withOpacity(0.22),
//                     Colors.transparent,
//                   ],
//                 ),
//               ),
//             ),
//           ),

//           // ── 5. Scrollable content ─────────────────────────────────
//           SingleChildScrollView(
//             physics: const BouncingScrollPhysics(),
//             child: Column(
//               children: [
//                 // Header
//                 SlideTransition(
//                   position: _headerSlide,
//                   child: FadeTransition(
//                     opacity: _headerFade,
//                     child: _buildHeader(size),
//                   ),
//                 ),

//                 // Card
//                 AnimatedBuilder(
//                   animation: _cardController,
//                   builder: (_, child) => Transform.translate(
//                     offset: Offset(0, _cardSlide.value),
//                     child: Opacity(opacity: _cardFade.value, child: child),
//                   ),
//                   child: _buildCard(context, size),
//                 ),

//                 SizedBox(height: 30.h),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // ─── Header ──────────────────────────────────────────────────────
//   Widget _buildHeader(Size size) {
//     return SizedBox(
//       width: size.width,
//       child: Padding(
//         padding: EdgeInsets.only(top: 68.h, left: 24.w, right: 24.w),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Back button
//             GestureDetector(
//               onTap: () => Navigator.pop(context),
//               child: Container(
//                 width: 40.w,
//                 height: 40.w,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Colors.white.withOpacity(0.2),
//                   border: Border.all(
//                     color: Colors.white.withOpacity(0.35),
//                     width: 1,
//                   ),
//                 ),
//                 child: const Icon(
//                   Icons.arrow_back_ios_new_rounded,
//                   color: Colors.white,
//                   size: 16,
//                 ),
//               ),
//             ),

//             SizedBox(height: 24.h),

//             // App name shimmer
//             AnimatedBuilder(
//               animation: _shimmerController,
//               builder: (_, child) => ShaderMask(
//                 shaderCallback: (bounds) => LinearGradient(
//                   begin: Alignment.centerLeft,
//                   end: Alignment.centerRight,
//                   colors: const [Colors.white, Color(0xFF80FFF0), Colors.white],
//                   stops: [
//                     (_shimmer.value - 0.6).clamp(0.0, 1.0),
//                     _shimmer.value.clamp(0.0, 1.0),
//                     (_shimmer.value + 0.6).clamp(0.0, 1.0),
//                   ],
//                 ).createShader(bounds),
//                 blendMode: BlendMode.srcIn,
//                 child: child,
//               ),
//               child: Text.rich(
//                 TextSpan(
//                   children: [
//                     TextSpan(
//                       text: "Siha",
//                       style: GoogleFonts.poppins(
//                         fontSize: 36.sp,
//                         fontWeight: FontWeight.w300,
//                         color: Colors.white,
//                         letterSpacing: -1.5,
//                       ),
//                     ),
//                     TextSpan(
//                       text: "Health",
//                       style: GoogleFonts.poppins(
//                         fontSize: 36.sp,
//                         fontWeight: FontWeight.w700,
//                         color: Colors.white,
//                         letterSpacing: -1.5,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//             SizedBox(height: 10.h),

//             Text(
//               "Verify your\nphone number.",
//               style: GoogleFonts.poppins(
//                 fontSize: 26.sp,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.white,
//                 letterSpacing: -0.8,
//                 height: 1.2,
//               ),
//             ),

//             SizedBox(height: 8.h),

//             Text(
//               "One step away from your health journey",
//               style: GoogleFonts.poppins(
//                 fontSize: 13.sp,
//                 color: Colors.white.withOpacity(0.65),
//               ),
//             ),

//             SizedBox(height: 28.h),
//           ],
//         ),
//       ),
//     );
//   }

//   // ─── Card ─────────────────────────────────────────────────────────
//   Widget _buildCard(BuildContext context, Size size) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 16.w),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(32.r),
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             color: const Color(0xFF00897B).withOpacity(0.08),
//             blurRadius: 40,
//             spreadRadius: 2,
//             offset: const Offset(0, -4),
//           ),
//           BoxShadow(
//             color: Colors.black.withOpacity(0.06),
//             blurRadius: 28,
//             offset: const Offset(0, 10),
//           ),
//         ],
//         border: Border.all(
//           color: const Color(0xFF00BFA5).withOpacity(0.12),
//           width: 1,
//         ),
//       ),
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 28.h),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Pill
//             Center(
//               child: Container(
//                 width: 38.w,
//                 height: 4.h,
//                 decoration: BoxDecoration(
//                   color: const Color(0xFF00BFA5).withOpacity(0.25),
//                   borderRadius: BorderRadius.circular(10.r),
//                 ),
//               ),
//             ),

//             SizedBox(height: 22.h),

//             // Title row
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Enter OTP 🔐",
//                       style: GoogleFonts.poppins(
//                         fontSize: 20.sp,
//                         fontWeight: FontWeight.w700,
//                         color: const Color(0xFF0D2B3E),
//                         letterSpacing: -0.5,
//                       ),
//                     ),
//                     SizedBox(height: 4.h),
//                     RichText(
//                       text: TextSpan(
//                         children: [
//                           TextSpan(
//                             text: "Code sent to ",
//                             style: GoogleFonts.poppins(
//                               fontSize: 12.sp,
//                               color: Colors.black45,
//                             ),
//                           ),
//                           TextSpan(
//                             text: widget.phone,
//                             style: GoogleFonts.poppins(
//                               fontSize: 12.sp,
//                               fontWeight: FontWeight.w600,
//                               color: const Color(0xFF00897B),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 // Pulsing icon
//                 AnimatedBuilder(
//                   animation: _pulseController,
//                   builder: (_, child) => Transform.scale(
//                     scale: _pulse.value,
//                     child: Container(
//                       width: 46.w,
//                       height: 46.w,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: const Color(0xFF00BFA5).withOpacity(0.1),
//                         border: Border.all(
//                           color: const Color(0xFF00BFA5).withOpacity(0.3),
//                           width: 1.5,
//                         ),
//                         boxShadow: [
//                           BoxShadow(
//                             color: const Color(0xFF00BFA5).withOpacity(0.15),
//                             blurRadius: 14,
//                             spreadRadius: 2,
//                           ),
//                         ],
//                       ),
//                       child: Icon(
//                         Icons.sms_rounded,
//                         color: const Color(0xFF00897B),
//                         size: 20.sp,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),

//             SizedBox(height: 24.h),

//             // Divider
//             Divider(color: Colors.grey.withOpacity(0.12), height: 1),

//             SizedBox(height: 26.h),

//             // OTP label
//             Text(
//               "VERIFICATION CODE",
//               style: GoogleFonts.poppins(
//                 fontSize: 11.sp,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.black38,
//                 letterSpacing: 2,
//               ),
//             ),

//             SizedBox(height: 16.h),

//             // ── OTP Field (API untouched) ──────────────────────────
//             FadeTransition(
//               opacity: _otpFade,
//               child: ScaleTransition(
//                 scale: _otpScale,
//                 child: OtpPinField(
//                   fieldHeight: 56.h,
//                   fieldWidth: 52.w,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   otpPinFieldDecoration:
//                       OtpPinFieldDecoration.defaultPinBoxDecoration,
//                   otpPinFieldStyle: OtpPinFieldStyle(
//                     fieldBorderWidth: 1.5,
//                     defaultFieldBorderColor: const Color(
//                       0xFF00BFA5,
//                     ).withOpacity(0.25),
//                     activeFieldBorderColor: const Color(0xFF00897B),
//                     defaultFieldBackgroundColor: const Color(0xFFF5FDFB),
//                     activeFieldBackgroundColor: Colors.white,
//                     textStyle: GoogleFonts.poppins(
//                       fontSize: 20.sp,
//                       fontWeight: FontWeight.w700,
//                       color: const Color(0xFF0D2B3E),
//                     ),
//                   ),
//                   maxLength: 6,
//                   onSubmit: (text) async {
//                     await verifyOtp(number: widget.phone); // ← untouched
//                   },
//                   onChange: (text) {
//                     setOtpCode(text); // ← untouched
//                   },
//                 ),
//               ),
//             ),

//             SizedBox(height: 10.h),

//             // Timer hint
//             Center(
//               child: Text(
//                 "Code expires in 2:00",
//                 style: GoogleFonts.poppins(
//                   fontSize: 12.sp,
//                   color: Colors.black38,
//                 ),
//               ),
//             ),

//             SizedBox(height: 28.h),

//             // ── Verify Button ─────────────────────────────────────
//             GestureDetector(
//               onTapDown: (_) {
//                 if (!isLoading) setState(() => _buttonPressed = true);
//               },
//               onTapUp: (_) async {
//                 setState(() => _buttonPressed = false);
//                 if (!isLoading)
//                   await verifyOtp(number: widget.phone); // ← untouched
//               },
//               onTapCancel: () => setState(() => _buttonPressed = false),
//               child: AnimatedScale(
//                 scale: _buttonPressed ? 0.96 : 1.0,
//                 duration: const Duration(milliseconds: 110),
//                 child: AnimatedContainer(
//                   duration: const Duration(milliseconds: 200),
//                   width: double.infinity,
//                   height: 54.h,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(16.r),
//                     gradient: isLoading
//                         ? LinearGradient(
//                             colors: [
//                               const Color(0xFF048A70).withOpacity(0.55),
//                               const Color(0xFF00BFA5).withOpacity(0.55),
//                             ],
//                           )
//                         : const LinearGradient(
//                             colors: [Color(0xFF048A70), Color(0xFF00BFA5)],
//                             begin: Alignment.centerLeft,
//                             end: Alignment.centerRight,
//                           ),
//                     boxShadow: isLoading
//                         ? []
//                         : [
//                             BoxShadow(
//                               color: const Color(0xFF00BFA5).withOpacity(0.28),
//                               blurRadius: 20,
//                               offset: const Offset(0, 8),
//                             ),
//                           ],
//                   ),
//                   child: Center(
//                     child: isLoading
//                         ? const SizedBox(
//                             width: 22,
//                             height: 22,
//                             child: CircularProgressIndicator(
//                               color: Colors.white,
//                               strokeWidth: 2.2,
//                             ),
//                           )
//                         : Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 "Verify OTP",
//                                 style: GoogleFonts.poppins(
//                                   fontSize: 15.sp,
//                                   fontWeight: FontWeight.w600,
//                                   color: Colors.white,
//                                   letterSpacing: 0.4,
//                                 ),
//                               ),
//                               SizedBox(width: 8.w),
//                               const Icon(
//                                 Icons.verified_rounded,
//                                 color: Colors.white,
//                                 size: 18,
//                               ),
//                             ],
//                           ),
//                   ),
//                 ),
//               ),
//             ),

//             SizedBox(height: 22.h),

//             // ── Resend OTP (API untouched) ────────────────────────
//             Center(
//               child: Text.rich(
//                 TextSpan(
//                   children: [
//                     TextSpan(
//                       text: "Didn't receive OTP? ",
//                       style: GoogleFonts.poppins(
//                         fontSize: 13.sp,
//                         color: Colors.black38,
//                       ),
//                     ),
//                     TextSpan(
//                       recognizer: TapGestureRecognizer()
//                         ..onTap = () async {
//                           await resendOtp(
//                             phoneNumber: widget.phone,
//                           ); // ← untouched
//                         },
//                       text: "Resend",
//                       style: GoogleFonts.poppins(
//                         fontSize: 13.sp,
//                         fontWeight: FontWeight.w700,
//                         color: const Color(0xFF00897B),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // ─── Light Particle Painter ───────────────────────────────────────────────────
// class _LightParticlePainter extends CustomPainter {
//   final double progress;
//   _LightParticlePainter(this.progress);

//   @override
//   void paint(Canvas canvas, Size size) {
//     final rng = Random(33);
//     final paint = Paint()..style = PaintingStyle.fill;

//     for (int i = 0; i < 28; i++) {
//       final baseX = rng.nextDouble() * size.width;
//       final baseY = rng.nextDouble() * size.height;
//       final dy =
//           ((baseY - progress * size.height * 0.65) % size.height +
//               size.height) %
//           size.height;
//       final opacity = (sin((progress * 2 * pi) + i) * 0.5 + 0.5) * 0.3;
//       final radius = rng.nextDouble() * 1.6 + 0.4;

//       paint.color = i.isEven
//           ? const Color(0xFF00BFA5).withOpacity(opacity)
//           : Colors.white.withOpacity(opacity * 0.6);
//       canvas.drawCircle(Offset(baseX, dy), radius, paint);
//     }
//   }

//   @override
//   bool shouldRepaint(_LightParticlePainter old) => old.progress != progress;
// }
