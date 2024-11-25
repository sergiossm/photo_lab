import 'package:fpdart/fpdart.dart';
import 'package:photo_lab/src/domain/authentication/data_sources/i_authentication_remote_data_source.dart';
import 'package:photo_lab/src/domain/authentication/facades/i_authentication_facade.dart';
import 'package:photo_lab/src/domain/shared/failures/failure.dart';
import 'package:photo_lab/src/domain/shared/value_objects/unique_id.dart';

class AuthenticationFacade implements IAuthenticationFacade {
  AuthenticationFacade({
    required IAuthenticationRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  final IAuthenticationRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, UniqueId>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final result =
          await _remoteDataSource.signInWithEmailAndPassword(email, password);
      return right(UniqueId.fromUniqueString(result));
    } catch (_) {
      return left(Failure('Error signing in user with email $email'));
    }
  }

  @override
  Future<Either<Failure, Option<UniqueId>>> signInWithGoogle() async {
    try {
      final result = await _remoteDataSource.signInWithGoogle();
      if (result == null) return right(none());
      return right(optionOf(UniqueId.fromUniqueString(result)));
    } catch (_) {
      return left(const Failure('Error signing in user with Google'));
    }
  }

  @override
  Stream<Option<UniqueId>> authStateChanges() => _remoteDataSource
      .authStateChanges()
      .map(
        (userId) =>
            optionOf(userId == null ? null : UniqueId.fromUniqueString(userId)),
      );

  @override
  Option<UniqueId> getSignedInUserId() {
    final id = _remoteDataSource.getSignedInUser();
    return optionOf(id == null ? null : UniqueId.fromUniqueString(id));
  }

  @override
  Future<Either<Failure, Unit>> sendPasswordResetEmail(String email) {
    // TODO: implement sendPasswordResetEmail
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> signOut() async {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}
