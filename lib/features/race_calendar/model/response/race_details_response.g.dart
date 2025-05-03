// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'race_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RaceDetailsResponseImpl _$$RaceDetailsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$RaceDetailsResponseImpl(
      id: json['id'] as String,
      season: (json['season'] as num).toInt(),
      round: (json['round'] as num).toInt(),
      raceName: json['raceName'] as String,
      circuitName: json['circuitName'] as String,
      laps: (json['laps'] as num).toInt(),
      trackLength: (json['trackLength'] as num).toDouble(),
      country: json['country'] as String,
      qulifyingStartTime: json['qulifyingStartTime'] == null
          ? null
          : DateTime.parse(json['qulifyingStartTime'] as String),
      raceStartTime: json['raceStartTime'] == null
          ? null
          : DateTime.parse(json['raceStartTime'] as String),
      sprintStartTime: json['sprintStartTime'] == null
          ? null
          : DateTime.parse(json['sprintStartTime'] as String),
      poleDriver: json['poleDriver'] == null
          ? null
          : DriverDetailsResponse.fromJson(
              json['poleDriver'] as Map<String, dynamic>),
      fastestLapDriver: json['fastestLapDriver'] == null
          ? null
          : DriverDetailsResponse.fromJson(
              json['fastestLapDriver'] as Map<String, dynamic>),
      raceWinner: json['raceWinner'] == null
          ? null
          : DriverDetailsResponse.fromJson(
              json['raceWinner'] as Map<String, dynamic>),
      status: json['status'] as String,
    );

Map<String, dynamic> _$$RaceDetailsResponseImplToJson(
        _$RaceDetailsResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'season': instance.season,
      'round': instance.round,
      'raceName': instance.raceName,
      'circuitName': instance.circuitName,
      'laps': instance.laps,
      'trackLength': instance.trackLength,
      'country': instance.country,
      'qulifyingStartTime': instance.qulifyingStartTime?.toIso8601String(),
      'raceStartTime': instance.raceStartTime?.toIso8601String(),
      'sprintStartTime': instance.sprintStartTime?.toIso8601String(),
      'poleDriver': instance.poleDriver,
      'fastestLapDriver': instance.fastestLapDriver,
      'raceWinner': instance.raceWinner,
      'status': instance.status,
    };
