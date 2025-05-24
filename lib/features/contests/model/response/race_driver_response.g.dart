// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'race_driver_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RaceDriverResponseImpl _$$RaceDriverResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$RaceDriverResponseImpl(
      id: json['id'] as String,
      driver: DriverDetailsResponse.fromJson(
          json['driver'] as Map<String, dynamic>),
      race: RaceDetailsResponse.fromJson(json['race'] as Map<String, dynamic>),
      finishPosition: (json['finishPosition'] as num).toInt(),
      startPosition: (json['startPosition'] as num).toInt(),
      pitStops: (json['pitStops'] as num).toInt(),
      finishStatus: json['finishStatus'] as String,
      lapsCompleted: (json['lapsCompleted'] as num).toInt(),
      overtakes: (json['overtakes'] as num).toInt(),
      pointsEarned: (json['pointsEarned'] as num).toInt(),
    );

Map<String, dynamic> _$$RaceDriverResponseImplToJson(
        _$RaceDriverResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'driver': instance.driver,
      'race': instance.race,
      'finishPosition': instance.finishPosition,
      'startPosition': instance.startPosition,
      'pitStops': instance.pitStops,
      'finishStatus': instance.finishStatus,
      'lapsCompleted': instance.lapsCompleted,
      'overtakes': instance.overtakes,
      'pointsEarned': instance.pointsEarned,
    };
