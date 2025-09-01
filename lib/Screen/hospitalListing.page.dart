import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shiha_health_app/Screen/hospitalDetails.page.dart';
import 'package:shiha_health_app/data/controller/hospitalList.provider.dart';

class HospitalListingPage extends ConsumerStatefulWidget {
  const HospitalListingPage({super.key});

  @override
  ConsumerState<HospitalListingPage> createState() =>
      _HospitalListingPageState();
}

class _HospitalListingPageState extends ConsumerState<HospitalListingPage> {
  TextEditingController searchController = TextEditingController();
  String searchQuery = "";
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    final hospitalList = ref.watch(hospitalListResponse);

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/homebg.png",
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
          hospitalList.when(
            data: (snap) {
              /// ✅ Apply search filter
              final filteredList = snap.where((hospital) {
                final name = (hospital.name ?? "").toLowerCase();
                final location = (hospital.location ?? "").toLowerCase();
                final fees =
                    (hospital.consultationPriceRange ?? "").toLowerCase();

                return name.contains(searchQuery.toLowerCase()) ||
                    location.contains(searchQuery.toLowerCase()) ||
                    fees.contains(searchQuery.toLowerCase());
              }).toList();

              return Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30.h),

                    /// 🔹 AppBar with Search
                    Row(
                      children: [
                        SizedBox(width: 20.w),
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                        ),
                        SizedBox(width: 10.w),

                        /// Title / Search Field
                        Expanded(
                          child: isSearching
                              ? TextField(
                                  controller: searchController,
                                  autofocus: true,
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: "Search hospitals...",
                                    hintStyle: GoogleFonts.poppins(
                                      color: Colors.white70,
                                      fontSize: 14.sp,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                  onChanged: (val) {
                                    setState(() {
                                      searchQuery = val;
                                    });
                                  },
                                )
                              : Text(
                                  "Book Hospitals",
                                  style: GoogleFonts.poppins(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                        ),

                        /// Search / Close Button
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (isSearching) {
                                isSearching = false;
                                searchQuery = "";
                                searchController.clear();
                              } else {
                                isSearching = true;
                              }
                            });
                          },
                          icon: Icon(
                            isSearching ? Icons.close : Icons.search,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 20.w),
                      ],
                    ),

                    SizedBox(height: 20.h),

                    /// Filter chips
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          SizedBox(width: 20.w),
                          buildFilter(name: "Speciality"),
                          SizedBox(width: 8.w),
                          buildFilter(name: "Price"),
                          SizedBox(width: 8.w),
                          buildFilter(name: "Availability"),
                          SizedBox(width: 8.w),
                          buildFilter(name: "Rating"),
                          SizedBox(width: 8.w),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),

                    /// ✅ Hospital Grid (Filtered)
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: filteredList.isEmpty
                            ? Center(
                                child: Text(
                                  "No hospitals found",
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              )
                            : GridView.builder(
                                padding: EdgeInsets.zero,
                                itemCount: filteredList.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 15.h,
                                  crossAxisSpacing: 15.w,
                                  childAspectRatio: 0.80,
                                ),
                                itemBuilder: (context, index) {
                                  final hospital = filteredList[index];
                                  return buildHospitalCard(hospital);
                                },
                              ),
                      ),
                    ),
                  ],
                ),
              );
            },
            error: (err, stack) => Center(child: Text("$err")),
            loading: () => Center(
              child: CircularProgressIndicator(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  /// Card Widget
  Widget buildHospitalCard(dynamic hospital) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Image
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) =>
                      HospitalDetailsPage(id: hospital.id.toString()),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Image.network(
                "http://sihahealth.globallywebsolutions.com${hospital.images[0]}",
                fit: BoxFit.cover,
                width: double.infinity,
                height: 100.h,
                errorBuilder: (context, error, stackTrace) =>
                    Icon(Icons.broken_image, size: 40.sp),
              ),
            ),
          ),
          SizedBox(height: 8.h),

          /// Location + Rating
          Row(
            children: [
              Flexible(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.r),
                    color: Color.fromARGB(25, 0, 132, 255),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.location_on,
                          color: Color(0xFF067594), size: 14.sp),
                      Flexible(
                        child: Text(
                          hospital.location ?? "",
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF067594),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 6.w),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.r),
                  color: Color.fromARGB(25, 255, 191, 9),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.star, color: Color(0xFFFFBF00), size: 14.sp),
                    Text(
                      hospital.rating == null
                          ? "-"
                          : hospital.rating!.toStringAsFixed(1),
                      style: GoogleFonts.poppins(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFFFBF00),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 6.h),

          /// Hospital Name
          Text(
            hospital.name ?? "",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.poppins(
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 6.h),

          /// Price
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "${hospital.name ?? ""} • ",
                  style: GoogleFonts.poppins(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade300,
                  ),
                ),
                TextSpan(
                  text: hospital.consultationPriceRange ?? "",
                  style: GoogleFonts.poppins(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF067594),
                  ),
                ),
              ],
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

/// Filter Chip UI
class buildFilter extends StatelessWidget {
  final String name;
  const buildFilter({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15.w, right: 10.w, top: 3.h, bottom: 3.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: Colors.white, width: 1.w),
      ),
      child: Row(
        children: [
          Text(
            name,
            style: GoogleFonts.poppins(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white,
              letterSpacing: -0.4,
            ),
          ),
          SizedBox(width: 5.w),
          Icon(Icons.keyboard_arrow_down_outlined,
              color: Colors.white, size: 20.sp),
        ],
      ),
    );
  }
}
