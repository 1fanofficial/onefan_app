import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onefan_app/features/race_calendar/model/response/team_details_response.dart';

part 'driver_details_response.g.dart';
part 'driver_details_response.freezed.dart';

@freezed
class DriverDetailsResponse with _$DriverDetailsResponse {
  const factory DriverDetailsResponse({
    required String id,
    required String firstName,
    required String lastName,
    required String driverCode,
    required TeamDetailsResponse teamDetails,
    required int carNumber,
    required String nationality,
    required String status,
  }) = _DriverDetailsResponse;

  factory DriverDetailsResponse.fromJson(Map<String, dynamic> json) => _$DriverDetailsResponseFromJson(json);
}
