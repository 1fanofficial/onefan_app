import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onefan_app/features/contests/model/request/driver_ranking_request.dart';

part 'contest_entry_request.g.dart';
part 'contest_entry_request.freezed.dart';

@freezed
class ContestEntryRequest with _$ContestEntryRequest {
  const factory ContestEntryRequest({
    required String contestId,
    required String fastestLapDriverId,
    required List<DriverRankingRequest> driverRankings,
  }) = _ContestEntryRequest;

  factory ContestEntryRequest.fromJson(Map<String, dynamic> json) => _$ContestEntryRequestFromJson(json);
}
