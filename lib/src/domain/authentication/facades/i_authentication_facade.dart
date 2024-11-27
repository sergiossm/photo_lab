import 'package:fpdart/fpdart.dart';
import 'package:photo_lab/src/domain/authentication/entities/authentication_user.dart';
import 'package:photo_lab/src/domain/shared/failures/failure.dart';

abstract class IAuthenticationFacade {
  Future<Either<Failure, Option<AuthenticationUser>>> signInWithGoogle();
  Option<AuthenticationUser> getSignedInUser();
  Stream<Option<AuthenticationUser>> authStateChanges();
  Future<Unit> signOut();
}
