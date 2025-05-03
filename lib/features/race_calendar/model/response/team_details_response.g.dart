// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TeamDetailsResponseImpl _$$TeamDetailsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$TeamDetailsResponseImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      teamCode: json['teamCode'] as String,
      teamColor: json['teamColor'] as String,
    );

Map<String, dynamic> _$$TeamDetailsResponseImplToJson(
        _$TeamDetailsResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'teamCode': instance.teamCode,
      'teamColor': instance.teamColor,
    };
