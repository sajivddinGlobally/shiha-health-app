import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shiha_health_app/data/controller/selfCare.provider.dart';
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
