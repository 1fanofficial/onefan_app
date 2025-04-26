// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileRequestImpl _$$UserProfileRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UserProfileRequestImpl(
      id: json['id'] as String,
      emailId: json['emailId'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      phone: json['phone'] as String,
      country: json['country'] as String,
      dob: DateTime.parse(json['dob'] as String),
    );

Map<String, dynamic> _$$UserProfileRequestImplToJson(
        _$UserProfileRequestImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'emailId': instance.emailId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'phone': instance.phone,
      'country': instance.country,
      'dob': instance.dob.toIso8601String(),
    };
