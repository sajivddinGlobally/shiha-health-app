import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shiha_health_app/Screen/login.page.dart';
import 'package:shiha_health_app/Screen/splash/controller/splash.controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SplashController<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checLocalDataOrSendNext();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Positioned(
              top: 0.h,
              child: ClipRRect(
                borderRadius: BorderRadius.only(),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.white.withOpacity(
                      0.4,
                    ), // Optional dim overlay
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Image.asset(
                        "assets/mp4/dna.gif",
                        fit: BoxFit.cover,
                        // ya BoxFit.contain
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ClipPath(
              clipper: InwardCurveClipper(),
              child: Container(
                height: 150.h,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.cyan, Colors.transparent],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                alignment: Alignment.center,
              ),
            ),
            Image.asset(
              "assets/vectors/Vector.png",
              width: MediaQuery.of(context).size.width,
              height: 110.h,
              fit: BoxFit.cover,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  SizedBox(height: 80),
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
                ],
              ),
            ),
            if (userData == null) ...[
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(bottom: 30.h),
                  padding: EdgeInsets.all(1.w), // Border thickness
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(0, 255, 255, 255),
                        Color.fromARGB(255, 255, 255, 255),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.topRight,
                    ),
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: Container(
                    width: 400.w,
                    height: 240.h,
                    decoration: BoxDecoration(
                      color: Color(0xFF0E1329),
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 25.w,
                        right: 25.w,
                        top: 25.h,
                        bottom: 20.h,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "Welcome to ",
                                  style: GoogleFonts.poppins(
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                                TextSpan(
                                  text: "Siha Health",
                                  style: GoogleFonts.poppins(
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFFFFFFFF),
                                    letterSpacing: -1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            "Your complete health companion, designed to help you track your fitness goals, monitor your nutrition, and manage your wellness journey.",
                            style: GoogleFonts.poppins(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              letterSpacing: -0.4,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 20.h),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(400.w, 50.h),
                              backgroundColor: Color(0xFF067594),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => LoginPage(),
                                ),
                              );
                            },
                            child: Text(
                              "Get Started",
                              style: GoogleFonts.poppins(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                letterSpacing: -1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class InwardCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 50); // Start from bottom left

    // Inward curve (bowl shape)
    path.quadraticBezierTo(
      size.width / 2,
      size.height + 50, // control point (go inside)
      size.width,
      size.height - 50, // end point
    );

    path.lineTo(size.width, 0); // top right
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

// import 'dart:math';
// import 'dart:ui';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:shiha_health_app/Screen/login.page.dart';
// import 'package:shiha_health_app/Screen/splash/controller/splash.controller.dart';

// class SplashPage extends StatefulWidget {
//   const SplashPage({super.key});
//   @override
//   State<SplashPage> createState() => _SplashPageState();
// }
// class _SplashPageState extends State<SplashPage>
//     with SplashController<SplashPage>, TickerProviderStateMixin {
//   // ─── Controllers ───────────────────────────────────────────────
//   late AnimationController _bgController;
//   late AnimationController _logoController;
//   late AnimationController _cardController;
//   late AnimationController _particleController;
//   late AnimationController _shimmerController;
//   late AnimationController _pulseController;
//   late AnimationController _floatController;

//   // ─── Animations ────────────────────────────────────────────────
//   late Animation<double> _bgFade;
//   late Animation<double> _logoFade;
//   late Animation<Offset> _logoSlide;
//   late Animation<double> _logoScale;
//   late Animation<double> _cardSlide;
//   late Animation<double> _cardFade;
//   late Animation<double> _shimmer;
//   late Animation<double> _pulse;
//   late Animation<double> _float;

//   bool _buttonPressed = false;

//   @override
//   void initState() {
//     super.initState();
//     checLocalDataOrSendNext();
//     _initControllers();
//     _initAnimations();
//     _startSequence();
//   }

//   void _initControllers() {
//     _bgController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 1100),
//     );
//     _logoController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 1000),
//     );
//     _cardController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 750),
//     );
//     _particleController = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 9),
//     )..repeat();
//     _shimmerController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 2200),
//     )..repeat();
//     _pulseController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 2000),
//     )..repeat(reverse: true);
//     _floatController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 3000),
//     )..repeat(reverse: true);
//   }

//   void _initAnimations() {
//     _bgFade = Tween<double>(
//       begin: 0,
//       end: 1,
//     ).animate(CurvedAnimation(parent: _bgController, curve: Curves.easeIn));

//     _logoFade = Tween<double>(
//       begin: 0,
//       end: 1,
//     ).animate(CurvedAnimation(parent: _logoController, curve: Curves.easeOut));
//     _logoSlide = Tween<Offset>(begin: const Offset(0, -0.45), end: Offset.zero)
//         .animate(
//           CurvedAnimation(parent: _logoController, curve: Curves.elasticOut),
//         );
//     _logoScale = Tween<double>(begin: 0.65, end: 1.0).animate(
//       CurvedAnimation(parent: _logoController, curve: Curves.easeOutBack),
//     );

//     _cardSlide = Tween<double>(begin: 1.0, end: 0.0).animate(
//       CurvedAnimation(parent: _cardController, curve: Curves.easeOutCubic),
//     );
//     _cardFade = Tween<double>(
//       begin: 0,
//       end: 1,
//     ).animate(CurvedAnimation(parent: _cardController, curve: Curves.easeIn));

//     _shimmer = Tween<double>(begin: -1.8, end: 2.8).animate(
//       CurvedAnimation(parent: _shimmerController, curve: Curves.easeInOut),
//     );

//     _pulse = Tween<double>(begin: 0.95, end: 1.05).animate(
//       CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
//     );

//     _float = Tween<double>(begin: -6, end: 6).animate(
//       CurvedAnimation(parent: _floatController, curve: Curves.easeInOut),
//     );
//   }

//   Future<void> _startSequence() async {
//     await Future.delayed(const Duration(milliseconds: 150));
//     _bgController.forward();
//     await Future.delayed(const Duration(milliseconds: 350));
//     _logoController.forward();
//     await Future.delayed(const Duration(milliseconds: 600));
//     _cardController.forward();
//   }

//   @override
//   void dispose() {
//     _bgController.dispose();
//     _logoController.dispose();
//     _cardController.dispose();
//     _particleController.dispose();
//     _shimmerController.dispose();
//     _pulseController.dispose();
//     _floatController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;

//     return Scaffold(
//       backgroundColor: const Color(0xFF050B18),
//       body: SizedBox(
//         width: size.width,
//         height: size.height,
//         child: Stack(
//           children: [
//             // ── 1. GIF / Background ────────────────────────────────
//             FadeTransition(
//               opacity: _bgFade,
//               child: SizedBox(
//                 width: size.width,
//                 height: size.height,
//                 child: Image.asset("assets/mp4/dna.gif", fit: BoxFit.cover),
//               ),
//             ),

//             // ── 2. Dark overlay gradient ───────────────────────────
//             Container(
//               width: size.width,
//               height: size.height,
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [
//                     Color(0xDD050B18),
//                     Color(0x66050B18),
//                     Color(0xEE050B18),
//                   ],
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   stops: [0.0, 0.45, 1.0],
//                 ),
//               ),
//             ),

//             // ── 3. Floating particles ──────────────────────────────
//             AnimatedBuilder(
//               animation: _particleController,
//               builder: (_, __) => CustomPaint(
//                 size: Size(size.width, size.height),
//                 painter: _ParticlePainter(_particleController.value),
//               ),
//             ),

//             // ── 4. Top radial glow ────────────────────────────────
//             Positioned(
//               top: -80,
//               left: -50,
//               right: -50,
//               child: FadeTransition(
//                 opacity: _bgFade,
//                 child: Container(
//                   height: 260,
//                   decoration: BoxDecoration(
//                     borderRadius: const BorderRadius.only(
//                       bottomLeft: Radius.circular(200),
//                       bottomRight: Radius.circular(200),
//                     ),
//                     gradient: RadialGradient(
//                       center: Alignment.topCenter,
//                       radius: 0.9,
//                       colors: [
//                         const Color(0xFF00E5CC).withOpacity(0.28),
//                         Colors.transparent,
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),

//             // ── 5. DNA helix decoration line ──────────────────────
//             Positioned(
//               top: 0,
//               left: 0,
//               right: 0,
//               child: FadeTransition(
//                 opacity: _bgFade,
//                 child: SizedBox(
//                   height: 110.h,
//                   child: Image.asset(
//                     "assets/vectors/Vector.png",
//                     width: size.width,
//                     fit: BoxFit.cover,
//                     color: const Color(0xFF00E5CC).withOpacity(0.5),
//                     colorBlendMode: BlendMode.modulate,
//                   ),
//                 ),
//               ),
//             ),

//             // ── 6. Logo + tagline ──────────────────────────────────
//             Align(
//               alignment: Alignment.topCenter,
//               child: Padding(
//                 padding: EdgeInsets.only(top: 60.h),
//                 child: SlideTransition(
//                   position: _logoSlide,
//                   child: FadeTransition(
//                     opacity: _logoFade,
//                     child: ScaleTransition(
//                       scale: _logoScale,
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           // DNA / Health Icon with pulse + float
//                           AnimatedBuilder(
//                             animation: Listenable.merge([
//                               _pulseController,
//                               _floatController,
//                             ]),
//                             builder: (_, child) {
//                               return Transform.translate(
//                                 offset: Offset(0, _float.value),
//                                 child: Transform.scale(
//                                   scale: _pulse.value,
//                                   child: child,
//                                 ),
//                               );
//                             },
//                             child: Container(
//                               width: 76.w,
//                               height: 76.w,
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 color: const Color(
//                                   0xFF00E5CC,
//                                 ).withOpacity(0.12),
//                                 border: Border.all(
//                                   color: const Color(
//                                     0xFF00E5CC,
//                                   ).withOpacity(0.4),
//                                   width: 1.5,
//                                 ),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: const Color(
//                                       0xFF00E5CC,
//                                     ).withOpacity(0.3),
//                                     blurRadius: 28,
//                                     spreadRadius: 4,
//                                   ),
//                                 ],
//                               ),
//                               child: Icon(
//                                 Icons.biotech_rounded,
//                                 color: const Color(0xFF00E5CC),
//                                 size: 34.sp,
//                               ),
//                             ),
//                           ),

//                           SizedBox(height: 18.h),

//                           // App name with shimmer
//                           AnimatedBuilder(
//                             animation: _shimmerController,
//                             builder: (_, child) {
//                               return ShaderMask(
//                                 shaderCallback: (bounds) {
//                                   return LinearGradient(
//                                     begin: Alignment.centerLeft,
//                                     end: Alignment.centerRight,
//                                     colors: const [
//                                       Colors.white,
//                                       Color(0xFF00E5CC),
//                                       Colors.white,
//                                     ],
//                                     stops: [
//                                       (_shimmer.value - 0.5).clamp(0.0, 1.0),
//                                       _shimmer.value.clamp(0.0, 1.0),
//                                       (_shimmer.value + 0.5).clamp(0.0, 1.0),
//                                     ],
//                                   ).createShader(bounds);
//                                 },
//                                 blendMode: BlendMode.srcIn,
//                                 child: child,
//                               );
//                             },
//                             child: Text.rich(
//                               TextSpan(
//                                 children: [
//                                   TextSpan(
//                                     text: "Siha",
//                                     style: GoogleFonts.poppins(
//                                       fontSize: 46.sp,
//                                       fontWeight: FontWeight.w300,
//                                       color: Colors.white,
//                                       letterSpacing: -2,
//                                     ),
//                                   ),
//                                   TextSpan(
//                                     text: "Health",
//                                     style: GoogleFonts.poppins(
//                                       fontSize: 46.sp,
//                                       fontWeight: FontWeight.w700,
//                                       color: Colors.white,
//                                       letterSpacing: -2,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),

//             // ── 7. Bottom card (only if userData == null) ──────────
//             if (userData == null)
//               AnimatedBuilder(
//                 animation: _cardController,
//                 builder: (_, child) {
//                   return Align(
//                     alignment: Alignment.bottomCenter,
//                     child: Transform.translate(
//                       offset: Offset(0, _cardSlide.value * 320),
//                       child: Opacity(opacity: _cardFade.value, child: child),
//                     ),
//                   );
//                 },
//                 child: _buildBottomCard(context, size),
//               ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildBottomCard(BuildContext context, Size size) {
//     return Container(
//       margin: EdgeInsets.only(bottom: 32.h, left: 18.w, right: 18.w),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(34.r),
//         gradient: LinearGradient(
//           colors: [
//             const Color(0xFF0B1628).withOpacity(0.96),
//             const Color(0xFF060E1C).withOpacity(0.98),
//           ],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//         border: Border.all(
//           color: const Color(0xFF00E5CC).withOpacity(0.18),
//           width: 1,
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: const Color(0xFF00E5CC).withOpacity(0.08),
//             blurRadius: 44,
//             spreadRadius: 2,
//             offset: const Offset(0, -8),
//           ),
//           BoxShadow(
//             color: Colors.black.withOpacity(0.55),
//             blurRadius: 34,
//             offset: const Offset(0, 12),
//           ),
//         ],
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(34.r),
//         child: BackdropFilter(
//           filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 28.h),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 // Pill handle
//                 Container(
//                   width: 38.w,
//                   height: 4.h,
//                   decoration: BoxDecoration(
//                     color: const Color(0xFF00E5CC).withOpacity(0.28),
//                     borderRadius: BorderRadius.circular(10.r),
//                   ),
//                 ),

//                 SizedBox(height: 22.h),

//                 // Welcome text
//                 Text.rich(
//                   TextSpan(
//                     children: [
//                       TextSpan(
//                         text: "Welcome to ",
//                         style: GoogleFonts.poppins(
//                           fontSize: 22.sp,
//                           fontWeight: FontWeight.w300,
//                           color: Colors.white,
//                         ),
//                       ),
//                       TextSpan(
//                         text: "Siha Health",
//                         style: GoogleFonts.poppins(
//                           fontSize: 22.sp,
//                           fontWeight: FontWeight.w700,
//                           color: const Color(0xFF00E5CC),
//                           letterSpacing: -0.5,
//                         ),
//                       ),
//                     ],
//                   ),
//                   textAlign: TextAlign.center,
//                 ),

//                 SizedBox(height: 12.h),

//                 Text(
//                   "Your complete health companion — track fitness goals, monitor nutrition, and manage your wellness journey effortlessly.",
//                   style: GoogleFonts.poppins(
//                     fontSize: 13.sp,
//                     fontWeight: FontWeight.w400,
//                     color: Colors.white.withOpacity(0.55),
//                     letterSpacing: -0.2,
//                     height: 1.65,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),

//                 SizedBox(height: 24.h),

//                 // Get Started button
//                 GestureDetector(
//                   onTapDown: (_) => setState(() => _buttonPressed = true),
//                   onTapUp: (_) {
//                     setState(() => _buttonPressed = false);
//                     Navigator.push(
//                       context,
//                       CupertinoPageRoute(builder: (_) => LoginPage()),
//                     );
//                   },
//                   onTapCancel: () => setState(() => _buttonPressed = false),
//                   child: AnimatedScale(
//                     scale: _buttonPressed ? 0.96 : 1.0,
//                     duration: const Duration(milliseconds: 110),
//                     child: Container(
//                       width: double.infinity,
//                       height: 54.h,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(16.r),
//                         gradient: const LinearGradient(
//                           colors: [Color(0xFF048A70), Color(0xFF00E5CC)],
//                           begin: Alignment.centerLeft,
//                           end: Alignment.centerRight,
//                         ),
//                         boxShadow: [
//                           BoxShadow(
//                             color: const Color(0xFF00E5CC).withOpacity(0.32),
//                             blurRadius: 22,
//                             offset: const Offset(0, 8),
//                           ),
//                         ],
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             "Get Started",
//                             style: GoogleFonts.poppins(
//                               fontSize: 15.sp,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.white,
//                               letterSpacing: 0.4,
//                             ),
//                           ),
//                           SizedBox(width: 8.w),
//                           const Icon(
//                             Icons.arrow_forward_rounded,
//                             color: Colors.white,
//                             size: 18,
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

// // ─── Stat Pill Widget ─────────────────────────────────────────────────────────
// class _StatPill extends StatelessWidget {
//   final IconData icon;
//   final String label;

//   const _StatPill({required this.icon, required this.label});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 7.h),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20.r),
//         color: const Color(0xFF00E5CC).withOpacity(0.08),
//         border: Border.all(
//           color: const Color(0xFF00E5CC).withOpacity(0.22),
//           width: 1,
//         ),
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Icon(icon, color: const Color(0xFF00E5CC), size: 12),
//           SizedBox(width: 5.w),
//           Text(
//             label,
//             style: GoogleFonts.poppins(
//               fontSize: 11.sp,
//               fontWeight: FontWeight.w500,
//               color: Colors.white.withOpacity(0.65),
//             ),
//           ),
//         ],
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
//     final rng = Random(99);
//     final paint = Paint()..style = PaintingStyle.fill;

//     for (int i = 0; i < 35; i++) {
//       final baseX = rng.nextDouble() * size.width;
//       final baseY = rng.nextDouble() * size.height;
//       final dy =
//           ((baseY - progress * size.height * 0.65) % size.height +
//               size.height) %
//           size.height;
//       final opacity = (sin((progress * 2 * pi) + i) * 0.5 + 0.5) * 0.38;
//       final radius = rng.nextDouble() * 2.0 + 0.4;

//       // Alternate between teal and white particles
//       paint.color = i.isEven
//           ? const Color(0xFF00E5CC).withOpacity(opacity)
//           : Colors.white.withOpacity(opacity * 0.4);
//       canvas.drawCircle(Offset(baseX, dy), radius, paint);
//     }
//   }

//   @override
//   bool shouldRepaint(_ParticlePainter old) => old.progress != progress;
// }

// // ─── InwardCurveClipper (kept for compatibility) ──────────────────────────────
// class InwardCurveClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     path.lineTo(0, size.height - 50);
//     path.quadraticBezierTo(
//       size.width / 2,
//       size.height + 50,
//       size.width,
//       size.height - 50,
//     );
//     path.lineTo(size.width, 0);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }
