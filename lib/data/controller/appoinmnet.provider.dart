

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shiha_health_app/config/network/api.state.dart';
import 'package:shiha_health_app/config/utils/pretty.dio.dart';

final appoinmentProvider = FutureProvider.family((ref, id) async {
final api = APIStateNetwork(await createDio());
return await api.fetchUserAppoinment(id.toString());
});
