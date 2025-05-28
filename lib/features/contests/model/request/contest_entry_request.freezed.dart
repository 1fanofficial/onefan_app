// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contest_entry_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ContestEntryRequest _$ContestEntryRequestFromJson(Map<String, dynamic> json) {
  return _ContestEntryRequest.fromJson(json);
}

/// @nodoc
mixin _$ContestEntryRequest {
  String get contestId => throw _privateConstructorUsedError;
  String get fastestLapDriverId => throw _privateConstructorUsedError;
  List<DriverRankingRequest> get driverRankings =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContestEntryRequestCopyWith<ContestEntryRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContestEntryRequestCopyWith<$Res> {
  factory $ContestEntryRequestCopyWith(
          ContestEntryRequest value, $Res Function(ContestEntryRequest) then) =
      _$ContestEntryRequestCopyWithImpl<$Res, ContestEntryRequest>;
  @useResult
  $Res call(
      {String contestId,
      String fastestLapDriverId,
      List<DriverRankingRequest> driverRankings});
}

/// @nodoc
class _$ContestEntryRequestCopyWithImpl<$Res, $Val extends ContestEntryRequest>
    implements $ContestEntryRequestCopyWith<$Res> {
  _$ContestEntryRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contestId = null,
    Object? fastestLapDriverId = null,
    Object? driverRankings = null,
  }) {
    return _then(_value.copyWith(
      contestId: null == contestId
          ? _value.contestId
          : contestId // ignore: cast_nullable_to_non_nullable
              as String,
      fastestLapDriverId: null == fastestLapDriverId
          ? _value.fastestLapDriverId
          : fastestLapDriverId // ignore: cast_nullable_to_non_nullable
              as String,
      driverRankings: null == driverRankings
          ? _value.driverRankings
          : driverRankings // ignore: cast_nullable_to_non_nullable
              as List<DriverRankingRequest>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContestEntryRequestImplCopyWith<$Res>
    implements $ContestEntryRequestCopyWith<$Res> {
  factory _$$ContestEntryRequestImplCopyWith(_$ContestEntryRequestImpl value,
          $Res Function(_$ContestEntryRequestImpl) then) =
      __$$ContestEntryRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String contestId,
      String fastestLapDriverId,
      List<DriverRankingRequest> driverRankings});
}

/// @nodoc
class __$$ContestEntryRequestImplCopyWithImpl<$Res>
    extends _$ContestEntryRequestCopyWithImpl<$Res, _$ContestEntryRequestImpl>
    implements _$$ContestEntryRequestImplCopyWith<$Res> {
  __$$ContestEntryRequestImplCopyWithImpl(_$ContestEntryRequestImpl _value,
      $Res Function(_$ContestEntryRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contestId = null,
    Object? fastestLapDriverId = null,
    Object? driverRankings = null,
  }) {
    return _then(_$ContestEntryRequestImpl(
      contestId: null == contestId
          ? _value.contestId
          : contestId // ignore: cast_nullable_to_non_nullable
              as String,
      fastestLapDriverId: null == fastestLapDriverId
          ? _value.fastestLapDriverId
          : fastestLapDriverId // ignore: cast_nullable_to_non_nullable
              as String,
      driverRankings: null == driverRankings
          ? _value._driverRankings
          : driverRankings // ignore: cast_nullable_to_non_nullable
              as List<DriverRankingRequest>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContestEntryRequestImpl implements _ContestEntryRequest {
  const _$ContestEntryRequestImpl(
      {required this.contestId,
      required this.fastestLapDriverId,
      required final List<DriverRankingRequest> driverRankings})
      : _driverRankings = driverRankings;

  factory _$ContestEntryRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContestEntryRequestImplFromJson(json);

  @override
  final String contestId;
  @override
  final String fastestLapDriverId;
  final List<DriverRankingRequest> _driverRankings;
  @override
  List<DriverRankingRequest> get driverRankings {
    if (_driverRankings is EqualUnmodifiableListView) return _driverRankings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_driverRankings);
  }

  @override
  String toString() {
    return 'ContestEntryRequest(contestId: $contestId, fastestLapDriverId: $fastestLapDriverId, driverRankings: $driverRankings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContestEntryRequestImpl &&
            (identical(other.contestId, contestId) ||
                other.contestId == contestId) &&
            (identical(other.fastestLapDriverId, fastestLapDriverId) ||
                other.fastestLapDriverId == fastestLapDriverId) &&
            const DeepCollectionEquality()
                .equals(other._driverRankings, _driverRankings));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, contestId, fastestLapDriverId,
      const DeepCollectionEquality().hash(_driverRankings));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContestEntryRequestImplCopyWith<_$ContestEntryRequestImpl> get copyWith =>
      __$$ContestEntryRequestImplCopyWithImpl<_$ContestEntryRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContestEntryRequestImplToJson(
      this,
    );
  }
}

abstract class _ContestEntryRequest implements ContestEntryRequest {
  const factory _ContestEntryRequest(
          {required final String contestId,
          required final String fastestLapDriverId,
          required final List<DriverRankingRequest> driverRankings}) =
      _$ContestEntryRequestImpl;

  factory _ContestEntryRequest.fromJson(Map<String, dynamic> json) =
      _$ContestEntryRequestImpl.fromJson;

  @override
  String get contestId;
  @override
  String get fastestLapDriverId;
  @override
  List<DriverRankingRequest> get driverRankings;
  @override
  @JsonKey(ignore: true)
  _$$ContestEntryRequestImplCopyWith<_$ContestEntryRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
