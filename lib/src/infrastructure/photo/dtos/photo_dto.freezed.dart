// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'photo_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PhotoDto _$PhotoDtoFromJson(Map<String, dynamic> json) {
  return _PhotoDto.fromJson(json);
}

/// @nodoc
mixin _$PhotoDto {
  String get id => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  @FirestoreTimestampConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @FirestoreTimestampConverter()
  DateTime get updatedAt => throw _privateConstructorUsedError;
  FilterDto get filter => throw _privateConstructorUsedError;
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  /// Serializes this PhotoDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PhotoDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PhotoDtoCopyWith<PhotoDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotoDtoCopyWith<$Res> {
  factory $PhotoDtoCopyWith(PhotoDto value, $Res Function(PhotoDto) then) =
      _$PhotoDtoCopyWithImpl<$Res, PhotoDto>;
  @useResult
  $Res call(
      {String id,
      String url,
      @FirestoreTimestampConverter() DateTime createdAt,
      @FirestoreTimestampConverter() DateTime updatedAt,
      FilterDto filter,
      DateTime? deletedAt});

  $FilterDtoCopyWith<$Res> get filter;
}

/// @nodoc
class _$PhotoDtoCopyWithImpl<$Res, $Val extends PhotoDto>
    implements $PhotoDtoCopyWith<$Res> {
  _$PhotoDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PhotoDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? url = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? filter = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as FilterDto,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of PhotoDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FilterDtoCopyWith<$Res> get filter {
    return $FilterDtoCopyWith<$Res>(_value.filter, (value) {
      return _then(_value.copyWith(filter: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PhotoDtoImplCopyWith<$Res>
    implements $PhotoDtoCopyWith<$Res> {
  factory _$$PhotoDtoImplCopyWith(
          _$PhotoDtoImpl value, $Res Function(_$PhotoDtoImpl) then) =
      __$$PhotoDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String url,
      @FirestoreTimestampConverter() DateTime createdAt,
      @FirestoreTimestampConverter() DateTime updatedAt,
      FilterDto filter,
      DateTime? deletedAt});

  @override
  $FilterDtoCopyWith<$Res> get filter;
}

/// @nodoc
class __$$PhotoDtoImplCopyWithImpl<$Res>
    extends _$PhotoDtoCopyWithImpl<$Res, _$PhotoDtoImpl>
    implements _$$PhotoDtoImplCopyWith<$Res> {
  __$$PhotoDtoImplCopyWithImpl(
      _$PhotoDtoImpl _value, $Res Function(_$PhotoDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PhotoDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? url = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? filter = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_$PhotoDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as FilterDto,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PhotoDtoImpl extends _PhotoDto {
  const _$PhotoDtoImpl(
      {required this.id,
      required this.url,
      @FirestoreTimestampConverter() required this.createdAt,
      @FirestoreTimestampConverter() required this.updatedAt,
      required this.filter,
      this.deletedAt})
      : super._();

  factory _$PhotoDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PhotoDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String url;
  @override
  @FirestoreTimestampConverter()
  final DateTime createdAt;
  @override
  @FirestoreTimestampConverter()
  final DateTime updatedAt;
  @override
  final FilterDto filter;
  @override
  final DateTime? deletedAt;

  @override
  String toString() {
    return 'PhotoDto(id: $id, url: $url, createdAt: $createdAt, updatedAt: $updatedAt, filter: $filter, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhotoDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.filter, filter) || other.filter == filter) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, url, createdAt, updatedAt, filter, deletedAt);

  /// Create a copy of PhotoDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PhotoDtoImplCopyWith<_$PhotoDtoImpl> get copyWith =>
      __$$PhotoDtoImplCopyWithImpl<_$PhotoDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PhotoDtoImplToJson(
      this,
    );
  }
}

abstract class _PhotoDto extends PhotoDto {
  const factory _PhotoDto(
      {required final String id,
      required final String url,
      @FirestoreTimestampConverter() required final DateTime createdAt,
      @FirestoreTimestampConverter() required final DateTime updatedAt,
      required final FilterDto filter,
      final DateTime? deletedAt}) = _$PhotoDtoImpl;
  const _PhotoDto._() : super._();

  factory _PhotoDto.fromJson(Map<String, dynamic> json) =
      _$PhotoDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get url;
  @override
  @FirestoreTimestampConverter()
  DateTime get createdAt;
  @override
  @FirestoreTimestampConverter()
  DateTime get updatedAt;
  @override
  FilterDto get filter;
  @override
  DateTime? get deletedAt;

  /// Create a copy of PhotoDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PhotoDtoImplCopyWith<_$PhotoDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
