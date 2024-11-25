import 'package:photo_lab/src/domain/authentication/entities/authentication_user.dart';

abstract class IAuthenticationUserDto {
  String get id;
  String get email;
  String? get displayName;
  String? get photoUrl;

  AuthenticationUser toDomain();
}
