import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onefan_app/features/contests/model/response/driver_details_response.dart';

part 'race_details_response.g.dart';
part 'race_details_response.freezed.dart';

enum RaceStatus { upcoming, live, completed }

List<RaceDetailsResponse> parseRaceDetailsList(List<dynamic> jsonList) {
  return jsonList.map((json) => RaceDetailsResponse.fromJson(json as Map<String, dynamic>)).toList();
}

@freezed
class RaceDetailsResponse with _$RaceDetailsResponse {
  const factory RaceDetailsResponse({
    required String id,
    required int season,
    required int round,
    required String raceName,
    required String circuitName,
    required int laps,
    required double trackLength,
    required String country,
    DateTime? qulifyingStartTime,
    DateTime? raceStartTime,
    DateTime? sprintStartTime,
    DriverDetailsResponse? poleDriver,
    DriverDetailsResponse? fastestLapDriver,
    DriverDetailsResponse? raceWinner,
    required String status,
  }) = _RaceDetailsResponse;

  factory RaceDetailsResponse.fromJson(Map<String, dynamic> json) => _$RaceDetailsResponseFromJson(json);
}
