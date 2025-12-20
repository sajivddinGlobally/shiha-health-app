// import 'dart:developer';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:shiha_health_app/Screen/selfCare/controller/selfCare.controller.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// class SelfCareDetailsPage extends ConsumerStatefulWidget {
//   final String id;
//   const SelfCareDetailsPage({super.key, required this.id});

//   @override
//   ConsumerState<SelfCareDetailsPage> createState() =>
//       _SelfCareDetailsPageState();
// }

// class _SelfCareDetailsPageState extends ConsumerState<SelfCareDetailsPage> {
//   YoutubePlayerController? _youtubeController;

//   void _initYoutubePlayer(String url) {
//     final videoId = YoutubePlayer.convertUrlToId(url);
//     if (videoId == null) return;

//     _youtubeController = YoutubePlayerController(
//       initialVideoId: videoId,
//       flags: const YoutubePlayerFlags(
//         autoPlay: false,
//         mute: false,
//         controlsVisibleAtStart: true,
//         enableCaption: false,
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final selfCareData = ref.watch(selfCareDetailsController(widget.id));
//     return Scaffold(
//       body: Stack(
//         children: [
//           Image.asset(
//             "assets/homebg.png",
//             width: MediaQuery.of(context).size.width,
//             fit: BoxFit.fill,
//           ),
//           Align(
//             alignment: AlignmentGeometry.topLeft,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(height: 30.h),
//                 Row(
//                   children: [
//                     SizedBox(width: 20.w),
//                     IconButton(
//                       style: IconButton.styleFrom(
//                         padding: EdgeInsets.zero,
//                         minimumSize: const Size(0, 0),
//                         tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                       ),
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                       icon: const Icon(
//                         Icons.arrow_back_ios,
//                         color: Colors.white,
//                       ),
//                     ),
//                     SizedBox(width: 10.w),
//                     Text(
//                       "Self Care Details",
//                       style: GoogleFonts.poppins(
//                         fontSize: 18.sp,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.white,
//                       ),
//                     ),
//                     const Spacer(),
//                     // IconButton(
//                     //   style: IconButton.styleFrom(
//                     //     padding: EdgeInsets.zero,
//                     //     minimumSize: const Size(0, 0),
//                     //     tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                     //   ),
//                     //   onPressed: () {},
//                     //   icon: const Icon(Icons.search, color: Colors.white),
//                     // ),
//                     SizedBox(width: 20.w),
//                   ],
//                 ),
//                 SizedBox(height: 20.h),
//                 selfCareData.when(
//                   data: (snap) {
//                     return SingleChildScrollView(
//                       padding: EdgeInsets.all(18.w),
//                       child: Container(
//                         padding: EdgeInsets.all(18.w),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(18.r),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black12,
//                               blurRadius: 8,
//                               offset: Offset(0, 4),
//                             ),
//                           ],
//                         ),

//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             /// Title
//                             Text(
//                               snap.title,
//                               style: GoogleFonts.poppins(
//                                 fontSize: 22.sp,
//                                 fontWeight: FontWeight.w700,
//                                 color: Colors.black87,
//                               ),
//                             ),

//                             SizedBox(height: 20.h),

//                             /// Description
//                             Text(
//                               snap.description,
//                               style: GoogleFonts.poppins(
//                                 fontSize: 14.sp,
//                                 height: 1.5,
//                                 color: Colors.black54,
//                               ),
//                             ),

//                             SizedBox(height: 30.h),

//                             /// Video Player
//                             if (_youtubeController != null)
//                               YoutubePlayer(
//                                 controller: _youtubeController!,
//                                 showVideoProgressIndicator: true,
//                                 progressIndicatorColor: Colors.blueAccent,
//                               )
//                             else
//                               Center(child: CircularProgressIndicator()),

//                             SizedBox(height: 20.h),

//                             /// Optional: Play Button if you want to keep a manual play trigger
//                             if (_youtubeController != null)
//                               InkWell(
//                                 onTap: () {
//                                   _youtubeController!.play();
//                                 },
//                                 child: Container(
//                                   width: double.infinity,
//                                   padding: EdgeInsets.symmetric(vertical: 14.h),
//                                   decoration: BoxDecoration(
//                                     color: Colors.blueAccent,
//                                     borderRadius: BorderRadius.circular(14.r),
//                                   ),
//                                   alignment: Alignment.center,
//                                   child: Text(
//                                     "Play Video",
//                                     style: GoogleFonts.poppins(
//                                       fontSize: 16.sp,
//                                       fontWeight: FontWeight.w600,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                   error: (error, stackTrace) {
//                     log(stackTrace.toString());
//                     return Center(
//                       child: Text(
//                         error.toString(),
//                         style: GoogleFonts.poppins(
//                           fontSize: 15.sp,
//                           fontWeight: FontWeight.w400,
//                           color: Colors.white,
//                         ),
//                       ),
//                     );
//                   },
//                   loading: () => Center(
//                     child: CircularProgressIndicator(color: Colors.white),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shiha_health_app/Screen/selfCare/controller/selfCare.controller.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class SelfCareDetailsPage extends ConsumerStatefulWidget {
  final String id;
  const SelfCareDetailsPage({super.key, required this.id});

  @override
  ConsumerState<SelfCareDetailsPage> createState() =>
      _SelfCareDetailsPageState();
}

class _SelfCareDetailsPageState extends ConsumerState<SelfCareDetailsPage> {
  YoutubePlayerController? _youtubeController;

  void _initYoutubePlayer(String url) {
    final videoId = YoutubePlayer.convertUrlToId(url);
    if (videoId == null) return;

    _youtubeController = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        controlsVisibleAtStart: true,
        enableCaption: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final selfCareData = ref.watch(selfCareDetailsController(widget.id));

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/homebg.png",
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),

          /// MAIN CONTENT
          Align(
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.h),

                /// HEADER
                Row(
                  children: [
                    SizedBox(width: 20.w),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      "Self Care Details",
                      style: GoogleFonts.poppins(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    SizedBox(width: 20.w),
                  ],
                ),

                SizedBox(height: 20.h),

                selfCareData.when(
                  data: (snap) {
                    if (_youtubeController == null) {
                      _initYoutubePlayer(snap.videoUrl);

                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        if (mounted) setState(() {});
                      });
                    }

                    return Expanded(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.all(18.w),
                        child: Container(
                          padding: EdgeInsets.all(18.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// Title
                              Text(
                                snap.title,
                                style: GoogleFonts.poppins(
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black87,
                                ),
                              ),

                              SizedBox(height: 20.h),

                              /// Description
                              Text(
                                snap.description,
                                style: GoogleFonts.poppins(
                                  fontSize: 14.sp,
                                  height: 1.5,
                                  color: Colors.black54,
                                ),
                              ),

                              SizedBox(height: 30.h),

                              /// VIDEO PLAYER
                              if (_youtubeController != null)
                                YoutubePlayer(
                                  controller: _youtubeController!,
                                  showVideoProgressIndicator: true,
                                  progressIndicatorColor: Colors.blueAccent,
                                )
                              else
                                Center(child: CircularProgressIndicator()),

                              SizedBox(height: 20.h),

                              /// Play Button (optional)
                              if (_youtubeController != null)
                                InkWell(
                                  onTap: () => _youtubeController!.play(),
                                  child: Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.symmetric(
                                      vertical: 14.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.blueAccent,
                                      borderRadius: BorderRadius.circular(14.r),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Play Video",
                                      style: GoogleFonts.poppins(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
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
                  loading: () => const Center(
                    child: CircularProgressIndicator(color: Colors.white),
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
