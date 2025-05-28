import 'package:freezed_annotation/freezed_annotation.dart';

part 'driver_ranking_request.g.dart';
part 'driver_ranking_request.freezed.dart';

@freezed
class DriverRankingRequest with _$DriverRankingRequest {
  const factory DriverRankingRequest({
    required String driverId,
    required int predictedPosition,
  }) = _DriverRankingRequest;

  factory DriverRankingRequest.fromJson(Map<String, dynamic> json) => _$DriverRankingRequestFromJson(json);
}
