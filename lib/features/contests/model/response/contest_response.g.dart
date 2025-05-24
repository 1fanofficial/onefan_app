// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contest_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContestDetailsResponseImpl _$$ContestDetailsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ContestDetailsResponseImpl(
      id: json['id'] as String,
      contestName: json['contestName'] as String,
      raceDetails: RaceDetailsResponse.fromJson(
          json['raceDetails'] as Map<String, dynamic>),
      entryFees: (json['entryFees'] as num).toInt(),
      deadline: DateTime.parse(json['deadline'] as String),
      prizePool: (json['prizePool'] as num).toInt(),
      entries: (json['entries'] as num).toInt(),
      maxEntries: (json['maxEntries'] as num).toInt(),
      status: json['status'] as String,
      hasJoined: json['hasJoined'] as bool,
    );

Map<String, dynamic> _$$ContestDetailsResponseImplToJson(
        _$ContestDetailsResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'contestName': instance.contestName,
      'raceDetails': instance.raceDetails,
      'entryFees': instance.entryFees,
      'deadline': instance.deadline.toIso8601String(),
      'prizePool': instance.prizePool,
      'entries': instance.entries,
      'maxEntries': instance.maxEntries,
      'status': instance.status,
      'hasJoined': instance.hasJoined,
    };
