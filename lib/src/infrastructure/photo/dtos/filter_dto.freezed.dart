// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FilterDto _$FilterDtoFromJson(Map<String, dynamic> json) {
  return _FilerDto.fromJson(json);
}

/// @nodoc
mixin _$FilterDto {
  FilterTypeDto get type => throw _privateConstructorUsedError;
  List<double> get parameters => throw _privateConstructorUsedError;

  /// Serializes this FilterDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FilterDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FilterDtoCopyWith<FilterDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterDtoCopyWith<$Res> {
  factory $FilterDtoCopyWith(FilterDto value, $Res Function(FilterDto) then) =
      _$FilterDtoCopyWithImpl<$Res, FilterDto>;
  @useResult
  $Res call({FilterTypeDto type, List<double> parameters});
}

/// @nodoc
class _$FilterDtoCopyWithImpl<$Res, $Val extends FilterDto>
    implements $FilterDtoCopyWith<$Res> {
  _$FilterDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FilterDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? parameters = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FilterTypeDto,
      parameters: null == parameters
          ? _value.parameters
          : parameters // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FilerDtoImplCopyWith<$Res>
    implements $FilterDtoCopyWith<$Res> {
  factory _$$FilerDtoImplCopyWith(
          _$FilerDtoImpl value, $Res Function(_$FilerDtoImpl) then) =
      __$$FilerDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FilterTypeDto type, List<double> parameters});
}

/// @nodoc
class __$$FilerDtoImplCopyWithImpl<$Res>
    extends _$FilterDtoCopyWithImpl<$Res, _$FilerDtoImpl>
    implements _$$FilerDtoImplCopyWith<$Res> {
  __$$FilerDtoImplCopyWithImpl(
      _$FilerDtoImpl _value, $Res Function(_$FilerDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of FilterDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? parameters = null,
  }) {
    return _then(_$FilerDtoImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FilterTypeDto,
      parameters: null == parameters
          ? _value._parameters
          : parameters // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FilerDtoImpl extends _FilerDto {
  const _$FilerDtoImpl(
      {required this.type, required final List<double> parameters})
      : _parameters = parameters,
        super._();

  factory _$FilerDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$FilerDtoImplFromJson(json);

  @override
  final FilterTypeDto type;
  final List<double> _parameters;
  @override
  List<double> get parameters {
    if (_parameters is EqualUnmodifiableListView) return _parameters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_parameters);
  }

  @override
  String toString() {
    return 'FilterDto(type: $type, parameters: $parameters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilerDtoImpl &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other._parameters, _parameters));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, type, const DeepCollectionEquality().hash(_parameters));

  /// Create a copy of FilterDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FilerDtoImplCopyWith<_$FilerDtoImpl> get copyWith =>
      __$$FilerDtoImplCopyWithImpl<_$FilerDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FilerDtoImplToJson(
      this,
    );
  }
}

abstract class _FilerDto extends FilterDto {
  const factory _FilerDto(
      {required final FilterTypeDto type,
      required final List<double> parameters}) = _$FilerDtoImpl;
  const _FilerDto._() : super._();

  factory _FilerDto.fromJson(Map<String, dynamic> json) =
      _$FilerDtoImpl.fromJson;

  @override
  FilterTypeDto get type;
  @override
  List<double> get parameters;

  /// Create a copy of FilterDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FilerDtoImplCopyWith<_$FilerDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
