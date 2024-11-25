import 'package:fpdart/fpdart.dart';
import 'package:photo_lab/src/domain/authentication/data_sources/i_authentication_remote_data_source.dart';
import 'package:photo_lab/src/domain/authentication/entities/authentication_user.dart';
import 'package:photo_lab/src/domain/authentication/facades/i_authentication_facade.dart';
import 'package:photo_lab/src/domain/shared/failures/failure.dart';
import 'package:photo_lab/src/domain/shared/value_objects/email_address.dart';
import 'package:photo_lab/src/domain/shared/value_objects/unique_id.dart';

class AuthenticationFacade implements IAuthenticationFacade {
  AuthenticationFacade({
    required IAuthenticationRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  final IAuthenticationRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, Option<AuthenticationUser>>> signInWithGoogle() async {
    try {
      final authUser = await _remoteDataSource.signInWithGoogle();
      if (authUser == null) return right(none());

      final user = AuthenticationUser(
        id: UniqueId.fromUniqueString(authUser.id),
        emailAddress: EmailAddress(authUser.email),
        photoUrl: Uri.parse(authUser.photoUrl ?? ''),
        displayName: authUser.displayName,
      );
      return right(optionOf(user));
    } catch (_) {
      return left(const Failure('Error signing in user with Google'));
    }
  }

  @override
  Option<AuthenticationUser> getSignedInUser() {
    return optionOf(_remoteDataSource.getSignedInUser()?.toDomain());
  }

  @override
  Stream<Option<AuthenticationUser>> authStateChanges() =>
      _remoteDataSource.authStateChanges().map((authUser) {
        return optionOf(authUser?.toDomain());
      });
}
