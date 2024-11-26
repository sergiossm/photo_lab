// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'photos_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PhotosState {
  AsyncValue<List<Photo>> get userPhotos => throw _privateConstructorUsedError;

  /// Create a copy of PhotosState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PhotosStateCopyWith<PhotosState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotosStateCopyWith<$Res> {
  factory $PhotosStateCopyWith(
          PhotosState value, $Res Function(PhotosState) then) =
      _$PhotosStateCopyWithImpl<$Res, PhotosState>;
  @useResult
  $Res call({AsyncValue<List<Photo>> userPhotos});
}

/// @nodoc
class _$PhotosStateCopyWithImpl<$Res, $Val extends PhotosState>
    implements $PhotosStateCopyWith<$Res> {
  _$PhotosStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PhotosState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userPhotos = null,
  }) {
    return _then(_value.copyWith(
      userPhotos: null == userPhotos
          ? _value.userPhotos
          : userPhotos // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<Photo>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PhotosStateImplCopyWith<$Res>
    implements $PhotosStateCopyWith<$Res> {
  factory _$$PhotosStateImplCopyWith(
          _$PhotosStateImpl value, $Res Function(_$PhotosStateImpl) then) =
      __$$PhotosStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AsyncValue<List<Photo>> userPhotos});
}

/// @nodoc
class __$$PhotosStateImplCopyWithImpl<$Res>
    extends _$PhotosStateCopyWithImpl<$Res, _$PhotosStateImpl>
    implements _$$PhotosStateImplCopyWith<$Res> {
  __$$PhotosStateImplCopyWithImpl(
      _$PhotosStateImpl _value, $Res Function(_$PhotosStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PhotosState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userPhotos = null,
  }) {
    return _then(_$PhotosStateImpl(
      userPhotos: null == userPhotos
          ? _value.userPhotos
          : userPhotos // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<Photo>>,
    ));
  }
}

/// @nodoc

class _$PhotosStateImpl implements _PhotosState {
  const _$PhotosStateImpl(
      {this.userPhotos = const AsyncLoading<List<Photo>>()});

  @override
  @JsonKey()
  final AsyncValue<List<Photo>> userPhotos;

  @override
  String toString() {
    return 'PhotosState(userPhotos: $userPhotos)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhotosStateImpl &&
            (identical(other.userPhotos, userPhotos) ||
                other.userPhotos == userPhotos));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userPhotos);

  /// Create a copy of PhotosState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PhotosStateImplCopyWith<_$PhotosStateImpl> get copyWith =>
      __$$PhotosStateImplCopyWithImpl<_$PhotosStateImpl>(this, _$identity);
}

abstract class _PhotosState implements PhotosState {
  const factory _PhotosState({final AsyncValue<List<Photo>> userPhotos}) =
      _$PhotosStateImpl;

  @override
  AsyncValue<List<Photo>> get userPhotos;

  /// Create a copy of PhotosState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PhotosStateImplCopyWith<_$PhotosStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
