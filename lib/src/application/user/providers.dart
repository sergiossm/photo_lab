import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_lab/src/application/authentication/providers.dart';
import 'package:photo_lab/src/application/user/contollers/user_controller.dart';
import 'package:photo_lab/src/application/user/services/user_service.dart';
import 'package:photo_lab/src/application/user/states/user_state.dart';
import 'package:photo_lab/src/domain/user/repositories/i_user_repository.dart';
import 'package:photo_lab/src/infrastructure/user/data_sources/firestore_user_data_source.dart';
import 'package:photo_lab/src/infrastructure/user/repositories/user_repository.dart';

//
// Repositories
final userRepositoryProvider = Provider<IUserRepository>((ref) {
  return UserRepository(remoteDataSource: FirestoreUserDataSource());
});

//
// Services
final userServiceProvider = Provider<UserService>((ref) {
  return UserService(
    userRepository: ref.watch(userRepositoryProvider),
    authenticationFacade: ref.watch(authenticationFacadeProvider),
  );
});

//
// Controllers
final userControllerProvider = StateNotifierProvider<UserController, UserState>((ref) {
  return UserController(
    userService: ref.watch(userServiceProvider),
  );
});
