import 'package:fpdart/fpdart.dart';
import 'package:photo_lab/src/domain/authentication/facades/i_authentication_facade.dart';
import 'package:photo_lab/src/domain/shared/value_objects/unique_id.dart';
import 'package:photo_lab/src/domain/user/entities/user.dart';
import 'package:photo_lab/src/domain/user/repositories/i_user_repository.dart';

class AuthenticationService {
  AuthenticationService({
    required IAuthenticationFacade authenticationFacade,
    required IUserRepository userRepository,
  })  : _authenticationFacade = authenticationFacade,
        _userRepository = userRepository;

  final IAuthenticationFacade _authenticationFacade;
  final IUserRepository _userRepository;

  bool get isAuthenticated => _authenticationFacade.getSignedInUser().isSome();

  Option<UniqueId> get userId => _authenticationFacade.getSignedInUser().fold(none, (a) => some(a.id));

  Future<Either<String, Unit>> signInWithGoogle() async {
    return (await _authenticationFacade.signInWithGoogle()).fold(
      (l) => left('Error signing in with Google'),
      (authUserOption) {
        return authUserOption.fold(
          () => right(unit),
          (authUser) async {
            final user = User.fromAuthenticationUser(authUser);
            return (await _userRepository.upsertUser(user)).fold(
              (l) => left('Error signing in with Google'),
              (_) => right(unit),
            );
          },
        );
      },
    );
  }

  Future<void> signOut() async {
    await _authenticationFacade.signOut();
  }
}
