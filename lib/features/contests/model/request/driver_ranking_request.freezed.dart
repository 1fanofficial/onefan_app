// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'driver_ranking_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DriverRankingRequest _$DriverRankingRequestFromJson(Map<String, dynamic> json) {
  return _DriverRankingRequest.fromJson(json);
}

/// @nodoc
mixin _$DriverRankingRequest {
  String get driverId => throw _privateConstructorUsedError;
  int get predictedPosition => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DriverRankingRequestCopyWith<DriverRankingRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DriverRankingRequestCopyWith<$Res> {
  factory $DriverRankingRequestCopyWith(DriverRankingRequest value,
          $Res Function(DriverRankingRequest) then) =
      _$DriverRankingRequestCopyWithImpl<$Res, DriverRankingRequest>;
  @useResult
  $Res call({String driverId, int predictedPosition});
}

/// @nodoc
class _$DriverRankingRequestCopyWithImpl<$Res,
        $Val extends DriverRankingRequest>
    implements $DriverRankingRequestCopyWith<$Res> {
  _$DriverRankingRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? driverId = null,
    Object? predictedPosition = null,
  }) {
    return _then(_value.copyWith(
      driverId: null == driverId
          ? _value.driverId
          : driverId // ignore: cast_nullable_to_non_nullable
              as String,
      predictedPosition: null == predictedPosition
          ? _value.predictedPosition
          : predictedPosition // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DriverRankingRequestImplCopyWith<$Res>
    implements $DriverRankingRequestCopyWith<$Res> {
  factory _$$DriverRankingRequestImplCopyWith(_$DriverRankingRequestImpl value,
          $Res Function(_$DriverRankingRequestImpl) then) =
      __$$DriverRankingRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String driverId, int predictedPosition});
}

/// @nodoc
class __$$DriverRankingRequestImplCopyWithImpl<$Res>
    extends _$DriverRankingRequestCopyWithImpl<$Res, _$DriverRankingRequestImpl>
    implements _$$DriverRankingRequestImplCopyWith<$Res> {
  __$$DriverRankingRequestImplCopyWithImpl(_$DriverRankingRequestImpl _value,
      $Res Function(_$DriverRankingRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? driverId = null,
    Object? predictedPosition = null,
  }) {
    return _then(_$DriverRankingRequestImpl(
      driverId: null == driverId
          ? _value.driverId
          : driverId // ignore: cast_nullable_to_non_nullable
              as String,
      predictedPosition: null == predictedPosition
          ? _value.predictedPosition
          : predictedPosition // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DriverRankingRequestImpl implements _DriverRankingRequest {
  const _$DriverRankingRequestImpl(
      {required this.driverId, required this.predictedPosition});

  factory _$DriverRankingRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$DriverRankingRequestImplFromJson(json);

  @override
  final String driverId;
  @override
  final int predictedPosition;

  @override
  String toString() {
    return 'DriverRankingRequest(driverId: $driverId, predictedPosition: $predictedPosition)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DriverRankingRequestImpl &&
            (identical(other.driverId, driverId) ||
                other.driverId == driverId) &&
            (identical(other.predictedPosition, predictedPosition) ||
                other.predictedPosition == predictedPosition));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, driverId, predictedPosition);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DriverRankingRequestImplCopyWith<_$DriverRankingRequestImpl>
      get copyWith =>
          __$$DriverRankingRequestImplCopyWithImpl<_$DriverRankingRequestImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DriverRankingRequestImplToJson(
      this,
    );
  }
}

abstract class _DriverRankingRequest implements DriverRankingRequest {
  const factory _DriverRankingRequest(
      {required final String driverId,
      required final int predictedPosition}) = _$DriverRankingRequestImpl;

  factory _DriverRankingRequest.fromJson(Map<String, dynamic> json) =
      _$DriverRankingRequestImpl.fromJson;

  @override
  String get driverId;
  @override
  int get predictedPosition;
  @override
  @JsonKey(ignore: true)
  _$$DriverRankingRequestImplCopyWith<_$DriverRankingRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
