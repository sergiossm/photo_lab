import 'package:photo_lab/src/presentation/routing/routes/auth_routes.dart';
import 'package:photo_lab/src/presentation/routing/routes/splash_routes.dart';

enum Routes {
  splash(SplashRoutes.splash),
  authenticationLanding(AuthRoutes.landing),
  authSignInSignUp(AuthRoutes.signInSignUp);

  const Routes(this.path);

  final String path;
}
