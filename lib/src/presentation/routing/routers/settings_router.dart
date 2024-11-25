import 'package:go_router/go_router.dart';
import 'package:photo_lab/src/presentation/routing/routes/routes.dart';
import 'package:photo_lab/src/presentation/settings/settings_page.dart';

abstract class SettingsRouter {
  static GoRoute get base {
    return GoRoute(
      path: Routes.homeSettings.path,
      name: Routes.homeSettings.name,
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: SettingsPage()),
    );
  }
}
