import 'package:photo_lab/src/domain/authentication/dtos/i_authentication_user_dto.dart';

abstract class IAuthenticationRemoteDataSource {
  Future<IAuthenticationUserDto?> signInWithGoogle();
  IAuthenticationUserDto? getSignedInUser();
  Stream<IAuthenticationUserDto?> authStateChanges();
  Future<void> signOut();
}
