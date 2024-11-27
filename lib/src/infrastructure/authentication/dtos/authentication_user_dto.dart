import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:photo_lab/src/domain/authentication/dtos/i_authentication_user_dto.dart';
import 'package:photo_lab/src/domain/authentication/entities/authentication_user.dart';
import 'package:photo_lab/src/domain/shared/value_objects/email_address.dart';
import 'package:photo_lab/src/domain/shared/value_objects/unique_id.dart';

part 'authentication_user_dto.freezed.dart';

@freezed
class AuthenticationUserDto
    with _$AuthenticationUserDto
    implements IAuthenticationUserDto {
  const factory AuthenticationUserDto({
    required String id,
    required String email,
    required String? displayName,
    required String? photoUrl,
  }) = _AuthenticationUserDto;

  const AuthenticationUserDto._();

  factory AuthenticationUserDto.fromFirebaseUser(firebase.User user) {
    return AuthenticationUserDto(
      id: user.uid,
      email: user.email ?? '',
      displayName: user.displayName,
      photoUrl: user.photoURL,
    );
  }

  @override
  AuthenticationUser toDomain() {
    return AuthenticationUser(
      id: UniqueId.fromUniqueString(id),
      emailAddress: EmailAddress(email),
      displayName: displayName,
      photoUrl: Uri.parse(photoUrl ?? ''),
    );
  }
}
