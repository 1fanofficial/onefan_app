// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contest_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ContestRespone _$ContestResponeFromJson(Map<String, dynamic> json) {
  return _ContestDetailsResponse.fromJson(json);
}

/// @nodoc
mixin _$ContestRespone {
  String get id => throw _privateConstructorUsedError;
  String get contestName => throw _privateConstructorUsedError;
  RaceDetailsResponse get raceDetails => throw _privateConstructorUsedError;
  int get entryFees => throw _privateConstructorUsedError;
  DateTime get deadline => throw _privateConstructorUsedError;
  int get prizePool => throw _privateConstructorUsedError;
  int get entries => throw _privateConstructorUsedError;
  int get maxEntries => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  bool get hasJoined => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContestResponeCopyWith<ContestRespone> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContestResponeCopyWith<$Res> {
  factory $ContestResponeCopyWith(
          ContestRespone value, $Res Function(ContestRespone) then) =
      _$ContestResponeCopyWithImpl<$Res, ContestRespone>;
  @useResult
  $Res call(
      {String id,
      String contestName,
      RaceDetailsResponse raceDetails,
      int entryFees,
      DateTime deadline,
      int prizePool,
      int entries,
      int maxEntries,
      String status,
      bool hasJoined});

  $RaceDetailsResponseCopyWith<$Res> get raceDetails;
}

/// @nodoc
class _$ContestResponeCopyWithImpl<$Res, $Val extends ContestRespone>
    implements $ContestResponeCopyWith<$Res> {
  _$ContestResponeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? contestName = null,
    Object? raceDetails = null,
    Object? entryFees = null,
    Object? deadline = null,
    Object? prizePool = null,
    Object? entries = null,
    Object? maxEntries = null,
    Object? status = null,
    Object? hasJoined = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      contestName: null == contestName
          ? _value.contestName
          : contestName // ignore: cast_nullable_to_non_nullable
              as String,
      raceDetails: null == raceDetails
          ? _value.raceDetails
          : raceDetails // ignore: cast_nullable_to_non_nullable
              as RaceDetailsResponse,
      entryFees: null == entryFees
          ? _value.entryFees
          : entryFees // ignore: cast_nullable_to_non_nullable
              as int,
      deadline: null == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime,
      prizePool: null == prizePool
          ? _value.prizePool
          : prizePool // ignore: cast_nullable_to_non_nullable
              as int,
      entries: null == entries
          ? _value.entries
          : entries // ignore: cast_nullable_to_non_nullable
              as int,
      maxEntries: null == maxEntries
          ? _value.maxEntries
          : maxEntries // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      hasJoined: null == hasJoined
          ? _value.hasJoined
          : hasJoined // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RaceDetailsResponseCopyWith<$Res> get raceDetails {
    return $RaceDetailsResponseCopyWith<$Res>(_value.raceDetails, (value) {
      return _then(_value.copyWith(raceDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ContestDetailsResponseImplCopyWith<$Res>
    implements $ContestResponeCopyWith<$Res> {
  factory _$$ContestDetailsResponseImplCopyWith(
          _$ContestDetailsResponseImpl value,
          $Res Function(_$ContestDetailsResponseImpl) then) =
      __$$ContestDetailsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String contestName,
      RaceDetailsResponse raceDetails,
      int entryFees,
      DateTime deadline,
      int prizePool,
      int entries,
      int maxEntries,
      String status,
      bool hasJoined});

  @override
  $RaceDetailsResponseCopyWith<$Res> get raceDetails;
}

/// @nodoc
class __$$ContestDetailsResponseImplCopyWithImpl<$Res>
    extends _$ContestResponeCopyWithImpl<$Res, _$ContestDetailsResponseImpl>
    implements _$$ContestDetailsResponseImplCopyWith<$Res> {
  __$$ContestDetailsResponseImplCopyWithImpl(
      _$ContestDetailsResponseImpl _value,
      $Res Function(_$ContestDetailsResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? contestName = null,
    Object? raceDetails = null,
    Object? entryFees = null,
    Object? deadline = null,
    Object? prizePool = null,
    Object? entries = null,
    Object? maxEntries = null,
    Object? status = null,
    Object? hasJoined = null,
  }) {
    return _then(_$ContestDetailsResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      contestName: null == contestName
          ? _value.contestName
          : contestName // ignore: cast_nullable_to_non_nullable
              as String,
      raceDetails: null == raceDetails
          ? _value.raceDetails
          : raceDetails // ignore: cast_nullable_to_non_nullable
              as RaceDetailsResponse,
      entryFees: null == entryFees
          ? _value.entryFees
          : entryFees // ignore: cast_nullable_to_non_nullable
              as int,
      deadline: null == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime,
      prizePool: null == prizePool
          ? _value.prizePool
          : prizePool // ignore: cast_nullable_to_non_nullable
              as int,
      entries: null == entries
          ? _value.entries
          : entries // ignore: cast_nullable_to_non_nullable
              as int,
      maxEntries: null == maxEntries
          ? _value.maxEntries
          : maxEntries // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      hasJoined: null == hasJoined
          ? _value.hasJoined
          : hasJoined // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContestDetailsResponseImpl implements _ContestDetailsResponse {
  const _$ContestDetailsResponseImpl(
      {required this.id,
      required this.contestName,
      required this.raceDetails,
      required this.entryFees,
      required this.deadline,
      required this.prizePool,
      required this.entries,
      required this.maxEntries,
      required this.status,
      required this.hasJoined});

  factory _$ContestDetailsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContestDetailsResponseImplFromJson(json);

  @override
  final String id;
  @override
  final String contestName;
  @override
  final RaceDetailsResponse raceDetails;
  @override
  final int entryFees;
  @override
  final DateTime deadline;
  @override
  final int prizePool;
  @override
  final int entries;
  @override
  final int maxEntries;
  @override
  final String status;
  @override
  final bool hasJoined;

  @override
  String toString() {
    return 'ContestRespone(id: $id, contestName: $contestName, raceDetails: $raceDetails, entryFees: $entryFees, deadline: $deadline, prizePool: $prizePool, entries: $entries, maxEntries: $maxEntries, status: $status, hasJoined: $hasJoined)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContestDetailsResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.contestName, contestName) ||
                other.contestName == contestName) &&
            (identical(other.raceDetails, raceDetails) ||
                other.raceDetails == raceDetails) &&
            (identical(other.entryFees, entryFees) ||
                other.entryFees == entryFees) &&
            (identical(other.deadline, deadline) ||
                other.deadline == deadline) &&
            (identical(other.prizePool, prizePool) ||
                other.prizePool == prizePool) &&
            (identical(other.entries, entries) || other.entries == entries) &&
            (identical(other.maxEntries, maxEntries) ||
                other.maxEntries == maxEntries) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.hasJoined, hasJoined) ||
                other.hasJoined == hasJoined));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, contestName, raceDetails,
      entryFees, deadline, prizePool, entries, maxEntries, status, hasJoined);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContestDetailsResponseImplCopyWith<_$ContestDetailsResponseImpl>
      get copyWith => __$$ContestDetailsResponseImplCopyWithImpl<
          _$ContestDetailsResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContestDetailsResponseImplToJson(
      this,
    );
  }
}

abstract class _ContestDetailsResponse implements ContestRespone {
  const factory _ContestDetailsResponse(
      {required final String id,
      required final String contestName,
      required final RaceDetailsResponse raceDetails,
      required final int entryFees,
      required final DateTime deadline,
      required final int prizePool,
      required final int entries,
      required final int maxEntries,
      required final String status,
      required final bool hasJoined}) = _$ContestDetailsResponseImpl;

  factory _ContestDetailsResponse.fromJson(Map<String, dynamic> json) =
      _$ContestDetailsResponseImpl.fromJson;

  @override
  String get id;
  @override
  String get contestName;
  @override
  RaceDetailsResponse get raceDetails;
  @override
  int get entryFees;
  @override
  DateTime get deadline;
  @override
  int get prizePool;
  @override
  int get entries;
  @override
  int get maxEntries;
  @override
  String get status;
  @override
  bool get hasJoined;
  @override
  @JsonKey(ignore: true)
  _$$ContestDetailsResponseImplCopyWith<_$ContestDetailsResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
