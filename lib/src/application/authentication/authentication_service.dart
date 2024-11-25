import 'package:photo_lab/src/domain/authentication/facades/i_authentication_service.dart';

class AuthenticationService {
  AuthenticationService({
    required IAuthenticationFacade authenticationFacade,
  }) : _authenticationFacade = authenticationFacade;

  final IAuthenticationFacade _authenticationFacade;

  bool get isAuthenticated =>
      _authenticationFacade.getSignedInUserId().isSome();
}
