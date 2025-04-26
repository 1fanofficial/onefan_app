// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileResponseImpl _$$UserProfileResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$UserProfileResponseImpl(
      id: json['id'] as String,
      emailId: json['emailId'] as String,
      phone: json['phone'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      country: json['country'] as String,
      dob: DateTime.parse(json['dob'] as String),
    );

Map<String, dynamic> _$$UserProfileResponseImplToJson(
        _$UserProfileResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'emailId': instance.emailId,
      'phone': instance.phone,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'country': instance.country,
      'dob': instance.dob.toIso8601String(),
    };
