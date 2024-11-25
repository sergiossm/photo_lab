// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authentication_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthenticationUser {
  UniqueId get id => throw _privateConstructorUsedError;
  EmailAddress get emailAddress => throw _privateConstructorUsedError;
  Uri? get photoUrl => throw _privateConstructorUsedError;
  String? get displayName => throw _privateConstructorUsedError;

  /// Create a copy of AuthenticationUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthenticationUserCopyWith<AuthenticationUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationUserCopyWith<$Res> {
  factory $AuthenticationUserCopyWith(
          AuthenticationUser value, $Res Function(AuthenticationUser) then) =
      _$AuthenticationUserCopyWithImpl<$Res, AuthenticationUser>;
  @useResult
  $Res call(
      {UniqueId id,
      EmailAddress emailAddress,
      Uri? photoUrl,
      String? displayName});
}

/// @nodoc
class _$AuthenticationUserCopyWithImpl<$Res, $Val extends AuthenticationUser>
    implements $AuthenticationUserCopyWith<$Res> {
  _$AuthenticationUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthenticationUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? emailAddress = null,
    Object? photoUrl = freezed,
    Object? displayName = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      emailAddress: null == emailAddress
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as Uri?,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthenticationUserImplCopyWith<$Res>
    implements $AuthenticationUserCopyWith<$Res> {
  factory _$$AuthenticationUserImplCopyWith(_$AuthenticationUserImpl value,
          $Res Function(_$AuthenticationUserImpl) then) =
      __$$AuthenticationUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UniqueId id,
      EmailAddress emailAddress,
      Uri? photoUrl,
      String? displayName});
}

/// @nodoc
class __$$AuthenticationUserImplCopyWithImpl<$Res>
    extends _$AuthenticationUserCopyWithImpl<$Res, _$AuthenticationUserImpl>
    implements _$$AuthenticationUserImplCopyWith<$Res> {
  __$$AuthenticationUserImplCopyWithImpl(_$AuthenticationUserImpl _value,
      $Res Function(_$AuthenticationUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthenticationUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? emailAddress = null,
    Object? photoUrl = freezed,
    Object? displayName = freezed,
  }) {
    return _then(_$AuthenticationUserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      emailAddress: null == emailAddress
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as Uri?,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AuthenticationUserImpl implements _AuthenticationUser {
  const _$AuthenticationUserImpl(
      {required this.id,
      required this.emailAddress,
      this.photoUrl,
      this.displayName});

  @override
  final UniqueId id;
  @override
  final EmailAddress emailAddress;
  @override
  final Uri? photoUrl;
  @override
  final String? displayName;

  @override
  String toString() {
    return 'AuthenticationUser(id: $id, emailAddress: $emailAddress, photoUrl: $photoUrl, displayName: $displayName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticationUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.emailAddress, emailAddress) ||
                other.emailAddress == emailAddress) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, emailAddress, photoUrl, displayName);

  /// Create a copy of AuthenticationUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthenticationUserImplCopyWith<_$AuthenticationUserImpl> get copyWith =>
      __$$AuthenticationUserImplCopyWithImpl<_$AuthenticationUserImpl>(
          this, _$identity);
}

abstract class _AuthenticationUser implements AuthenticationUser {
  const factory _AuthenticationUser(
      {required final UniqueId id,
      required final EmailAddress emailAddress,
      final Uri? photoUrl,
      final String? displayName}) = _$AuthenticationUserImpl;

  @override
  UniqueId get id;
  @override
  EmailAddress get emailAddress;
  @override
  Uri? get photoUrl;
  @override
  String? get displayName;

  /// Create a copy of AuthenticationUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthenticationUserImplCopyWith<_$AuthenticationUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
