import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shiha_health_app/data/controller/doctorsList.provider.dart';
import 'package:shiha_health_app/data/model/doctorsList.response.dart';

mixin DoctorListController<T extends ConsumerStatefulWidget>
    on ConsumerState<T> {
  bool isSearching = false;
  String searchQuery = "";
  TextEditingController searchController = TextEditingController();

  AsyncValue<List<DoctorsListResponse>> initData() {
    return ref.watch(doctorsListProvider);
  }

  List<DoctorsListResponse> searchFunction({
    required List<DoctorsListResponse> data,
  }) {
    return data.where((doctor) {
      final nameMatch = doctor.fullName.toLowerCase().contains(
        searchQuery.toLowerCase(),
      );
      final specialtyMatch = doctor.specialty.toLowerCase().contains(
        searchQuery.toLowerCase(),
      );
      return nameMatch || specialtyMatch;
    }).toList();
  }

  void clearSeaarch() {
    if (isSearching) {
      setState(() {
        isSearching = false;
        searchQuery = "";
        searchController.clear();
      });
    } else {
      Navigator.pop(context);
    }
  }

  
}
