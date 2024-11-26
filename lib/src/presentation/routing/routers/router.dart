import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:photo_lab/src/application/authentication/providers.dart';
import 'package:photo_lab/src/presentation/routing/routers/authentication_router.dart';
import 'package:photo_lab/src/presentation/routing/routers/photos_router.dart';
import 'package:photo_lab/src/presentation/routing/routers/settings_router.dart';
import 'package:photo_lab/src/presentation/routing/routers/splash_router.dart';
import 'package:photo_lab/src/presentation/routing/routes/routes.dart';
import 'package:photo_lab/src/presentation/routing/widgets/scaffold_with_nested_navigation.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorPhotosKey = GlobalKey<NavigatorState>();
final _shellNavigatorSettingsKey = GlobalKey<NavigatorState>();

final goRouterProvider = Provider<GoRouter>((ref) {
  final isAuthenticated = ref.read(authenticationServiceProvider).isAuthenticated;
  final initialRoute = !isAuthenticated ? Routes.authenticationLanding.path : Routes.splash.path;

  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: initialRoute,
    routes: [
      // Splash
      SplashRouter.route,

      // Authentication
      AuthenticationRouter.route,

      // Home
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
        },
        branches: [
          // Photos Shell
          StatefulShellBranch(
            navigatorKey: _shellNavigatorPhotosKey,
            routes: [
              PhotosRouter.base,
            ],
          ),
          // Settings Shell
          StatefulShellBranch(
            navigatorKey: _shellNavigatorSettingsKey,
            routes: [
              SettingsRouter.base,
            ],
          ),
          // Community Shell
        ],
      ),
    ],
  );
});
