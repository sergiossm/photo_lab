import 'package:go_router/go_router.dart';
import 'package:photo_lab/src/presentation/photos/photos_page.dart';
import 'package:photo_lab/src/presentation/routing/routes/routes.dart';

abstract class PhotosRouter {
  static GoRoute get base {
    return GoRoute(
      path: Routes.homePhotos.path,
      name: Routes.homePhotos.name,
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: PhotosPage()),
    );
  }
}
