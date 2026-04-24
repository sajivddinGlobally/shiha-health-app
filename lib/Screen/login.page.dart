import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shiha_health_app/Screen/loginpage/widgets/login_controller.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage>
    with LoginController<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
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
                    SizedBox(height: 70.h),
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
                            "Welcome Back ",
                            style: GoogleFonts.poppins(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              letterSpacing: -1,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            "Enter your details to continue",
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
                          IntlPhoneField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                left: 18.w,
                                right: 18.w,
                                top: 15.h,
                                bottom: 15.h,
                              ),
                              counterText: "",
                              filled: true,
                              fillColor: Color(0xFFD9D9D9),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.r),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.r),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.r),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.r),
                              ),
                              hint: Text("Phone"),
                            ),
                            initialCountryCode: "SO",
                            onChanged: (phone) {
                              setState(() {
                                phoneController.text = phone.completeNumber;
                              });
                            },
                            validator: (value) {
                              if (value == null || value.number.isEmpty) {
                                return 'Please enter your phone number';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 30.h),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(400.w, 55.h),
                              backgroundColor: Color(0xFF067594),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                side: BorderSide(),
                              ),
                            ),
                            onPressed: isLoading ? null : () => login(),
                            child: isLoading == true
                                ? Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  )
                                : Text(
                                    "Login",
                                    style: GoogleFonts.poppins(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFFFFFFFF),
                                    ),
                                  ),
                          ),
                          SizedBox(height: 20.h),
                          InkWell(
                            onTap: () => sendToSignUpPage(),
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Don’t have an account? ",
                                    style: GoogleFonts.poppins(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF717F8D),
                                      letterSpacing: -1,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Sign up",
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
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';
// import 'package:shiha_health_app/Screen/loginpage/widgets/login_controller.dart';

// class LoginPage extends ConsumerStatefulWidget {
//   const LoginPage({super.key});

//   @override
//   ConsumerState<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends ConsumerState<LoginPage>
//     with LoginController<LoginPage>, TickerProviderStateMixin {
//   // ─── Animation Controllers ──────────────────────────────────────
//   late AnimationController _bgController;
//   late AnimationController _headerController;
//   late AnimationController _formController;
//   late AnimationController _particleController;
//   late AnimationController _shimmerController;
//   late AnimationController _pulseController;

//   // ─── Animations ─────────────────────────────────────────────────
//   late Animation<double> _bgFade;
//   late Animation<double> _headerFade;
//   late Animation<Offset> _headerSlide;
//   late Animation<double> _formSlide;
//   late Animation<double> _formFade;
//   late Animation<double> _shimmer;
//   late Animation<double> _pulse;

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
//       duration: const Duration(milliseconds: 850),
//     );
//     _formController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 720),
//     );
//     _particleController = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 10),
//     )..repeat();
//     _shimmerController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 2200),
//     )..repeat();
//     _pulseController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 2000),
//     )..repeat(reverse: true);
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
//     _formSlide = Tween<double>(begin: 90, end: 0).animate(
//       CurvedAnimation(parent: _formController, curve: Curves.easeOutCubic),
//     );
//     _formFade = Tween<double>(
//       begin: 0,
//       end: 1,
//     ).animate(CurvedAnimation(parent: _formController, curve: Curves.easeIn));
//     _shimmer = Tween<double>(begin: -2.0, end: 3.0).animate(
//       CurvedAnimation(parent: _shimmerController, curve: Curves.easeInOut),
//     );
//     _pulse = Tween<double>(begin: 0.95, end: 1.05).animate(
//       CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
//     );
//   }

//   Future<void> _startSequence() async {
//     await Future.delayed(const Duration(milliseconds: 100));
//     _bgController.forward();
//     await Future.delayed(const Duration(milliseconds: 300));
//     _headerController.forward();
//     await Future.delayed(const Duration(milliseconds: 450));
//     _formController.forward();
//   }

//   @override
//   void dispose() {
//     _bgController.dispose();
//     _headerController.dispose();
//     _formController.dispose();
//     _particleController.dispose();
//     _shimmerController.dispose();
//     _pulseController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;

//     return Scaffold(
//       backgroundColor: const Color(0xFF050B18),
//       resizeToAvoidBottomInset: true,
//       body: Form(
//         key: formKey,
//         child: Stack(
//           children: [
//             // ── 1. Background image ────────────────────────────────
//             FadeTransition(
//               opacity: _bgFade,
//               child: SizedBox(
//                 width: size.width,
//                 height: size.height * 0.55,
//                 child: Image.asset("assets/si.png", fit: BoxFit.cover),
//               ),
//             ),

//             // ── 2. Gradient overlay ────────────────────────────────
//             Container(
//               width: size.width,
//               height: size.height * 0.58,
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [
//                     Color(0xCC050B18),
//                     Color(0x44050B18),
//                     Color(0xEE050B18),
//                   ],
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   stops: [0.0, 0.4, 1.0],
//                 ),
//               ),
//             ),

//             // ── 3. Particles ───────────────────────────────────────
//             AnimatedBuilder(
//               animation: _particleController,
//               builder: (_, __) => CustomPaint(
//                 size: Size(size.width, size.height * 0.5),
//                 painter: _ParticlePainter(_particleController.value),
//               ),
//             ),

//             // ── 4. Top glow ────────────────────────────────────────
//             Positioned(
//               top: -80,
//               left: -50,
//               right: -50,
//               child: Container(
//                 height: 250,
//                 decoration: BoxDecoration(
//                   borderRadius: const BorderRadius.only(
//                     bottomLeft: Radius.circular(200),
//                     bottomRight: Radius.circular(200),
//                   ),
//                   gradient: RadialGradient(
//                     center: Alignment.topCenter,
//                     radius: 0.9,
//                     colors: [
//                       const Color(0xFF00E5CC).withOpacity(0.22),
//                       Colors.transparent,
//                     ],
//                   ),
//                 ),
//               ),
//             ),

//             // ── 5. Scrollable body ─────────────────────────────────
//             SingleChildScrollView(
//               physics: const BouncingScrollPhysics(),
//               child: Column(
//                 children: [
//                   // Header
//                   SlideTransition(
//                     position: _headerSlide,
//                     child: FadeTransition(
//                       opacity: _headerFade,
//                       child: _buildHeader(size),
//                     ),
//                   ),

//                   // Form card
//                   AnimatedBuilder(
//                     animation: _formController,
//                     builder: (_, child) => Transform.translate(
//                       offset: Offset(0, _formSlide.value),
//                       child: Opacity(opacity: _formFade.value, child: child),
//                     ),
//                     child: _buildFormCard(context, size),
//                   ),

//                   SizedBox(height: 30.h),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // ─── Header Section ──────────────────────────────────────────────
//   Widget _buildHeader(Size size) {
//     return SizedBox(
//       width: size.width,
//       child: Padding(
//         padding: EdgeInsets.only(top: 72.h, left: 24.w, right: 24.w),
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
//                   color: Colors.white.withOpacity(0.1),
//                   border: Border.all(
//                     color: Colors.white.withOpacity(0.18),
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

//             SizedBox(height: 26.h),

//             // App name shimmer
//             AnimatedBuilder(
//               animation: _shimmerController,
//               builder: (_, child) {
//                 return ShaderMask(
//                   shaderCallback: (bounds) {
//                     return LinearGradient(
//                       begin: Alignment.centerLeft,
//                       end: Alignment.centerRight,
//                       colors: const [
//                         Colors.white,
//                         Color(0xFF00E5CC),
//                         Colors.white,
//                       ],
//                       stops: [
//                         (_shimmer.value - 0.6).clamp(0.0, 1.0),
//                         _shimmer.value.clamp(0.0, 1.0),
//                         (_shimmer.value + 0.6).clamp(0.0, 1.0),
//                       ],
//                     ).createShader(bounds);
//                   },
//                   blendMode: BlendMode.srcIn,
//                   child: child,
//                 );
//               },
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

//             SizedBox(height: 12.h),

//             Text(
//               "Power up your\nhealth journey.",
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
//               "Sign in to continue your wellness journey",
//               style: GoogleFonts.poppins(
//                 fontSize: 13.sp,
//                 fontWeight: FontWeight.w400,
//                 color: Colors.white.withOpacity(0.5),
//               ),
//             ),

//             SizedBox(height: 28.h),
//           ],
//         ),
//       ),
//     );
//   }

//   // ─── Form Card ───────────────────────────────────────────────────
//   Widget _buildFormCard(BuildContext context, Size size) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 16.w),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(32.r),
//         gradient: LinearGradient(
//           colors: [
//             const Color(0xFF0B1628).withOpacity(0.97),
//             const Color(0xFF060E1C).withOpacity(0.99),
//           ],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//         border: Border.all(
//           color: const Color(0xFF00E5CC).withOpacity(0.16),
//           width: 1,
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: const Color(0xFF00E5CC).withOpacity(0.07),
//             blurRadius: 40,
//             spreadRadius: 2,
//             offset: const Offset(0, -6),
//           ),
//           BoxShadow(
//             color: Colors.black.withOpacity(0.5),
//             blurRadius: 30,
//             offset: const Offset(0, 10),
//           ),
//         ],
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(32.r),
//         child: BackdropFilter(
//           filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 28.h),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Pill handle
//                 Center(
//                   child: Container(
//                     width: 38.w,
//                     height: 4.h,
//                     decoration: BoxDecoration(
//                       color: const Color(0xFF00E5CC).withOpacity(0.25),
//                       borderRadius: BorderRadius.circular(10.r),
//                     ),
//                   ),
//                 ),

//                 SizedBox(height: 22.h),

//                 // Title + icon row
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Welcome Back 👋",
//                           style: GoogleFonts.poppins(
//                             fontSize: 20.sp,
//                             fontWeight: FontWeight.w700,
//                             color: Colors.white,
//                             letterSpacing: -0.5,
//                           ),
//                         ),
//                         Text(
//                           "Enter your details to continue",
//                           style: GoogleFonts.poppins(
//                             fontSize: 12.sp,
//                             color: Colors.white.withOpacity(0.4),
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                       ],
//                     ),
//                     AnimatedBuilder(
//                       animation: _pulseController,
//                       builder: (_, child) {
//                         return Transform.scale(
//                           scale: _pulse.value,
//                           child: Container(
//                             width: 46.w,
//                             height: 46.w,
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               color: const Color(0xFF00E5CC).withOpacity(0.1),
//                               border: Border.all(
//                                 color: const Color(0xFF00E5CC).withOpacity(0.3),
//                                 width: 1.5,
//                               ),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: const Color(
//                                     0xFF00E5CC,
//                                   ).withOpacity(0.18),
//                                   blurRadius: 16,
//                                   spreadRadius: 2,
//                                 ),
//                               ],
//                             ),
//                             child: Icon(
//                               Icons.health_and_safety_rounded,
//                               color: const Color(0xFF00E5CC),
//                               size: 20.sp,
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ],
//                 ),

