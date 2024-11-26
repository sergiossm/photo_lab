import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:photo_lab/src/presentation/photos/edit_photo_page.dart';
import 'package:photo_lab/src/presentation/photos/photos_page.dart';
import 'package:photo_lab/src/presentation/routing/params/photos_params.dart';
import 'package:photo_lab/src/presentation/routing/routers/router.dart';
import 'package:photo_lab/src/presentation/routing/routes/routes.dart';

abstract class PhotosRouter {
  static GoRoute get base {
    return GoRoute(
      path: Routes.homePhotos.path,
      name: Routes.homePhotos.name,
      pageBuilder: (context, state) => const NoTransitionPage(child: PhotosPage()),
      routes: [
        GoRoute(
          path: Routes.homePhotosEdit.path,
          name: Routes.homePhotosEdit.name,
          parentNavigatorKey: rootNavigatorKey,
          pageBuilder: (context, state) {
            final params = state.extra! as EditPhotoParams;

            return MaterialPage<void>(
              key: state.pageKey,
              child: EditPhotoPage(
                photo: params.photo,
                filePath: params.filePath,
              ),
            );
          },
        ),
      ],
    );
  }
}
