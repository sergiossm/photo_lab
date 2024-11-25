import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:photo_lab/src/application/authentication/providers.dart';
import 'package:photo_lab/src/presentation/routing/routers/authentication_router.dart';
import 'package:photo_lab/src/presentation/routing/routers/splash_router.dart';
import 'package:photo_lab/src/presentation/routing/routes/routes.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final goRouterProvider = Provider<GoRouter>((ref) {
  final isAuthenticated =
      ref.read(authenticationServiceProvider).isAuthenticated;
  final initialRoute =
      !isAuthenticated ? Routes.authenticationLanding.path : Routes.splash.path;

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: initialRoute,
    routes: [
      // Splash
      SplashRouter.route,

      // Authentication
      AuthenticationRouter.route,
    ],
  );
});
