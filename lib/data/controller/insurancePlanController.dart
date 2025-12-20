import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shiha_health_app/config/network/api.state.dart';
import 'package:shiha_health_app/config/utils/pretty.dio.dart';
import 'package:shiha_health_app/data/model/insurancePlanResModel.dart';
import 'package:shiha_health_app/data/model/userInsurancePlanResModel.dart';

final insurancePlanController = FutureProvider<List<InsurancePlanResModel>>((
  ref,
) async {
  final service = APIStateNetwork(createDio());
  return await service.insurancePlan();
});

final userInsuranceController = FutureProvider<List<UserInsurancePlanResModel>>(
  (ref) async {
    final service = APIStateNetwork(createDio());
    return await service.userInsurancePlan();
  },
);
