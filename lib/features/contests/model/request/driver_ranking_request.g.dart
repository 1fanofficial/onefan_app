// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_ranking_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DriverRankingRequestImpl _$$DriverRankingRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$DriverRankingRequestImpl(
      driverId: json['driverId'] as String,
      predictedPosition: (json['predictedPosition'] as num).toInt(),
    );

Map<String, dynamic> _$$DriverRankingRequestImplToJson(
        _$DriverRankingRequestImpl instance) =>
    <String, dynamic>{
      'driverId': instance.driverId,
      'predictedPosition': instance.predictedPosition,
    };
