// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DriverDetailsResponseImpl _$$DriverDetailsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$DriverDetailsResponseImpl(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      driverCode: json['driverCode'] as String,
      team: TeamDetailsResponse.fromJson(json['team'] as Map<String, dynamic>),
      carNumber: (json['carNumber'] as num).toInt(),
      nationality: json['nationality'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$$DriverDetailsResponseImplToJson(
        _$DriverDetailsResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'driverCode': instance.driverCode,
      'team': instance.team,
      'carNumber': instance.carNumber,
      'nationality': instance.nationality,
      'status': instance.status,
    };
