import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onefan_app/features/contests/model/response/driver_details_response.dart';
import 'package:onefan_app/features/race_calendar/model/response/race_details_response.dart';

part 'race_driver_response.g.dart';
part 'race_driver_response.freezed.dart';

List<RaceDriverResponse> parceRaceDriversList(List<dynamic> jsonList) {
  return jsonList.map((json) => RaceDriverResponse.fromJson(json as Map<String, dynamic>)).toList();
}

@freezed
class RaceDriverResponse with _$RaceDriverResponse {
  const factory RaceDriverResponse({
    required String id,
    required DriverDetailsResponse driver,
    required RaceDetailsResponse race,
    required int finishPosition,
    required int startPosition,
    required int pitStops,
    required String finishStatus,
    required int lapsCompleted,
    required int overtakes,
    required int pointsEarned,
  }) = _RaceDriverResponse;

  factory RaceDriverResponse.fromJson(Map<String, dynamic> json) => _$RaceDriverResponseFromJson(json);
}
