// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contest_entry_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContestEntryRequestImpl _$$ContestEntryRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$ContestEntryRequestImpl(
      contestId: json['contestId'] as String,
      fastestLapDriverId: json['fastestLapDriverId'] as String,
      driverRankings: (json['driverRankings'] as List<dynamic>)
          .map((e) => DriverRankingRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ContestEntryRequestImplToJson(
        _$ContestEntryRequestImpl instance) =>
    <String, dynamic>{
      'contestId': instance.contestId,
      'fastestLapDriverId': instance.fastestLapDriverId,
      'driverRankings': instance.driverRankings,
    };
