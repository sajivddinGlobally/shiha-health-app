

import 'package:riverpod/riverpod.dart';
import 'package:shiha_health_app/config/network/api.state.dart';
import 'package:shiha_health_app/config/utils/pretty.dio.dart';

final doctorDetailProvider = FutureProvider.family((ref, body)async {
final api = APIStateNetwork( createDio());
return await api.getDoctorDetail(body.toString());
});