//                 SizedBox(height: 28.h),

//                 // ── Phone Field Label ──────────────────────────────
//                 Text(
//                   "PHONE NUMBER",
//                   style: GoogleFonts.poppins(
//                     fontSize: 11.sp,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.white38,
//                     letterSpacing: 2,
//                   ),
//                 ),

//                 SizedBox(height: 10.h),

//                 // ── IntlPhoneField (API untouched) ─────────────────
//                 _AnimatedPhoneField(
//                   onChanged: (phone) {
//                     setState(() {
//                       phoneController.text = phone.completeNumber;
//                     });
//                   },
//                   validator: (value) {
//                     if (value == null || value.number.isEmpty) {
//                       return 'Please enter your phone number';
//                     }
//                     return null;
//                   },
//                 ),

//                 SizedBox(height: 28.h),

//                 // ── Login Button ───────────────────────────────────
//                 GestureDetector(
//                   onTapDown: (_) {
//                     if (!isLoading) setState(() => _buttonPressed = true);
//                   },
//                   onTapUp: (_) {
//                     setState(() => _buttonPressed = false);
//                     if (!isLoading) login(); // ← original login() call
//                   },
//                   onTapCancel: () => setState(() => _buttonPressed = false),
//                   child: AnimatedScale(
//                     scale: _buttonPressed ? 0.96 : 1.0,
//                     duration: const Duration(milliseconds: 110),
//                     child: AnimatedContainer(
//                       duration: const Duration(milliseconds: 200),
//                       width: double.infinity,
//                       height: 54.h,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(16.r),
//                         gradient: isLoading
//                             ? LinearGradient(
//                                 colors: [
//                                   const Color(0xFF048A70).withOpacity(0.6),
//                                   const Color(0xFF00E5CC).withOpacity(0.6),
//                                 ],
//                               )
//                             : const LinearGradient(
//                                 colors: [Color(0xFF048A70), Color(0xFF00E5CC)],
//                                 begin: Alignment.centerLeft,
//                                 end: Alignment.centerRight,
//                               ),
//                         boxShadow: isLoading
//                             ? []
//                             : [
//                                 BoxShadow(
//                                   color: const Color(
//                                     0xFF00E5CC,
//                                   ).withOpacity(0.32),
//                                   blurRadius: 22,
//                                   offset: const Offset(0, 8),
//                                 ),
//                               ],
//                       ),
//                       child: Center(
//                         child: isLoading
//                             ? const SizedBox(
//                                 width: 22,
//                                 height: 22,
//                                 child: CircularProgressIndicator(
//                                   color: Colors.white,
//                                   strokeWidth: 2.2,
//                                 ),
//                               )
//                             : Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Text(
//                                     "Login",
//                                     style: GoogleFonts.poppins(
//                                       fontSize: 15.sp,
//                                       fontWeight: FontWeight.w600,
//                                       color: Colors.white,
//                                       letterSpacing: 0.4,
//                                     ),
//                                   ),
//                                   SizedBox(width: 8.w),
//                                   const Icon(
//                                     Icons.arrow_forward_rounded,
//                                     color: Colors.white,
//                                     size: 18,
//                                   ),
//                                 ],
//                               ),
//                       ),
//                     ),
//                   ),
//                 ),

