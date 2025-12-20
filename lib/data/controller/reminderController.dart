import 'package:riverpod/riverpod.dart';
import 'package:shiha_health_app/config/network/api.state.dart';
import 'package:shiha_health_app/config/utils/pretty.dio.dart';
import 'package:shiha_health_app/data/model/reminderResModel.dart';

final reminderController = FutureProvider<List<ReminderResModel>>((ref) async {
  final service = APIStateNetwork(createDio());
  return await service.reminderGetData();
});
