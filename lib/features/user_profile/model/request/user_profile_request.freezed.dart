// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserProfileRequest _$UserProfileRequestFromJson(Map<String, dynamic> json) {
  return _UserProfileRequest.fromJson(json);
}

/// @nodoc
mixin _$UserProfileRequest {
  String get id => throw _privateConstructorUsedError;
  String get emailId => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;
  DateTime get dob => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserProfileRequestCopyWith<UserProfileRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileRequestCopyWith<$Res> {
  factory $UserProfileRequestCopyWith(
          UserProfileRequest value, $Res Function(UserProfileRequest) then) =
      _$UserProfileRequestCopyWithImpl<$Res, UserProfileRequest>;
  @useResult
  $Res call(
      {String id,
      String emailId,
      String firstName,
      String lastName,
      String phone,
      String country,
      DateTime dob});
}

/// @nodoc
class _$UserProfileRequestCopyWithImpl<$Res, $Val extends UserProfileRequest>
    implements $UserProfileRequestCopyWith<$Res> {
  _$UserProfileRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? emailId = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? phone = null,
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
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
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
abstract class _$$UserProfileRequestImplCopyWith<$Res>
    implements $UserProfileRequestCopyWith<$Res> {
  factory _$$UserProfileRequestImplCopyWith(_$UserProfileRequestImpl value,
          $Res Function(_$UserProfileRequestImpl) then) =
      __$$UserProfileRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String emailId,
      String firstName,
      String lastName,
      String phone,
      String country,
      DateTime dob});
}

/// @nodoc
class __$$UserProfileRequestImplCopyWithImpl<$Res>
    extends _$UserProfileRequestCopyWithImpl<$Res, _$UserProfileRequestImpl>
    implements _$$UserProfileRequestImplCopyWith<$Res> {
  __$$UserProfileRequestImplCopyWithImpl(_$UserProfileRequestImpl _value,
      $Res Function(_$UserProfileRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? emailId = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? phone = null,
    Object? country = null,
    Object? dob = null,
  }) {
    return _then(_$UserProfileRequestImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      emailId: null == emailId
          ? _value.emailId
          : emailId // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
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
class _$UserProfileRequestImpl implements _UserProfileRequest {
  const _$UserProfileRequestImpl(
      {required this.id,
      required this.emailId,
      required this.firstName,
      required this.lastName,
      required this.phone,
      required this.country,
      required this.dob});

  factory _$UserProfileRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProfileRequestImplFromJson(json);

  @override
  final String id;
  @override
  final String emailId;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String phone;
  @override
  final String country;
  @override
  final DateTime dob;

  @override
  String toString() {
    return 'UserProfileRequest(id: $id, emailId: $emailId, firstName: $firstName, lastName: $lastName, phone: $phone, country: $country, dob: $dob)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileRequestImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.emailId, emailId) || other.emailId == emailId) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.dob, dob) || other.dob == dob));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, emailId, firstName, lastName, phone, country, dob);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileRequestImplCopyWith<_$UserProfileRequestImpl> get copyWith =>
      __$$UserProfileRequestImplCopyWithImpl<_$UserProfileRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProfileRequestImplToJson(
      this,
    );
  }
}

abstract class _UserProfileRequest implements UserProfileRequest {
  const factory _UserProfileRequest(
      {required final String id,
      required final String emailId,
      required final String firstName,
      required final String lastName,
      required final String phone,
      required final String country,
      required final DateTime dob}) = _$UserProfileRequestImpl;

  factory _UserProfileRequest.fromJson(Map<String, dynamic> json) =
      _$UserProfileRequestImpl.fromJson;

  @override
  String get id;
  @override
  String get emailId;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get phone;
  @override
  String get country;
  @override
  DateTime get dob;
  @override
  @JsonKey(ignore: true)
  _$$UserProfileRequestImplCopyWith<_$UserProfileRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
