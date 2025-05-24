// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'driver_details_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DriverDetailsResponse _$DriverDetailsResponseFromJson(
    Map<String, dynamic> json) {
  return _DriverDetailsResponse.fromJson(json);
}

/// @nodoc
mixin _$DriverDetailsResponse {
  String get id => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get driverCode => throw _privateConstructorUsedError;
  TeamDetailsResponse get team => throw _privateConstructorUsedError;
  int get carNumber => throw _privateConstructorUsedError;
  String get nationality => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DriverDetailsResponseCopyWith<DriverDetailsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DriverDetailsResponseCopyWith<$Res> {
  factory $DriverDetailsResponseCopyWith(DriverDetailsResponse value,
          $Res Function(DriverDetailsResponse) then) =
      _$DriverDetailsResponseCopyWithImpl<$Res, DriverDetailsResponse>;
  @useResult
  $Res call(
      {String id,
      String firstName,
      String lastName,
      String driverCode,
      TeamDetailsResponse team,
      int carNumber,
      String nationality,
      String status});

  $TeamDetailsResponseCopyWith<$Res> get team;
}

/// @nodoc
class _$DriverDetailsResponseCopyWithImpl<$Res,
        $Val extends DriverDetailsResponse>
    implements $DriverDetailsResponseCopyWith<$Res> {
  _$DriverDetailsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? driverCode = null,
    Object? team = null,
    Object? carNumber = null,
    Object? nationality = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      driverCode: null == driverCode
          ? _value.driverCode
          : driverCode // ignore: cast_nullable_to_non_nullable
              as String,
      team: null == team
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as TeamDetailsResponse,
      carNumber: null == carNumber
          ? _value.carNumber
          : carNumber // ignore: cast_nullable_to_non_nullable
              as int,
      nationality: null == nationality
          ? _value.nationality
          : nationality // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TeamDetailsResponseCopyWith<$Res> get team {
    return $TeamDetailsResponseCopyWith<$Res>(_value.team, (value) {
      return _then(_value.copyWith(team: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DriverDetailsResponseImplCopyWith<$Res>
    implements $DriverDetailsResponseCopyWith<$Res> {
  factory _$$DriverDetailsResponseImplCopyWith(
          _$DriverDetailsResponseImpl value,
          $Res Function(_$DriverDetailsResponseImpl) then) =
      __$$DriverDetailsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String firstName,
      String lastName,
      String driverCode,
      TeamDetailsResponse team,
      int carNumber,
      String nationality,
      String status});

  @override
  $TeamDetailsResponseCopyWith<$Res> get team;
}

/// @nodoc
class __$$DriverDetailsResponseImplCopyWithImpl<$Res>
    extends _$DriverDetailsResponseCopyWithImpl<$Res,
        _$DriverDetailsResponseImpl>
    implements _$$DriverDetailsResponseImplCopyWith<$Res> {
  __$$DriverDetailsResponseImplCopyWithImpl(_$DriverDetailsResponseImpl _value,
      $Res Function(_$DriverDetailsResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? driverCode = null,
    Object? team = null,
    Object? carNumber = null,
    Object? nationality = null,
    Object? status = null,
  }) {
    return _then(_$DriverDetailsResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      driverCode: null == driverCode
          ? _value.driverCode
          : driverCode // ignore: cast_nullable_to_non_nullable
              as String,
      team: null == team
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as TeamDetailsResponse,
      carNumber: null == carNumber
          ? _value.carNumber
          : carNumber // ignore: cast_nullable_to_non_nullable
              as int,
      nationality: null == nationality
          ? _value.nationality
          : nationality // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DriverDetailsResponseImpl implements _DriverDetailsResponse {
  const _$DriverDetailsResponseImpl(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.driverCode,
      required this.team,
      required this.carNumber,
      required this.nationality,
      required this.status});

  factory _$DriverDetailsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DriverDetailsResponseImplFromJson(json);

  @override
  final String id;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String driverCode;
  @override
  final TeamDetailsResponse team;
  @override
  final int carNumber;
  @override
  final String nationality;
  @override
  final String status;

  @override
  String toString() {
    return 'DriverDetailsResponse(id: $id, firstName: $firstName, lastName: $lastName, driverCode: $driverCode, team: $team, carNumber: $carNumber, nationality: $nationality, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DriverDetailsResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.driverCode, driverCode) ||
                other.driverCode == driverCode) &&
            (identical(other.team, team) || other.team == team) &&
            (identical(other.carNumber, carNumber) ||
                other.carNumber == carNumber) &&
            (identical(other.nationality, nationality) ||
                other.nationality == nationality) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, firstName, lastName,
      driverCode, team, carNumber, nationality, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DriverDetailsResponseImplCopyWith<_$DriverDetailsResponseImpl>
      get copyWith => __$$DriverDetailsResponseImplCopyWithImpl<
          _$DriverDetailsResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DriverDetailsResponseImplToJson(
      this,
    );
  }
}

abstract class _DriverDetailsResponse implements DriverDetailsResponse {
  const factory _DriverDetailsResponse(
      {required final String id,
      required final String firstName,
      required final String lastName,
      required final String driverCode,
      required final TeamDetailsResponse team,
      required final int carNumber,
      required final String nationality,
      required final String status}) = _$DriverDetailsResponseImpl;

  factory _DriverDetailsResponse.fromJson(Map<String, dynamic> json) =
      _$DriverDetailsResponseImpl.fromJson;

  @override
  String get id;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get driverCode;
  @override
  TeamDetailsResponse get team;
  @override
  int get carNumber;
  @override
  String get nationality;
  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$DriverDetailsResponseImplCopyWith<_$DriverDetailsResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
