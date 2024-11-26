import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_lab/src/application/authentication/providers.dart';
import 'package:photo_lab/src/application/photo/providers.dart';
import 'package:photo_lab/src/application/user/providers.dart';
import 'package:photo_lab/src/application/warmup/controllers/app_warmup_controller.dart';
import 'package:photo_lab/src/application/warmup/services/app_warmup_service.dart';

//
// Services
final appWarmupServiceProvider = Provider<AppWarmupService>((ref) {
  return AppWarmupService(
    isAuthenticated: ref.watch(authenticationServiceProvider).isAuthenticated,
    userController: ref.watch(userControllerProvider.notifier),
    photosController: ref.watch(photosControllerProvider.notifier),
  );
});

//
// Controllers
final appWarmupControllerProvider = StateNotifierProvider<AppWarmupController, AsyncValue<void>>(
  (ref) => AppWarmupController(
    appWarmupService: ref.watch(appWarmupServiceProvider),
  ),
);
