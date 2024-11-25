import 'package:photo_lab/src/presentation/routing/routes/authentication_routes.dart';
import 'package:photo_lab/src/presentation/routing/routes/photos_routes.dart';
import 'package:photo_lab/src/presentation/routing/routes/settings_routes.dart';
import 'package:photo_lab/src/presentation/routing/routes/splash_routes.dart';

enum Routes {
  splash(SplashRoutes.base),
  authenticationLanding(AuthenticationRoutes.landing),
  authSignInSignUp(AuthenticationRoutes.signInSignUp),
  homePhotos(PhotosRoutes.base),
  homeSettings(SettingsRoutes.base);

  const Routes(this.path);

  final String path;
}
