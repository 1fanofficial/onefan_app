// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'race_details_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RaceDetailsResponse _$RaceDetailsResponseFromJson(Map<String, dynamic> json) {
  return _RaceDetailsResponse.fromJson(json);
}

/// @nodoc
mixin _$RaceDetailsResponse {
  String get id => throw _privateConstructorUsedError;
  int get season => throw _privateConstructorUsedError;
  int get round => throw _privateConstructorUsedError;
  String get raceName => throw _privateConstructorUsedError;
  String get circuitName => throw _privateConstructorUsedError;
  int get laps => throw _privateConstructorUsedError;
  double get trackLength => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;
  DateTime? get qulifyingStartTime => throw _privateConstructorUsedError;
  DateTime? get raceStartTime => throw _privateConstructorUsedError;
  DateTime? get sprintStartTime => throw _privateConstructorUsedError;
  DriverDetailsResponse? get poleDriver => throw _privateConstructorUsedError;
  DriverDetailsResponse? get fastestLapDriver =>
      throw _privateConstructorUsedError;
  DriverDetailsResponse? get raceWinner => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RaceDetailsResponseCopyWith<RaceDetailsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RaceDetailsResponseCopyWith<$Res> {
  factory $RaceDetailsResponseCopyWith(
          RaceDetailsResponse value, $Res Function(RaceDetailsResponse) then) =
      _$RaceDetailsResponseCopyWithImpl<$Res, RaceDetailsResponse>;
  @useResult
  $Res call(
      {String id,
      int season,
      int round,
      String raceName,
      String circuitName,
      int laps,
      double trackLength,
      String country,
      DateTime? qulifyingStartTime,
      DateTime? raceStartTime,
      DateTime? sprintStartTime,
      DriverDetailsResponse? poleDriver,
      DriverDetailsResponse? fastestLapDriver,
      DriverDetailsResponse? raceWinner,
      String status});

  $DriverDetailsResponseCopyWith<$Res>? get poleDriver;
  $DriverDetailsResponseCopyWith<$Res>? get fastestLapDriver;
  $DriverDetailsResponseCopyWith<$Res>? get raceWinner;
}

/// @nodoc
class _$RaceDetailsResponseCopyWithImpl<$Res, $Val extends RaceDetailsResponse>
    implements $RaceDetailsResponseCopyWith<$Res> {
  _$RaceDetailsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? season = null,
    Object? round = null,
    Object? raceName = null,
    Object? circuitName = null,
    Object? laps = null,
    Object? trackLength = null,
    Object? country = null,
    Object? qulifyingStartTime = freezed,
    Object? raceStartTime = freezed,
    Object? sprintStartTime = freezed,
    Object? poleDriver = freezed,
    Object? fastestLapDriver = freezed,
    Object? raceWinner = freezed,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      season: null == season
          ? _value.season
          : season // ignore: cast_nullable_to_non_nullable
              as int,
      round: null == round
          ? _value.round
          : round // ignore: cast_nullable_to_non_nullable
              as int,
      raceName: null == raceName
          ? _value.raceName
          : raceName // ignore: cast_nullable_to_non_nullable
              as String,
      circuitName: null == circuitName
          ? _value.circuitName
          : circuitName // ignore: cast_nullable_to_non_nullable
              as String,
      laps: null == laps
          ? _value.laps
          : laps // ignore: cast_nullable_to_non_nullable
              as int,
      trackLength: null == trackLength
          ? _value.trackLength
          : trackLength // ignore: cast_nullable_to_non_nullable
              as double,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      qulifyingStartTime: freezed == qulifyingStartTime
          ? _value.qulifyingStartTime
          : qulifyingStartTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      raceStartTime: freezed == raceStartTime
          ? _value.raceStartTime
          : raceStartTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      sprintStartTime: freezed == sprintStartTime
          ? _value.sprintStartTime
          : sprintStartTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      poleDriver: freezed == poleDriver
          ? _value.poleDriver
          : poleDriver // ignore: cast_nullable_to_non_nullable
              as DriverDetailsResponse?,
      fastestLapDriver: freezed == fastestLapDriver
          ? _value.fastestLapDriver
          : fastestLapDriver // ignore: cast_nullable_to_non_nullable
              as DriverDetailsResponse?,
      raceWinner: freezed == raceWinner
          ? _value.raceWinner
          : raceWinner // ignore: cast_nullable_to_non_nullable
              as DriverDetailsResponse?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DriverDetailsResponseCopyWith<$Res>? get poleDriver {
    if (_value.poleDriver == null) {
      return null;
    }

    return $DriverDetailsResponseCopyWith<$Res>(_value.poleDriver!, (value) {
      return _then(_value.copyWith(poleDriver: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DriverDetailsResponseCopyWith<$Res>? get fastestLapDriver {
    if (_value.fastestLapDriver == null) {
      return null;
    }

    return $DriverDetailsResponseCopyWith<$Res>(_value.fastestLapDriver!,
        (value) {
      return _then(_value.copyWith(fastestLapDriver: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DriverDetailsResponseCopyWith<$Res>? get raceWinner {
    if (_value.raceWinner == null) {
      return null;
    }

    return $DriverDetailsResponseCopyWith<$Res>(_value.raceWinner!, (value) {
      return _then(_value.copyWith(raceWinner: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RaceDetailsResponseImplCopyWith<$Res>
    implements $RaceDetailsResponseCopyWith<$Res> {
  factory _$$RaceDetailsResponseImplCopyWith(_$RaceDetailsResponseImpl value,
          $Res Function(_$RaceDetailsResponseImpl) then) =
      __$$RaceDetailsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      int season,
      int round,
      String raceName,
      String circuitName,
      int laps,
      double trackLength,
      String country,
      DateTime? qulifyingStartTime,
      DateTime? raceStartTime,
      DateTime? sprintStartTime,
      DriverDetailsResponse? poleDriver,
      DriverDetailsResponse? fastestLapDriver,
      DriverDetailsResponse? raceWinner,
      String status});

  @override
  $DriverDetailsResponseCopyWith<$Res>? get poleDriver;
  @override
  $DriverDetailsResponseCopyWith<$Res>? get fastestLapDriver;
  @override
  $DriverDetailsResponseCopyWith<$Res>? get raceWinner;
}

/// @nodoc
class __$$RaceDetailsResponseImplCopyWithImpl<$Res>
    extends _$RaceDetailsResponseCopyWithImpl<$Res, _$RaceDetailsResponseImpl>
    implements _$$RaceDetailsResponseImplCopyWith<$Res> {
  __$$RaceDetailsResponseImplCopyWithImpl(_$RaceDetailsResponseImpl _value,
      $Res Function(_$RaceDetailsResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? season = null,
    Object? round = null,
    Object? raceName = null,
    Object? circuitName = null,
    Object? laps = null,
    Object? trackLength = null,
    Object? country = null,
    Object? qulifyingStartTime = freezed,
    Object? raceStartTime = freezed,
    Object? sprintStartTime = freezed,
    Object? poleDriver = freezed,
    Object? fastestLapDriver = freezed,
    Object? raceWinner = freezed,
    Object? status = null,
  }) {
    return _then(_$RaceDetailsResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      season: null == season
          ? _value.season
          : season // ignore: cast_nullable_to_non_nullable
              as int,
      round: null == round
          ? _value.round
          : round // ignore: cast_nullable_to_non_nullable
              as int,
      raceName: null == raceName
          ? _value.raceName
          : raceName // ignore: cast_nullable_to_non_nullable
              as String,
      circuitName: null == circuitName
          ? _value.circuitName
          : circuitName // ignore: cast_nullable_to_non_nullable
              as String,
      laps: null == laps
          ? _value.laps
          : laps // ignore: cast_nullable_to_non_nullable
              as int,
      trackLength: null == trackLength
          ? _value.trackLength
          : trackLength // ignore: cast_nullable_to_non_nullable
              as double,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      qulifyingStartTime: freezed == qulifyingStartTime
          ? _value.qulifyingStartTime
          : qulifyingStartTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      raceStartTime: freezed == raceStartTime
          ? _value.raceStartTime
          : raceStartTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      sprintStartTime: freezed == sprintStartTime
          ? _value.sprintStartTime
          : sprintStartTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      poleDriver: freezed == poleDriver
          ? _value.poleDriver
          : poleDriver // ignore: cast_nullable_to_non_nullable
              as DriverDetailsResponse?,
      fastestLapDriver: freezed == fastestLapDriver
          ? _value.fastestLapDriver
          : fastestLapDriver // ignore: cast_nullable_to_non_nullable
              as DriverDetailsResponse?,
      raceWinner: freezed == raceWinner
          ? _value.raceWinner
          : raceWinner // ignore: cast_nullable_to_non_nullable
              as DriverDetailsResponse?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RaceDetailsResponseImpl implements _RaceDetailsResponse {
  const _$RaceDetailsResponseImpl(
      {required this.id,
      required this.season,
      required this.round,
      required this.raceName,
      required this.circuitName,
      required this.laps,
      required this.trackLength,
      required this.country,
      this.qulifyingStartTime,
      this.raceStartTime,
      this.sprintStartTime,
      this.poleDriver,
      this.fastestLapDriver,
      this.raceWinner,
      required this.status});

  factory _$RaceDetailsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RaceDetailsResponseImplFromJson(json);

  @override
  final String id;
  @override
  final int season;
  @override
  final int round;
  @override
  final String raceName;
  @override
  final String circuitName;
  @override
  final int laps;
  @override
  final double trackLength;
  @override
  final String country;
  @override
  final DateTime? qulifyingStartTime;
  @override
  final DateTime? raceStartTime;
  @override
  final DateTime? sprintStartTime;
  @override
  final DriverDetailsResponse? poleDriver;
  @override
  final DriverDetailsResponse? fastestLapDriver;
  @override
  final DriverDetailsResponse? raceWinner;
  @override
  final String status;

  @override
  String toString() {
    return 'RaceDetailsResponse(id: $id, season: $season, round: $round, raceName: $raceName, circuitName: $circuitName, laps: $laps, trackLength: $trackLength, country: $country, qulifyingStartTime: $qulifyingStartTime, raceStartTime: $raceStartTime, sprintStartTime: $sprintStartTime, poleDriver: $poleDriver, fastestLapDriver: $fastestLapDriver, raceWinner: $raceWinner, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RaceDetailsResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.season, season) || other.season == season) &&
            (identical(other.round, round) || other.round == round) &&
            (identical(other.raceName, raceName) ||
                other.raceName == raceName) &&
            (identical(other.circuitName, circuitName) ||
                other.circuitName == circuitName) &&
            (identical(other.laps, laps) || other.laps == laps) &&
            (identical(other.trackLength, trackLength) ||
                other.trackLength == trackLength) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.qulifyingStartTime, qulifyingStartTime) ||
                other.qulifyingStartTime == qulifyingStartTime) &&
            (identical(other.raceStartTime, raceStartTime) ||
                other.raceStartTime == raceStartTime) &&
            (identical(other.sprintStartTime, sprintStartTime) ||
                other.sprintStartTime == sprintStartTime) &&
            (identical(other.poleDriver, poleDriver) ||
                other.poleDriver == poleDriver) &&
            (identical(other.fastestLapDriver, fastestLapDriver) ||
                other.fastestLapDriver == fastestLapDriver) &&
            (identical(other.raceWinner, raceWinner) ||
                other.raceWinner == raceWinner) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      season,
      round,
      raceName,
      circuitName,
      laps,
      trackLength,
      country,
      qulifyingStartTime,
      raceStartTime,
      sprintStartTime,
      poleDriver,
      fastestLapDriver,
      raceWinner,
      status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RaceDetailsResponseImplCopyWith<_$RaceDetailsResponseImpl> get copyWith =>
      __$$RaceDetailsResponseImplCopyWithImpl<_$RaceDetailsResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RaceDetailsResponseImplToJson(
      this,
    );
  }
}

abstract class _RaceDetailsResponse implements RaceDetailsResponse {
  const factory _RaceDetailsResponse(
      {required final String id,
      required final int season,
      required final int round,
      required final String raceName,
      required final String circuitName,
      required final int laps,
      required final double trackLength,
      required final String country,
      final DateTime? qulifyingStartTime,
      final DateTime? raceStartTime,
      final DateTime? sprintStartTime,
      final DriverDetailsResponse? poleDriver,
      final DriverDetailsResponse? fastestLapDriver,
      final DriverDetailsResponse? raceWinner,
      required final String status}) = _$RaceDetailsResponseImpl;

  factory _RaceDetailsResponse.fromJson(Map<String, dynamic> json) =
      _$RaceDetailsResponseImpl.fromJson;

  @override
  String get id;
  @override
  int get season;
  @override
  int get round;
  @override
  String get raceName;
  @override
  String get circuitName;
  @override
  int get laps;
  @override
  double get trackLength;
  @override
  String get country;
  @override
  DateTime? get qulifyingStartTime;
  @override
  DateTime? get raceStartTime;
  @override
  DateTime? get sprintStartTime;
  @override
  DriverDetailsResponse? get poleDriver;
  @override
  DriverDetailsResponse? get fastestLapDriver;
  @override
  DriverDetailsResponse? get raceWinner;
  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$RaceDetailsResponseImplCopyWith<_$RaceDetailsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
