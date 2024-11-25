import 'package:fpdart/fpdart.dart';
import 'package:photo_lab/src/domain/authentication/facades/i_authentication_facade.dart';
import 'package:photo_lab/src/domain/user/entities/user.dart';
import 'package:photo_lab/src/domain/user/repositories/i_user_repository.dart';
import 'package:rxdart/rxdart.dart';

class UserService {
  UserService({
    required IAuthenticationFacade authenticationFacade,
    required IUserRepository userRepository,
  })  : _authenticationFacade = authenticationFacade,
        _userRepository = userRepository;

  final IUserRepository _userRepository;
  final IAuthenticationFacade _authenticationFacade;

  Stream<Option<User>> watchSignedInUser() =>
      _authenticationFacade.authStateChanges().transform(
            SwitchMapStreamTransformer(
              (userIdOption) => userIdOption.fold(
                () => Stream.value(none<User>()),
                (authUser) {
                  return _userRepository.watchUser(authUser.id);
                },
              ),
            ),
          );
}
