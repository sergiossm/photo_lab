import 'package:fpdart/fpdart.dart';
import 'package:photo_lab/src/domain/authentication/facades/i_authentication_facade.dart';

class AuthenticationService {
  AuthenticationService({
    required IAuthenticationFacade authenticationFacade,
  }) : _authenticationFacade = authenticationFacade;

  final IAuthenticationFacade _authenticationFacade;

  bool get isAuthenticated =>
      _authenticationFacade.getSignedInUserId().isSome();

  Future<Either<String, Unit>> signInWithGoogle() async {
    return (await _authenticationFacade.signInWithGoogle()).fold(
      (l) => left('Error signing in with Google'),
      (r) => right(unit),
    );
  }
}