//                 SizedBox(height: 24.h),

//                 // Sign up link — sendToSignUpPage() call untouched
//                 Center(
//                   child: GestureDetector(
//                     onTap: () => sendToSignUpPage(),
//                     child: Text.rich(
//                       TextSpan(
//                         children: [
//                           TextSpan(
//                             text: "Don't have an account? ",
//                             style: GoogleFonts.poppins(
//                               fontSize: 13.sp,
//                               color: Colors.white.withOpacity(0.38),
//                             ),
//                           ),
//                           TextSpan(
//                             text: "Sign up",
//                             style: GoogleFonts.poppins(
//                               fontSize: 13.sp,
//                               fontWeight: FontWeight.w700,
//                               color: const Color(0xFF00E5CC),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // ─── Animated Phone Field Wrapper ─────────────────────────────────────────────
// class _AnimatedPhoneField extends StatefulWidget {
//   final void Function(dynamic phone) onChanged;
//   final String? Function(dynamic value)? validator;

//   const _AnimatedPhoneField({required this.onChanged, this.validator});

//   @override
//   State<_AnimatedPhoneField> createState() => _AnimatedPhoneFieldState();
// }

// class _AnimatedPhoneFieldState extends State<_AnimatedPhoneField> {
//   bool _focused = false;

//   @override
//   Widget build(BuildContext context) {
//     return Focus(
//       onFocusChange: (f) => setState(() => _focused = f),
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 220),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(14.r),
//           color: Colors.white.withOpacity(0.06),
//           border: Border.all(
//             color: _focused
//                 ? const Color(0xFF00E5CC).withOpacity(0.55)
//                 : Colors.white.withOpacity(0.1),
//             width: _focused ? 1.5 : 1,
//           ),
//           boxShadow: _focused
//               ? [
//                   BoxShadow(
//                     color: const Color(0xFF00E5CC).withOpacity(0.1),
//                     blurRadius: 14,
//                     spreadRadius: 1,
//                   ),
//                 ]
//               : [],
//         ),
//         child: IntlPhoneField(
//           decoration: InputDecoration(
//             contentPadding: EdgeInsets.symmetric(
//               horizontal: 16.w,
//               vertical: 16.h,
//             ),
//             counterText: "",
//             border: InputBorder.none,
//             enabledBorder: InputBorder.none,
//             focusedBorder: InputBorder.none,
//             errorBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(14.r),
//               borderSide: BorderSide(color: Colors.redAccent.withOpacity(0.6)),
//             ),
//             focusedErrorBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(14.r),
//               borderSide: BorderSide(color: Colors.redAccent.withOpacity(0.6)),
//             ),
//             filled: false,
//             hintText: "Phone number",
//             hintStyle: GoogleFonts.poppins(
//               fontSize: 14.sp,
//               color: Colors.white24,
//             ),
//           ),
//           style: GoogleFonts.poppins(fontSize: 14.sp, color: Colors.white),
//           dropdownTextStyle: GoogleFonts.poppins(
//             fontSize: 14.sp,
//             color: Colors.white,
//           ),
//           dropdownIcon: const Icon(
//             Icons.arrow_drop_down_rounded,
//             color: Colors.white54,
//           ),
//           flagsButtonPadding: EdgeInsets.only(left: 12.w),
//           initialCountryCode: "SO",
//           onChanged: widget.onChanged,
//           validator: widget.validator,
//         ),
//       ),
//     );
//   }
// }

// // ─── Particle Painter ─────────────────────────────────────────────────────────
// class _ParticlePainter extends CustomPainter {
//   final double progress;
//   _ParticlePainter(this.progress);

//   @override
//   void paint(Canvas canvas, Size size) {
//     final rng = Random(55);
//     final paint = Paint()..style = PaintingStyle.fill;

//     for (int i = 0; i < 30; i++) {
//       final baseX = rng.nextDouble() * size.width;
//       final baseY = rng.nextDouble() * size.height;
//       final dy =
//           ((baseY - progress * size.height * 0.65) % size.height +
//               size.height) %
//           size.height;
//       final opacity = (sin((progress * 2 * pi) + i) * 0.5 + 0.5) * 0.36;
//       final radius = rng.nextDouble() * 1.8 + 0.4;

//       paint.color = i.isEven
//           ? const Color(0xFF00E5CC).withOpacity(opacity)
//           : Colors.white.withOpacity(opacity * 0.35);
//       canvas.drawCircle(Offset(baseX, dy), radius, paint);
//     }
//   }

//   @override
//   bool shouldRepaint(_ParticlePainter old) => old.progress != progress;
// }
