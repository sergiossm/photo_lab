import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_lab/src/application/authentication/authentication_service.dart';
import 'package:photo_lab/src/application/user/providers.dart';
import 'package:photo_lab/src/domain/authentication/facades/i_authentication_facade.dart';
import 'package:photo_lab/src/infrastructure/authentication/data_sources/firebase_authentication_data_source.dart';
import 'package:photo_lab/src/infrastructure/authentication/facades/authentication_facade.dart';

final authenticationFacadeProvider = Provider<IAuthenticationFacade>((ref) {
  return AuthenticationFacade(
    remoteDataSource: FirebaseAuthenticationDataSource(),
  );
});

final authenticationServiceProvider = Provider<AuthenticationService>((ref) {
  return AuthenticationService(
    authenticationFacade: ref.watch(authenticationFacadeProvider),
    userRepository: ref.watch(userRepositoryProvider),
  );
});
