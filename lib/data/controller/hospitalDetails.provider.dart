

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image/image.dart';
import 'package:shiha_health_app/config/network/api.state.dart';
import 'package:shiha_health_app/config/utils/pretty.dio.dart';

final hospitalDetailsProvider = FutureProvider.family((ref, id) async {
final api = APIStateNetwork(createDio());
return await api.fetchHospitalsDetails(id.toString());
});