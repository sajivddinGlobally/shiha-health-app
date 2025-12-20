import 'dart:developer';

import 'package:riverpod/riverpod.dart';
import 'package:shiha_health_app/config/network/api.state.dart';
import 'package:shiha_health_app/config/utils/pretty.dio.dart';

final userDetailProvider = FutureProvider.family((ref, id) async {
  final api = APIStateNetwork(await createDio());
  return await api.usereDetails(id.toString());
});
