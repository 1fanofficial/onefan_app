import 'package:freezed_annotation/freezed_annotation.dart';

part 'team_details_response.g.dart';
part 'team_details_response.freezed.dart';

@freezed
class TeamDetailsResponse with _$TeamDetailsResponse {
  const factory TeamDetailsResponse({
    required String id,
    required String name,
    required String teamCode,
    required String teamColor,
    required String gradientOne,
    required String gradientTwo,
  }) = _TeamDetailsResponse;

  factory TeamDetailsResponse.fromJson(Map<String, dynamic> json) => _$TeamDetailsResponseFromJson(json);
}
