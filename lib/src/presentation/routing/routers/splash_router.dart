import 'package:go_router/go_router.dart';
import 'package:photo_lab/src/presentation/routing/routes/routes.dart';
import 'package:photo_lab/src/presentation/splash/splash_page.dart';

abstract class SplashRouter {
  static GoRoute get route => GoRoute(
        path: Routes.splash.path,
        name: Routes.splash.name,
        pageBuilder: (context, state) => NoTransitionPage(
          key: state.pageKey,
          child: const SplashPage(),
        ),
      );
}
