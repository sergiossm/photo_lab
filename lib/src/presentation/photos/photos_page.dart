import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_lab/src/application/permission/providers.dart';
import 'package:photo_lab/src/application/photo/providers.dart';
import 'package:photo_lab/src/domain/permission/value_objects/status.dart';
import 'package:photo_lab/src/domain/permission/value_objects/type.dart';
import 'package:photo_lab/src/presentation/routing/params/photos_params.dart';
import 'package:photo_lab/src/presentation/routing/routes/routes.dart';
import 'package:photo_lab/src/presentation/shared/extensions/l10n_extensions.dart';
import 'package:ui_kit/ui_kit.dart';

part 'widgets/import_from.dart';
part 'widgets/my_edits.dart';

class PhotosPage extends StatelessWidget {
  const PhotosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text(context.loc.photos),
            floating: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                AppSpacing.vertical.s5,
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSizes.s5),
                  child: _ImportFrom(),
                ),
                AppSpacing.vertical.s8,
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSizes.s5),
                  child: _MyEdits(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
