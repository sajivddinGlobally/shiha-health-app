// Flutter: No Internet Connection - Professional flat modern UI widget
// Filename: no_internet_connection_widget.dart
// Description: Reusable, responsive "No Internet Connection" full-screen widget
// with a flat, professional illustration, primary action (Retry), and secondary action.
// Usage: Copy this file into your Flutter project and use NoInternetConnectionWidget()

import 'package:flutter/material.dart';

/// Example usage:
///
/// void main() => runApp(const MyApp());
///
/// class MyApp extends StatelessWidget {
///   const MyApp({super.key});
///   @override
///   Widget build(BuildContext context) => MaterialApp(
///         home: Scaffold(
///           body: NoInternetConnectionWidget(
///             onRetry: () async {
///               // try to reconnect...
///             },
///             onReport: () {
///               // optional: open feedback or diagnostics
///             },
///           ),
///         ),
///       );
/// }

class NoInternetConnectionWidget extends StatelessWidget {
  final VoidCallback? onRetry;
  final VoidCallback? onReport;
  final String title;
  final String message;
  final Color primaryColor;
  final Color backgroundColor;

  const NoInternetConnectionWidget({
    Key? key,
    this.onRetry,
    this.onReport,
    this.title = 'No internet connection',
    this.message = 'Please check your network settings and try again.',
    this.primaryColor = const Color(0xFF175CD3), // modern blue
    this.backgroundColor = const Color.fromARGB(0, 246, 248, 251), // very light grey-blue
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final isLandscape = media.size.width > media.size.height;
    final illustrationSize = isLandscape
        ? media.size.height * 0.45
        : media.size.width * 0.7;

    return SafeArea(
      child: Stack(
        children: [
          Image.asset(
            "assets/homebg.png",
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              color: backgroundColor,
              width: double.infinity,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 32.0,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Illustration
                      SizedBox(
                        width: illustrationSize,
                        height: illustrationSize,
                        child: _FlatIllustration(color: Colors.white),
                      ),
                      const SizedBox(height: 28),

                      // Title
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(221, 255, 255, 255),
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Message
                      Text(
                        message,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: const Color.fromARGB(137, 255, 255, 255),
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Actions
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ElevatedButton(
                            onPressed: onRetry,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              foregroundColor: Colors.white,
                              elevation: 0,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 14,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text('Retry'),
                          ),
                          const SizedBox(width: 12),
                          TextButton(
                            onPressed: onReport,
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.black54,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 14,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text('Report issue'),
                          ),
                        ],
                      ),
                    ],
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


class _FlatIllustration extends StatelessWidget {
  final Color color;
  const _FlatIllustration({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
      builder: (context, constraints) {
        final w = constraints.maxWidth;
        final h = constraints.maxHeight;

        return Stack(
          alignment: Alignment.center,
          children: [
 
            Positioned(
              top: h * 0.08,
              child: Container(
                width: w * 0.92,
                height: h * 0.72,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 18,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
              ),
            ),


            Positioned(
              top: h * 0.02,
              child: Container(
                width: w * 0.64,
                height: h * 0.36,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: color.withOpacity(0.08),
                ),
                child: Center(
                  child: Container(
                    width: w * 0.42,
                    height: h * 0.18,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: color.withOpacity(0.12),
                    ),
                  ),
                ),
              ),
            ),


            Positioned(
              bottom: h * 0.18,
              child: SizedBox(
                width: w * 0.56,
                height: h * 0.28,
                child: CustomPaint(painter: _WifiPainter(color: color)),
              ),
            ),


            Positioned(
              bottom: h * 0.06,
              right: w * 0.12,
              child: Container(
                width: w * 0.16,
                height: w * 0.16,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: color.withOpacity(0.14), width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Center(
                  child: Icon(Icons.wifi_off, size: w * 0.08, color: color),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _WifiPainter extends CustomPainter {
  final Color color;
  _WifiPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height * 0.55);

 
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..color = color
      ..strokeWidth = size.width * 0.07;

    final gap = size.width * 0.06;


    final rectOuter = Rect.fromCircle(
      center: center,
      radius: size.width * 0.42,
    );
    canvas.drawArc(rectOuter, 3.9, 1.5, false, paint);


    final rectMid = Rect.fromCircle(center: center, radius: size.width * 0.28);
    canvas.drawArc(
      rectMid,
      3.9,
      1.5,
      false,
      paint..strokeWidth = size.width * 0.06,
    );


    final rectInner = Rect.fromCircle(
      center: center,
      radius: size.width * 0.15,
    );
    canvas.drawArc(
      rectInner,
      3.9,
      1.5,
      false,
      paint..strokeWidth = size.width * 0.055,
    );


    final dotPaint = Paint()..color = color.withOpacity(0.9);
    canvas.drawCircle(
      Offset(center.dx, center.dy + size.height * 0.18),
      size.width * 0.032,
      dotPaint,
    );

    final crossPaint = Paint()
      ..color = color
      ..strokeWidth = size.width * 0.05
      ..strokeCap = StrokeCap.round;

    final crossSize = size.width * 0.22;
    canvas.drawLine(
      Offset(center.dx - crossSize, center.dy - crossSize * 0.25),
      Offset(center.dx + crossSize, center.dy + crossSize * 0.25),
      crossPaint,
    );
    canvas.drawLine(
      Offset(center.dx - crossSize, center.dy + crossSize * 0.25),
      Offset(center.dx + crossSize, center.dy - crossSize * 0.25),
      crossPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}


