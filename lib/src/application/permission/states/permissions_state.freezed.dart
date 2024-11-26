// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'permissions_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PermissionsState {
  (PermissionStatus, bool) get cameraStatus =>
      throw _privateConstructorUsedError;
  (PermissionStatus, bool) get photosStatus =>
      throw _privateConstructorUsedError;

  /// Create a copy of PermissionsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PermissionsStateCopyWith<PermissionsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PermissionsStateCopyWith<$Res> {
  factory $PermissionsStateCopyWith(
          PermissionsState value, $Res Function(PermissionsState) then) =
      _$PermissionsStateCopyWithImpl<$Res, PermissionsState>;
  @useResult
  $Res call(
      {(PermissionStatus, bool) cameraStatus,
      (PermissionStatus, bool) photosStatus});
}

/// @nodoc
class _$PermissionsStateCopyWithImpl<$Res, $Val extends PermissionsState>
    implements $PermissionsStateCopyWith<$Res> {
  _$PermissionsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PermissionsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cameraStatus = null,
    Object? photosStatus = null,
  }) {
    return _then(_value.copyWith(
      cameraStatus: null == cameraStatus
          ? _value.cameraStatus
          : cameraStatus // ignore: cast_nullable_to_non_nullable
              as (PermissionStatus, bool),
      photosStatus: null == photosStatus
          ? _value.photosStatus
          : photosStatus // ignore: cast_nullable_to_non_nullable
              as (PermissionStatus, bool),
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PermissionsStateImplCopyWith<$Res>
    implements $PermissionsStateCopyWith<$Res> {
  factory _$$PermissionsStateImplCopyWith(_$PermissionsStateImpl value,
          $Res Function(_$PermissionsStateImpl) then) =
      __$$PermissionsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {(PermissionStatus, bool) cameraStatus,
      (PermissionStatus, bool) photosStatus});
}

/// @nodoc
class __$$PermissionsStateImplCopyWithImpl<$Res>
    extends _$PermissionsStateCopyWithImpl<$Res, _$PermissionsStateImpl>
    implements _$$PermissionsStateImplCopyWith<$Res> {
  __$$PermissionsStateImplCopyWithImpl(_$PermissionsStateImpl _value,
      $Res Function(_$PermissionsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PermissionsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cameraStatus = null,
    Object? photosStatus = null,
  }) {
    return _then(_$PermissionsStateImpl(
      cameraStatus: null == cameraStatus
          ? _value.cameraStatus
          : cameraStatus // ignore: cast_nullable_to_non_nullable
              as (PermissionStatus, bool),
      photosStatus: null == photosStatus
          ? _value.photosStatus
          : photosStatus // ignore: cast_nullable_to_non_nullable
              as (PermissionStatus, bool),
    ));
  }
}

/// @nodoc

class _$PermissionsStateImpl implements _PermissionsState {
  const _$PermissionsStateImpl(
      {this.cameraStatus = const (PermissionStatus.denied, false),
      this.photosStatus = const (PermissionStatus.denied, false)});

  @override
  @JsonKey()
  final (PermissionStatus, bool) cameraStatus;
  @override
  @JsonKey()
  final (PermissionStatus, bool) photosStatus;

  @override
  String toString() {
    return 'PermissionsState(cameraStatus: $cameraStatus, photosStatus: $photosStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PermissionsStateImpl &&
            (identical(other.cameraStatus, cameraStatus) ||
                other.cameraStatus == cameraStatus) &&
            (identical(other.photosStatus, photosStatus) ||
                other.photosStatus == photosStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cameraStatus, photosStatus);

  /// Create a copy of PermissionsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PermissionsStateImplCopyWith<_$PermissionsStateImpl> get copyWith =>
      __$$PermissionsStateImplCopyWithImpl<_$PermissionsStateImpl>(
          this, _$identity);
}

abstract class _PermissionsState implements PermissionsState {
  const factory _PermissionsState(
      {final (PermissionStatus, bool) cameraStatus,
      final (PermissionStatus, bool) photosStatus}) = _$PermissionsStateImpl;

  @override
  (PermissionStatus, bool) get cameraStatus;
  @override
  (PermissionStatus, bool) get photosStatus;

  /// Create a copy of PermissionsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PermissionsStateImplCopyWith<_$PermissionsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
