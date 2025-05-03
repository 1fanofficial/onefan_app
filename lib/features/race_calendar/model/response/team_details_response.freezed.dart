// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'team_details_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TeamDetailsResponse _$TeamDetailsResponseFromJson(Map<String, dynamic> json) {
  return _TeamDetailsResponse.fromJson(json);
}

/// @nodoc
mixin _$TeamDetailsResponse {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get teamCode => throw _privateConstructorUsedError;
  String get teamColor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TeamDetailsResponseCopyWith<TeamDetailsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeamDetailsResponseCopyWith<$Res> {
  factory $TeamDetailsResponseCopyWith(
          TeamDetailsResponse value, $Res Function(TeamDetailsResponse) then) =
      _$TeamDetailsResponseCopyWithImpl<$Res, TeamDetailsResponse>;
  @useResult
  $Res call({String id, String name, String teamCode, String teamColor});
}

/// @nodoc
class _$TeamDetailsResponseCopyWithImpl<$Res, $Val extends TeamDetailsResponse>
    implements $TeamDetailsResponseCopyWith<$Res> {
  _$TeamDetailsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? teamCode = null,
    Object? teamColor = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      teamCode: null == teamCode
          ? _value.teamCode
          : teamCode // ignore: cast_nullable_to_non_nullable
              as String,
      teamColor: null == teamColor
          ? _value.teamColor
          : teamColor // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TeamDetailsResponseImplCopyWith<$Res>
    implements $TeamDetailsResponseCopyWith<$Res> {
  factory _$$TeamDetailsResponseImplCopyWith(_$TeamDetailsResponseImpl value,
          $Res Function(_$TeamDetailsResponseImpl) then) =
      __$$TeamDetailsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String teamCode, String teamColor});
}

/// @nodoc
class __$$TeamDetailsResponseImplCopyWithImpl<$Res>
    extends _$TeamDetailsResponseCopyWithImpl<$Res, _$TeamDetailsResponseImpl>
    implements _$$TeamDetailsResponseImplCopyWith<$Res> {
  __$$TeamDetailsResponseImplCopyWithImpl(_$TeamDetailsResponseImpl _value,
      $Res Function(_$TeamDetailsResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? teamCode = null,
    Object? teamColor = null,
  }) {
    return _then(_$TeamDetailsResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      teamCode: null == teamCode
          ? _value.teamCode
          : teamCode // ignore: cast_nullable_to_non_nullable
              as String,
      teamColor: null == teamColor
          ? _value.teamColor
          : teamColor // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TeamDetailsResponseImpl implements _TeamDetailsResponse {
  const _$TeamDetailsResponseImpl(
      {required this.id,
      required this.name,
      required this.teamCode,
      required this.teamColor});

  factory _$TeamDetailsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TeamDetailsResponseImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String teamCode;
  @override
  final String teamColor;

  @override
  String toString() {
    return 'TeamDetailsResponse(id: $id, name: $name, teamCode: $teamCode, teamColor: $teamColor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TeamDetailsResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.teamCode, teamCode) ||
                other.teamCode == teamCode) &&
            (identical(other.teamColor, teamColor) ||
                other.teamColor == teamColor));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, teamCode, teamColor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TeamDetailsResponseImplCopyWith<_$TeamDetailsResponseImpl> get copyWith =>
      __$$TeamDetailsResponseImplCopyWithImpl<_$TeamDetailsResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TeamDetailsResponseImplToJson(
      this,
    );
  }
}

abstract class _TeamDetailsResponse implements TeamDetailsResponse {
  const factory _TeamDetailsResponse(
      {required final String id,
      required final String name,
      required final String teamCode,
      required final String teamColor}) = _$TeamDetailsResponseImpl;

  factory _TeamDetailsResponse.fromJson(Map<String, dynamic> json) =
      _$TeamDetailsResponseImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get teamCode;
  @override
  String get teamColor;
  @override
  @JsonKey(ignore: true)
  _$$TeamDetailsResponseImplCopyWith<_$TeamDetailsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
