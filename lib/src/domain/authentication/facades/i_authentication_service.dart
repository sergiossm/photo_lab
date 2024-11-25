import 'package:fpdart/fpdart.dart';
import 'package:photo_lab/src/domain/shared/failures/failure.dart';
import 'package:photo_lab/src/domain/shared/value_objects/unique_id.dart';

abstract class IAuthenticationFacade {
  Future<Either<Failure, UniqueId>> signInWithEmailAndPassword(
    String email,
    String password,
  );
  // Future<Either<Failure, UniqueId>> signUpWithEmailAndPassword(
  //     EmailAddress email, Password password);
  Future<Either<Failure, Unit>> sendPasswordResetEmail(String email);
  Future<Either<Failure, Unit>> signOut();
  Stream<Option<UniqueId>> authStateChanges();
  Option<UniqueId> getSignedInUserId();
}
