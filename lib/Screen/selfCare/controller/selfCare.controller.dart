import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shiha_health_app/config/network/api.state.dart';
import 'package:shiha_health_app/config/utils/pretty.dio.dart';
import 'package:shiha_health_app/data/controller/selfCare.provider.dart';
import 'package:shiha_health_app/data/model/selfCareDatailsResModel.dart';
import 'package:shiha_health_app/data/model/selfCareTips.res.dart';

mixin SelfCarecontroller<T extends ConsumerStatefulWidget> on ConsumerState<T> {
  String userName = '';
  String email = "";
  String id = "";
  bool isLoding = true;

  AsyncValue<List<SelfCareTipsResponse>> fetchInit() {
    return ref.watch(selfCareprovider);
  }
}

final selfCareDetailsController =
    FutureProvider.family<SelfCareDetailsResModel, String>((ref, id) async {
      final service = APIStateNetwork(createDio());
      return await service.selfCarDetails(id);
    });
