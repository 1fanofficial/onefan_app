// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserProfileResponse _$UserProfileResponseFromJson(Map<String, dynamic> json) {
  return _UserProfileResponse.fromJson(json);
}

/// @nodoc
mixin _$UserProfileResponse {
  String get id => throw _privateConstructorUsedError;
  String get emailId => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;
  DateTime get dob => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserProfileResponseCopyWith<UserProfileResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileResponseCopyWith<$Res> {
  factory $UserProfileResponseCopyWith(
          UserProfileResponse value, $Res Function(UserProfileResponse) then) =
      _$UserProfileResponseCopyWithImpl<$Res, UserProfileResponse>;
  @useResult
  $Res call(
      {String id,
      String emailId,
      String phone,
      String firstName,
      String lastName,
      String country,
      DateTime dob});
}

/// @nodoc
class _$UserProfileResponseCopyWithImpl<$Res, $Val extends UserProfileResponse>
    implements $UserProfileResponseCopyWith<$Res> {
  _$UserProfileResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? emailId = null,
    Object? phone = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? country = null,
    Object? dob = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      emailId: null == emailId
          ? _value.emailId
          : emailId // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      dob: null == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserProfileResponseImplCopyWith<$Res>
    implements $UserProfileResponseCopyWith<$Res> {
  factory _$$UserProfileResponseImplCopyWith(_$UserProfileResponseImpl value,
          $Res Function(_$UserProfileResponseImpl) then) =
      __$$UserProfileResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String emailId,
      String phone,
      String firstName,
      String lastName,
      String country,
      DateTime dob});
}

/// @nodoc
class __$$UserProfileResponseImplCopyWithImpl<$Res>
    extends _$UserProfileResponseCopyWithImpl<$Res, _$UserProfileResponseImpl>
    implements _$$UserProfileResponseImplCopyWith<$Res> {
  __$$UserProfileResponseImplCopyWithImpl(_$UserProfileResponseImpl _value,
      $Res Function(_$UserProfileResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? emailId = null,
    Object? phone = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? country = null,
    Object? dob = null,
  }) {
    return _then(_$UserProfileResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      emailId: null == emailId
          ? _value.emailId
          : emailId // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      dob: null == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserProfileResponseImpl implements _UserProfileResponse {
  const _$UserProfileResponseImpl(
      {required this.id,
      required this.emailId,
      required this.phone,
      required this.firstName,
      required this.lastName,
      required this.country,
      required this.dob});

  factory _$UserProfileResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProfileResponseImplFromJson(json);

  @override
  final String id;
  @override
  final String emailId;
  @override
  final String phone;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String country;
  @override
  final DateTime dob;

  @override
  String toString() {
    return 'UserProfileResponse(id: $id, emailId: $emailId, phone: $phone, firstName: $firstName, lastName: $lastName, country: $country, dob: $dob)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.emailId, emailId) || other.emailId == emailId) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.dob, dob) || other.dob == dob));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, emailId, phone, firstName, lastName, country, dob);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileResponseImplCopyWith<_$UserProfileResponseImpl> get copyWith =>
      __$$UserProfileResponseImplCopyWithImpl<_$UserProfileResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProfileResponseImplToJson(
      this,
    );
  }
}

abstract class _UserProfileResponse implements UserProfileResponse {
  const factory _UserProfileResponse(
      {required final String id,
      required final String emailId,
      required final String phone,
      required final String firstName,
      required final String lastName,
      required final String country,
      required final DateTime dob}) = _$UserProfileResponseImpl;

  factory _UserProfileResponse.fromJson(Map<String, dynamic> json) =
      _$UserProfileResponseImpl.fromJson;

  @override
  String get id;
  @override
  String get emailId;
  @override
  String get phone;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get country;
  @override
  DateTime get dob;
  @override
  @JsonKey(ignore: true)
  _$$UserProfileResponseImplCopyWith<_$UserProfileResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
