import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shiha_health_app/config/network/api.state.dart';
import 'package:shiha_health_app/config/utils/pretty.dio.dart';
import 'package:shiha_health_app/data/model/getDonationDetailsRequestModel.dart';
import 'package:shiha_health_app/data/model/getDonationRequestModel.dart';

final getDonationRequestController =
    FutureProvider<List<GetDonationRequestModel>>((ref) async {
      final service = APIStateNetwork(createDio());
      return await service.getDonationRequest();
    });

final getDonationDetailsRequestController =
    FutureProvider.family<GetDonationDetailsRequestModel, String>((
      ref,
      id,
    ) async {
      final service = APIStateNetwork(createDio());
      return await service.getDonationDetailsRequest(id);
    });
