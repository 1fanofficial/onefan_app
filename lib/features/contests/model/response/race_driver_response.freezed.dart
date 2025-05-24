// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'race_driver_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RaceDriverResponse _$RaceDriverResponseFromJson(Map<String, dynamic> json) {
  return _RaceDriverResponse.fromJson(json);
}

/// @nodoc
mixin _$RaceDriverResponse {
  String get id => throw _privateConstructorUsedError;
  DriverDetailsResponse get driver => throw _privateConstructorUsedError;
  RaceDetailsResponse get race => throw _privateConstructorUsedError;
  int get finishPosition => throw _privateConstructorUsedError;
  int get startPosition => throw _privateConstructorUsedError;
  int get pitStops => throw _privateConstructorUsedError;
  String get finishStatus => throw _privateConstructorUsedError;
  int get lapsCompleted => throw _privateConstructorUsedError;
  int get overtakes => throw _privateConstructorUsedError;
  int get pointsEarned => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RaceDriverResponseCopyWith<RaceDriverResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RaceDriverResponseCopyWith<$Res> {
  factory $RaceDriverResponseCopyWith(
          RaceDriverResponse value, $Res Function(RaceDriverResponse) then) =
      _$RaceDriverResponseCopyWithImpl<$Res, RaceDriverResponse>;
  @useResult
  $Res call(
      {String id,
      DriverDetailsResponse driver,
      RaceDetailsResponse race,
      int finishPosition,
      int startPosition,
      int pitStops,
      String finishStatus,
      int lapsCompleted,
      int overtakes,
      int pointsEarned});

  $DriverDetailsResponseCopyWith<$Res> get driver;
  $RaceDetailsResponseCopyWith<$Res> get race;
}

/// @nodoc
class _$RaceDriverResponseCopyWithImpl<$Res, $Val extends RaceDriverResponse>
    implements $RaceDriverResponseCopyWith<$Res> {
  _$RaceDriverResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? driver = null,
    Object? race = null,
    Object? finishPosition = null,
    Object? startPosition = null,
    Object? pitStops = null,
    Object? finishStatus = null,
    Object? lapsCompleted = null,
    Object? overtakes = null,
    Object? pointsEarned = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      driver: null == driver
          ? _value.driver
          : driver // ignore: cast_nullable_to_non_nullable
              as DriverDetailsResponse,
      race: null == race
          ? _value.race
          : race // ignore: cast_nullable_to_non_nullable
              as RaceDetailsResponse,
      finishPosition: null == finishPosition
          ? _value.finishPosition
          : finishPosition // ignore: cast_nullable_to_non_nullable
              as int,
      startPosition: null == startPosition
          ? _value.startPosition
          : startPosition // ignore: cast_nullable_to_non_nullable
              as int,
      pitStops: null == pitStops
          ? _value.pitStops
          : pitStops // ignore: cast_nullable_to_non_nullable
              as int,
      finishStatus: null == finishStatus
          ? _value.finishStatus
          : finishStatus // ignore: cast_nullable_to_non_nullable
              as String,
      lapsCompleted: null == lapsCompleted
          ? _value.lapsCompleted
          : lapsCompleted // ignore: cast_nullable_to_non_nullable
              as int,
      overtakes: null == overtakes
          ? _value.overtakes
          : overtakes // ignore: cast_nullable_to_non_nullable
              as int,
      pointsEarned: null == pointsEarned
          ? _value.pointsEarned
          : pointsEarned // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DriverDetailsResponseCopyWith<$Res> get driver {
    return $DriverDetailsResponseCopyWith<$Res>(_value.driver, (value) {
      return _then(_value.copyWith(driver: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RaceDetailsResponseCopyWith<$Res> get race {
    return $RaceDetailsResponseCopyWith<$Res>(_value.race, (value) {
      return _then(_value.copyWith(race: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RaceDriverResponseImplCopyWith<$Res>
    implements $RaceDriverResponseCopyWith<$Res> {
  factory _$$RaceDriverResponseImplCopyWith(_$RaceDriverResponseImpl value,
          $Res Function(_$RaceDriverResponseImpl) then) =
      __$$RaceDriverResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DriverDetailsResponse driver,
      RaceDetailsResponse race,
      int finishPosition,
      int startPosition,
      int pitStops,
      String finishStatus,
      int lapsCompleted,
      int overtakes,
      int pointsEarned});

  @override
  $DriverDetailsResponseCopyWith<$Res> get driver;
  @override
  $RaceDetailsResponseCopyWith<$Res> get race;
}

/// @nodoc
class __$$RaceDriverResponseImplCopyWithImpl<$Res>
    extends _$RaceDriverResponseCopyWithImpl<$Res, _$RaceDriverResponseImpl>
    implements _$$RaceDriverResponseImplCopyWith<$Res> {
  __$$RaceDriverResponseImplCopyWithImpl(_$RaceDriverResponseImpl _value,
      $Res Function(_$RaceDriverResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? driver = null,
    Object? race = null,
    Object? finishPosition = null,
    Object? startPosition = null,
    Object? pitStops = null,
    Object? finishStatus = null,
    Object? lapsCompleted = null,
    Object? overtakes = null,
    Object? pointsEarned = null,
  }) {
    return _then(_$RaceDriverResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      driver: null == driver
          ? _value.driver
          : driver // ignore: cast_nullable_to_non_nullable
              as DriverDetailsResponse,
      race: null == race
          ? _value.race
          : race // ignore: cast_nullable_to_non_nullable
              as RaceDetailsResponse,
      finishPosition: null == finishPosition
          ? _value.finishPosition
          : finishPosition // ignore: cast_nullable_to_non_nullable
              as int,
      startPosition: null == startPosition
          ? _value.startPosition
          : startPosition // ignore: cast_nullable_to_non_nullable
              as int,
      pitStops: null == pitStops
          ? _value.pitStops
          : pitStops // ignore: cast_nullable_to_non_nullable
              as int,
      finishStatus: null == finishStatus
          ? _value.finishStatus
          : finishStatus // ignore: cast_nullable_to_non_nullable
              as String,
      lapsCompleted: null == lapsCompleted
          ? _value.lapsCompleted
          : lapsCompleted // ignore: cast_nullable_to_non_nullable
              as int,
      overtakes: null == overtakes
          ? _value.overtakes
          : overtakes // ignore: cast_nullable_to_non_nullable
              as int,
      pointsEarned: null == pointsEarned
          ? _value.pointsEarned
          : pointsEarned // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RaceDriverResponseImpl implements _RaceDriverResponse {
  const _$RaceDriverResponseImpl(
      {required this.id,
      required this.driver,
      required this.race,
      required this.finishPosition,
      required this.startPosition,
      required this.pitStops,
      required this.finishStatus,
      required this.lapsCompleted,
      required this.overtakes,
      required this.pointsEarned});

  factory _$RaceDriverResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RaceDriverResponseImplFromJson(json);

  @override
  final String id;
  @override
  final DriverDetailsResponse driver;
  @override
  final RaceDetailsResponse race;
  @override
  final int finishPosition;
  @override
  final int startPosition;
  @override
  final int pitStops;
  @override
  final String finishStatus;
  @override
  final int lapsCompleted;
  @override
  final int overtakes;
  @override
  final int pointsEarned;

  @override
  String toString() {
    return 'RaceDriverResponse(id: $id, driver: $driver, race: $race, finishPosition: $finishPosition, startPosition: $startPosition, pitStops: $pitStops, finishStatus: $finishStatus, lapsCompleted: $lapsCompleted, overtakes: $overtakes, pointsEarned: $pointsEarned)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RaceDriverResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.driver, driver) || other.driver == driver) &&
            (identical(other.race, race) || other.race == race) &&
            (identical(other.finishPosition, finishPosition) ||
                other.finishPosition == finishPosition) &&
            (identical(other.startPosition, startPosition) ||
                other.startPosition == startPosition) &&
            (identical(other.pitStops, pitStops) ||
                other.pitStops == pitStops) &&
            (identical(other.finishStatus, finishStatus) ||
                other.finishStatus == finishStatus) &&
            (identical(other.lapsCompleted, lapsCompleted) ||
                other.lapsCompleted == lapsCompleted) &&
            (identical(other.overtakes, overtakes) ||
                other.overtakes == overtakes) &&
            (identical(other.pointsEarned, pointsEarned) ||
                other.pointsEarned == pointsEarned));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      driver,
      race,
      finishPosition,
      startPosition,
      pitStops,
      finishStatus,
      lapsCompleted,
      overtakes,
      pointsEarned);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RaceDriverResponseImplCopyWith<_$RaceDriverResponseImpl> get copyWith =>
      __$$RaceDriverResponseImplCopyWithImpl<_$RaceDriverResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RaceDriverResponseImplToJson(
      this,
    );
  }
}

abstract class _RaceDriverResponse implements RaceDriverResponse {
  const factory _RaceDriverResponse(
      {required final String id,
      required final DriverDetailsResponse driver,
      required final RaceDetailsResponse race,
      required final int finishPosition,
      required final int startPosition,
      required final int pitStops,
      required final String finishStatus,
      required final int lapsCompleted,
      required final int overtakes,
      required final int pointsEarned}) = _$RaceDriverResponseImpl;

  factory _RaceDriverResponse.fromJson(Map<String, dynamic> json) =
      _$RaceDriverResponseImpl.fromJson;

  @override
  String get id;
  @override
  DriverDetailsResponse get driver;
  @override
  RaceDetailsResponse get race;
  @override
  int get finishPosition;
  @override
  int get startPosition;
  @override
  int get pitStops;
  @override
  String get finishStatus;
  @override
  int get lapsCompleted;
  @override
  int get overtakes;
  @override
  int get pointsEarned;
  @override
  @JsonKey(ignore: true)
  _$$RaceDriverResponseImplCopyWith<_$RaceDriverResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
